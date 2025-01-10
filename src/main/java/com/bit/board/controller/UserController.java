package com.bit.board.controller;

import com.bit.board.model.UserDTO;
import com.bit.board.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    // 주소가 index -> user/auth 변경 및 데이터 입력 가능
    // URL을 읽어서 JSP 페이지로 보여주는 기능
    @PostMapping("/auth")
    public String auth(UserDTO userDTO, HttpSession session) {
        UserDTO result = userService.auth(userDTO);
        if(result != null) { // 로그인 성공
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

}
