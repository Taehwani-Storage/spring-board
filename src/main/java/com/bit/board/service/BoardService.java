package com.bit.board.service;

import com.bit.board.model.BoardDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.NamedBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BoardService {
    @Autowired
    private SqlSession sqlSession;
    private final String NAMESPACE = "mappers.BoardMapper";
    // 페이지당 보여줄 글의 개수
    private final int SIZE = 15;

    public int countMax() {
        int maxRow = sqlSession.selectOne(NAMESPACE + ".count");

        return maxRow % SIZE == 0 ? maxRow / SIZE : maxRow / SIZE + 1;
    }

    // 게시글 전체 불러오기
    public List<BoardDTO> selectAll(int pageNo) {
        HashMap<String, Integer> paramMap = new HashMap<>();
        paramMap.put("size", SIZE);
        paramMap.put("startRow", (pageNo - 1) * SIZE);
        return sqlSession.selectList(NAMESPACE + ".selectAll", paramMap);
    }
    // 게시글 하나씩 불러오기
    public BoardDTO selectOne(int id) {
        return sqlSession.selectOne(NAMESPACE + ".selectOne", id);
    }

    public void insert(BoardDTO boardDTO) {
        sqlSession.insert(NAMESPACE + ".insert", boardDTO);
    }

    public void update(BoardDTO boardDTO) {
        sqlSession.update(NAMESPACE + ".update", boardDTO);
    }

    public void delete(int id) {
        sqlSession.delete(NAMESPACE + ".delete", id);
    }

}
