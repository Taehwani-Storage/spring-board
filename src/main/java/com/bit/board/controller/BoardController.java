package com.bit.board.controller;

import com.bit.board.model.BoardDTO;
import com.bit.board.model.UserDTO;
import com.bit.board.service.BoardService;
import jakarta.servlet.http.HttpSession;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/board/")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("showAll")
    public String showAll() {
        return "redirect:/board/showAll/1";
    }

    @GetMapping("showAll/{pageNo}")
    public String showAll(@PathVariable int pageNo, HttpSession session, Model model) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
//        if (logIn == null) {
//            return "redirect:/";
//        }
        int maxPage = boardService.countMax();

        int startPage;
        int endPage;
        if (pageNo <= 3) {
            startPage = 1;
            endPage = 5;
        } else if (pageNo >= maxPage - 2) {
            startPage = maxPage - 4;
            endPage = maxPage;
        } else {
            startPage = pageNo - 2;
            endPage = pageNo + 2;
        }

        List<BoardDTO> list = boardService.selectAll(pageNo);
        model.addAttribute("list", list);
        model.addAttribute("maxPage", maxPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("currentPage", pageNo);

        return "/board/showAll";
    }

    @GetMapping("showOne/{id}")
    public String showOne(@PathVariable int id, Model model, HttpSession session) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) { // 로그인 상태가 아니라면 index로 돌아감
            return "redirect:/";
        }
        BoardDTO boardDTO = boardService.selectOne(id);
        model.addAttribute("boardDTO", boardDTO);

        return "/board/showOne";
    }

    @GetMapping("write")
    public String write(HttpSession session) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) { // 로그인 상태가 아니라면 index로 돌아감
            return "redirect:/";
        }
        return "/board/write";
    }

    @PostMapping("write")
    public String write(BoardDTO boardDTO, HttpSession session) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) { // 로그인 상태가 아니라면 index로 돌아감
            return "redirect:/";
        }
        boardDTO.setWriterId(logIn.getId());
        boardService.insert(boardDTO);

        return "redirect:/board/showOne/" + boardDTO.getId();
    }

    @GetMapping("update/{id}")
    public String showUpdate(@PathVariable int id, Model model, HttpSession session) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) { // 로그인 상태가 아니라면 index로 돌아감
            return "redirect:/";
        }
        BoardDTO boardDTO = boardService.selectOne(id);
        model.addAttribute("boardDTO", boardDTO);

        return "/board/update";

    }

    @PostMapping("update/{id}")
    public String update(@PathVariable int id, BoardDTO boardDTO, HttpSession session) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) { // 로그인 상태가 아니라면 index로 돌아감
            return "redirect:/";
        }
        if (boardService.selectOne(id).getWriterId() != logIn.getId()) {
            return "redirect:/board/showOne/" + id;
        }
        boardDTO.setId(id);
        boardService.update(boardDTO);

        return "redirect:/board/showOne/" + id;
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable int id, HttpSession session) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) { // 로그인 상태가 아니라면 index로 돌아감
            return "redirect:/";
        }

        if(boardService.selectOne(id).getWriterId() != logIn.getId()) {
            return "redirect:/board/showOne/" + id;
        }
        boardService.delete(id);

        return "redirect:/board/showAll";
    }
}
