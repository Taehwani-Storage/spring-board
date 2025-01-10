<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <title>게시글 목록보기</title>
</head>
<body>
<div class="container-fluid m-5">
    <div class="row justify-content-center">
        <div class="col-10">
            <table class="table table-primary table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <td class="col-2">글 번호</td>
                    <td class="col-4">제목</td>
                    <td class="col-2">작성자</td>
                    <td class="col-2">작성일</td>
                    <td class="col-2">수정일</td>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="b">
                        <tr onclick="location.href='/board/showOne/${b.id}'">
                            <td>${b.id}</td>
                            <td>${b.title}</td>
                            <td>${b.nickname}</td>
                            <td>
                                <fmt:formatDate value="${b.entryDate}" pattern="yy년 MM월 dd일"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${b.modifyDate}" pattern="yy년 MM월 dd일"/>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="/board/showAll/1"> << </a>
                                </li>
                                <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                    <li class="page-item">
                                        <c:choose>
                                            <c:when test="${i eq currentPage}">
                                                <a class="page-link active" href="/board/showAll/${i}">${i}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="page-link" href="/board/showAll/${i}">${i}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="/board/showAll/${maxPage}"> >> </a>
                                </li>
                            </ul>
                        </td>
                    </tr>
                        <tr>
                            <td colspan="5">
                                <a href="/board/write" class="btn btn-outline-primary">글 작성하기</a>
                            </td>
                        </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<hr/>
</body>
</html>