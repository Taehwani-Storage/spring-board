package com.bit.board.controller;

import com.bit.board.model.ReplyDTO;
import com.bit.board.model.UserDTO;
import com.bit.board.service.ReplyService;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/reply")
public class ReplyController {
    @Autowired
    private ReplyService replyService;

    // 댓글 작성
    @PostMapping("/write")
    public String write(@PathVariable ReplyDTO replyDTO, HttpSession session) {
        // 로그인 사용자 정보 확인
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            return "redirect:/"; // 로그인하지 않은 경우 홈으로 리다이렉트
        }

        // 댓글 작성자 ID 설정
        replyDTO.setWriterId(logIn.getId()); // UserDTO에서 ID를 가져와 설정

        replyService.insert(replyDTO); // 댓글 삽입

        // 댓글 작성 후 해당 게시글로 리다이렉트
        return "redirect:/board/showOne/" + replyDTO.getBoardId(); // 게시글 ID를 포함하여 리다이렉트
    }

    // 특정 게시글의 댓글 목록 조회
    @GetMapping("/list/{boardId}")
    public String list(@PathVariable int boardId, Model model) {
        List<ReplyDTO> replies = replyService.selectAll(boardId); // 댓글 목록 조회
        model.addAttribute("replies", replies); // 모델에 댓글 목록 추가
        return "/board/showOne"; // 댓글 목록을 보여줄 JSP 페이지
    }

    // 댓글 수정
    @PostMapping("/update")
    public String update(@PathVariable ReplyDTO replyDTO) {
        replyService.update(replyDTO); // 댓글 수정
        return "redirect:/board/showOne/" + replyDTO.getBoardId(); // 수정 후 게시글로 리다이렉트
    }

    // 댓글 삭제
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        ReplyDTO reply = replyService.selectOne(id); // 삭제할 댓글 정보 조회
        replyService.delete(id); // 댓글 삭제

        return "redirect:/board/showOne/"; // 삭제 후 게시글로 리다이렉트
    }
}
