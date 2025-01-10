package com.bit.board.service;

import com.bit.board.model.BoardDTO;
import com.bit.board.model.ReplyDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ReplyService {
    @Autowired
    private SqlSession sqlSession;
    private final String NAMESPACE = "mappers.ReplyMapper";

    // 댓글 조회/삽입/수정/삭제
    public ReplyDTO selectOne(int id) {
        return sqlSession.selectOne(NAMESPACE + ".selectOne", id);
    }

    // 특정 게시글에 대한 모든 댓글 조회 메서드
    public List<ReplyDTO> selectAll(int boardId) {
        return sqlSession.selectList(NAMESPACE + ".selectAll", boardId);
    }
    public void insert(ReplyDTO replyDTO) {
        sqlSession.insert(NAMESPACE + ".insert", replyDTO);
    }

    public void update(ReplyDTO replyDTO) {
        sqlSession.update(NAMESPACE + ".update", replyDTO);
    }

    public void delete(int id) {
        sqlSession.delete(NAMESPACE + ".delete", id);
    }

}
