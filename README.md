# 📌 Spring 게시판 미니 프로젝트

## 📖 프로젝트 개요
이 프로젝트는 **Spring Framework**를 활용하여 간단한 게시판을 구현하는 미니 프로젝트입니다. 
프론트엔드와 백엔드를 함께 구성하며, MyBatis를 활용한 데이터베이스 연동을 포함합니다.

### 🚀 사용 기술
- **프론트엔드**: JSP (WEB-INF/mapper/*.xml)
- **백엔드**:
  - Lombok
  - Spring Web
  - Spring Boot DevTools
  - JDBC API
  - MyBatis
  - MySQL Driver

---

## 🏗️ 게시판 기본 기능 구현

### 🛠️ 프로젝트 구조
```
📂 src/main/java/com/example/board
 ┣ 📂 controller      // 컨트롤러 (요청 처리)
 ┣ 📂 service         // 서비스 (비즈니스 로직)
 ┣ 📂 repository      // DAO, MyBatis 매퍼
 ┣ 📂 model          // 엔티티 클래스
 ┗ 📂 config         // 설정 파일
```

### 📝 게시글 목록 보기
#### 📌 Controller (게시글 리스트 반환)
```java
@RestController
@RequestMapping("/posts")
public class PostController {
    @Autowired
    private PostService postService;

    @GetMapping
    public List<Post> getAllPosts() {
        return postService.getAllPosts();
    }
}
```
#### 📌 Service (비즈니스 로직)
```java
@Service
public class PostService {
    @Autowired
    private PostMapper postMapper;

    public List<Post> getAllPosts() {
        return postMapper.getAllPosts();
    }
}
```
#### 📌 Mapper (MyBatis XML 파일)
```xml
<mapper namespace="com.example.board.mapper.PostMapper">
    <select id="getAllPosts" resultType="Post">
        SELECT * FROM posts ORDER BY created_at DESC;
    </select>
</mapper>
```

---

### 📝 게시글 추가, 수정, 삭제, 댓글 기능

#### 📌 게시글 추가 (Create)
```java
@PostMapping
public void createPost(@RequestBody Post post) {
    postService.createPost(post);
}
```
#### 📌 게시글 수정 (Update)
```java
@PutMapping("/{id}")
public void updatePost(@PathVariable int id, @RequestBody Post post) {
    postService.updatePost(id, post);
}
```
#### 📌 게시글 삭제 (Delete)
```java
@DeleteMapping("/{id}")
public void deletePost(@PathVariable int id) {
    postService.deletePost(id);
}
```
#### 📌 댓글 추가 기능
```java
@PostMapping("/{postId}/comments")
public void addComment(@PathVariable int postId, @RequestBody Comment comment) {
    commentService.addComment(postId, comment);
}
```

---

## 🌐 RESTful API 활용
게시판의 주요 기능을 RESTful API로 설계하고, JSON 데이터를 활용하여 프론트엔드와 통신합니다.

### 📌 API 엔드포인트
| HTTP Method | Endpoint           | 설명          |
|-------------|-------------------|--------------|
| GET         | `/posts`          | 게시글 목록 조회 |
| GET         | `/posts/{id}`     | 특정 게시글 조회 |
| POST        | `/posts`          | 게시글 추가 |
| PUT         | `/posts/{id}`     | 게시글 수정 |
| DELETE      | `/posts/{id}`     | 게시글 삭제 |
| POST        | `/posts/{id}/comments` | 댓글 추가 |

### 📌 JSON 데이터 예시
#### 📌 게시글 추가 요청 JSON
```json
{
    "title": "Spring Boot 게시판",
    "content": "게시판을 만들면서 Spring Boot를 학습합니다.",
    "author": "Alice"
}
```

---

## ✅ 결론
이 프로젝트를 통해 Spring Boot와 MyBatis를 활용한 **게시판 구현**을 경험할 수 있습니다. 
추후 **OAuth 로그인, 파일 업로드, 좋아요 기능** 등의 기능을 추가하여 더욱 확장할 수 있습니다! 🚀
