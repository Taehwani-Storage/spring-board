package com.bit.board.controller;

import com.bit.board.model.UserDTO;
import com.bit.board.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Value("${kakao.key}")
    private String apikey;

    // 주소가 index -> user/auth 변경 및 데이터 입력 가능
    // URL을 읽어서 JSP 페이지로 보여주는 기능
    @PostMapping("auth")
    public String auth(UserDTO userDTO, HttpSession session) {
        UserDTO result = userService.auth(userDTO);
        if (result != null) { // 로그인 성공
            session.setAttribute("logIn", result);

            return "redirect:/board/showAll";
        }
        return "index";
    }

    @GetMapping("register")
    public String register() {
        return "user/register";
    }

    @PostMapping("register")
    public String register(Model model, UserDTO userDTO) {
        System.out.println(userDTO);
        // 만약 사용자가 입력한 username이 중복이면
        // 회원가입 페이지로 다시 가서 "해당 아이디는 중복입니다."를 띄어주자
        // 우리가 메소드에서 뷰로 어떠한 값을 넘겨줄 때에는 파라미터로 Model을 추가해
        // 해당 모델에 전달할 값을 저장 (기존에 생성한 Model과 다름)
        if (!userService.validateUsername(userDTO.getUsername())) {
            model.addAttribute("message", "중복된 아이디입니다.");
            model.addAttribute("userDTO", userDTO);
            return "user/register";
        } else if (!userService.validateNickname(userDTO.getNickname())) {
            model.addAttribute("message", "중복된 닉네임입니다.");
            model.addAttribute("userDTO", userDTO);
            return "user/register";
        }

        userService.register(userDTO);

        // 맨 앞에 redirect: 가 붙으면 특정 뷰 파일을 불러오는 것이 아닌
        // 주소를 이동시켜서 해당 주소에 맞는 메소드가 실행되도록 함
        return "redirect:/"; // 수행이 끝나고 다시 메인 페이지로 전환할 때 주로 사용
    }

    @GetMapping("kakaoAuth")
    public String kakaoAuth(String code, HttpSession session) throws JsonProcessingException {
        // 위에서 받은 code를 사용하여 카카오로부터 인증 토큰의 값을 받아옴.
        HttpHeaders codeHeader = new HttpHeaders();
        codeHeader.add("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");

        // 인증 토큰에 필요한 값을 Httpbody를 만들어서 그 안에 저장
        MultiValueMap<String, String> valueMap = new LinkedMultiValueMap<>();
        valueMap.add("grant_type", "authorization_code");
        valueMap.add("client_id", apikey);
        valueMap.add("redirect_uri", "http://localhost:8080/user/kakaoAuth");
        valueMap.add("code", code);

        HttpEntity<MultiValueMap<String, String>> kakaoTokenReq = new HttpEntity<>(valueMap, codeHeader);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenReq,
                String.class
        );

        String body = response.getBody();
        // jackson: 자바에서 JSON의 값을 다룰 때 흔히 사용되는 라이브러리
        // JSON형태의 스트링을 객체로 바꾸거나 객체를 JSON 형태로 바꿀 때 주로 사용
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(body);

        String accessToken = jsonNode.get("access_token").asText();

        // 카카오 로그인을 한 사람이 누구인지 받아오기 위하나 API서버 주소
        String url = "https://kapi.kakao.com/v2/user/me";
        // 위의 URL 통신을 하기 위해 HttpHeader 만들기
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
        // 위의 headers의 정보를 사용해 kakao api 서버와 통신함
        HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(headers);
        restTemplate = new RestTemplate();
        response = restTemplate.exchange(
                url,
                HttpMethod.POST,
                httpEntity,
                String.class
        );
        
        // 위의 응답을 담당하는 객체 response로 실제 값이 담긴 body를 불러옴
        String responseBody = response.getBody();

        // 위에서 나온 응답을 쪼개어 우리가 원하는 값으로 매핑
        // responseBody: {"id":3878804228,"connected_at":"2025-01-15T01:41:37Z",
        // "properties":{"nickname":"태환"},
        // "kakao_account":{"profile_nickname_needs_agreement":false,
        // "profile":{"nickname":"태환","is_default_nickname":false},
        // "has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":"4kakao1@daum.net"}
        // }
        jsonNode = objectMapper.readTree(responseBody);
        String email = jsonNode.get("kakao_account").get("email").asText();

        // 위의 이메일 주소를 토대로 일치하는 회원 찾기
        UserDTO logIn = userService.selectByEmail(email);
        // 로그인 하기
        if (logIn != null) {
            session.setAttribute("logIn", logIn);
            return "redirect:/board/showAll";

        }
        // 종료.

        return "redirect:/";
    }
}
