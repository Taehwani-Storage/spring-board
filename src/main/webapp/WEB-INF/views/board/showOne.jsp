<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <title>${boardDTO.id}번 게시글</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">${boardDTO.title}</h1>
    <div class="mb-3">
        <h5>작성자: <span class="badge bg-secondary">${boardDTO.nickname}</span></h5>
        <h6>작성일: <fmt:formatDate value="${boardDTO.entryDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></h6>
        <h6>수정일: <fmt:formatDate value="${boardDTO.modifyDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></h6>
    </div>
    <hr/>
    <h3>내용</h3>
    <div class="card mb-4">
        <div class="card-body">
            <p>${boardDTO.content}</p>
        </div>
    </div>
    <div class="d-flex justify-content-end mb-3">
        <a href="/board/update/${boardDTO.id}" class="btn btn-primary me-3">수정하기</a>
        <a href="/board/delete/${boardDTO.id}" class="btn btn-danger me-3">삭제하기</a>
        <a href="/board/showAll/1" class="btn btn-secondary">목록가기</a>
    </div>
    <hr/>

    <!-- 댓글 작성 부분 -->
    <h4>댓글 목록</h4>
    <c:forEach var="reply" items="${replies}">
        <div>
            <strong>${reply.userId}</strong>: ${reply.content}
        </div>
    </c:forEach>

    <h3>댓글 작성</h3>
    <form action="${pageContext.request.contextPath}/reply/write" method="post">
        <input type="hidden" name="boardId" value="${board.id}" />
        <textarea name="content" required></textarea>
        <button type="submit">댓글 작성</button>
    </form>
    </div>
</div>
</body>
</html>
