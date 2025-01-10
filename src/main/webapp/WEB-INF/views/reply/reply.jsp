<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>댓글 목록</title>
</head>
<body>
<h2>댓글 목록</h2>

<!-- 댓글 추가 폼 -->
<form action="${pageContext.request.contextPath}/reply/add" method="post">
    <input type="hidden" name="boardId" value="${boardId}"/>
    <textarea name="content" required></textarea>
    <input type="text" name="writerId" placeholder="작성자 ID" required/>
    <button type="submit">댓글 추가</button>
</form>

<!-- 댓글 목록 -->
<table>
    <thead>
    <tr>
        <th>작성자</th>
        <th>내용</th>
        <th>작성일</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="reply" items="${replies}">
        <tr>
            <td>${reply.writerId}</td>
            <td>${reply.content}</td>
            <td>${reply.createDate}</td>
            <td>
                <a href="${pageContext.request.contextPath}/reply/update/${reply.id}">수정</a>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/reply/delete" method="post">
                    <input type="hidden" name="id" value="${reply.id}"/>
                    <button type="submit">삭제</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
