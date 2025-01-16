package com.bit.board.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

// 컨트롤러들은 사용자가 요청한 URL에 대해 어떤 메소드를 실행시킬지 매핑함
// 컨트롤러 최상위에 @Controller를 붙여서 스프링이 자체적으로 관리하도록 함
@Controller
public class HomeController {
    @Value("${kakao.key}")
    private String apikey;

    // 사용자가 가장 처음 "loclahost:8080"으로 입력할 때 실행될 메소드
    @GetMapping("/")
    public String showIndex(Model model) {
        model.addAttribute("REST_API_KEY", apikey);
        model.addAttribute("REDIRECT_URI", "http://localhost:8080/user/kakaoAuth");
        return "index";
    }
}
