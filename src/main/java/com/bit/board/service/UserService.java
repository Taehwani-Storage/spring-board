package com.bit.board.service;

import com.bit.board.model.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// SqlSession 사용하여 DB와 통신 처리 클래스
// 컨트롤러한테는 @Controller
// 서비스에는 @Service
@Service
public class UserService {
    // @Autowired 스프링에서 관리하는 객체 중에 일치하는 객체를 자동으로 "주입"하는 어노테이션
    @Autowired
    private SqlSession sqlSession;
    private final String NAMESPACE = "mappers.UserMapper";

    public UserDTO auth(UserDTO userDTO) {
        return sqlSession.selectOne(NAMESPACE + ".auth", userDTO); // "." 중요!!

    }

    public boolean validateUsername(String username) {
        return sqlSession.selectOne(NAMESPACE + ".validateUsername", username) == null;
    }

    public boolean validateNickname(String nickname) {
        return sqlSession.selectOne(NAMESPACE + ".validateNickname", nickname) == null;
    }

    public void register(UserDTO userDTO) {
        sqlSession.insert(NAMESPACE + ".register", userDTO);
    }

    public UserDTO selectByEmail(String email) {
        return sqlSession.selectOne(NAMESPACE + ".selectByEmail", email);
    }
}

