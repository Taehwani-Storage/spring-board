# 📝 Spring 게시판 미니 프로젝트

이 프로젝트는 **Spring Framework**를 활용하여 게시판 기능을 구현한 웹 애플리케이션입니다.  
사용자는 **게시글 조회, 작성, 수정, 삭제, 댓글 작성** 등의 기능을 사용할 수 있습니다.  

## 📌 프로젝트 환경
- **백엔드**: Spring Boot, Spring MVC, MyBatis, Lombok
- **데이터베이스**: MySQL
- **프론트엔드**: JSP, JavaScript, CSS
- **빌드 도구**: Maven
- **서버**: Tomcat

## 📂 프로젝트 폴더 구조
```
src
 ├── main
 │   ├── java/com/bit/board
 │   │   ├── controller
 │   │   │   ├── BoardController.java  # 게시글 컨트롤러
 │   │   │   ├── HomeController.java  # 홈 컨트롤러
 │   │   │   ├── ReplyController.java  # 댓글 컨트롤러
 │   │   │   ├── UserController.java  # 사용자 컨트롤러
 │   │   ├── model
 │   │   │   ├── BoardDTO.java  # 게시글 DTO
 │   │   │   ├── ReplyDTO.java  # 댓글 DTO
 │   │   │   ├── UserDTO.java  # 사용자 DTO
 │   │   ├── service
 │   │   │   ├── BoardService.java  # 게시판 서비스
 │   │   │   ├── ReplyService.java  # 댓글 서비스
 │   │   │   ├── UserService.java  # 사용자 서비스
 │   │   ├── BoardApplication.java  # Spring Boot 애플리케이션 진입점
 │   ├── resources
 │   │   ├── mybatis
 │   │   │   ├── mappers
 │   │   │   │   ├── BoardMapper.xml  # 게시글 SQL 매퍼
 │   │   │   │   ├── ReplyMapper.xml  # 댓글 SQL 매퍼
 │   │   │   │   ├── UserMapper.xml  # 사용자 SQL 매퍼
 │   │   │   ├── config.xml  # MyBatis 설정 파일
 │   │   ├── static
 │   │   │   ├── showOne.css  # CSS 스타일
 │   │   ├── application.properties  # 환경 설정
 │   ├── webapp/WEB-INF/views
 │   │   ├── board
 │   │   │   ├── showAll.jsp  # 전체 게시글 목록
 │   │   │   ├── showOne.jsp  # 개별 게시글 상세 보기
 │   │   │   ├── update.jsp  # 게시글 수정
 │   │   │   ├── write.jsp  # 게시글 작성
 │   │   ├── js
 │   │   │   ├── selectOne.js  # 게시글 상세 조회 JS
 │   │   ├── reply
 │   │   │   ├── reply.jsp  # 댓글 기능 JSP
 │   │   ├── user
 │   │   │   ├── register.jsp  # 회원가입 페이지
 │   │   │   ├── index.jsp  # 로그인 페이지
 ├── README.md  # 프로젝트 설명
```

## 📌 게시글 목록 조회 (showAll.jsp)
```jsp
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://정.  
