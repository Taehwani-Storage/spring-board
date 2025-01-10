<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <title>게시글 수정하기</title>
    <style>
        body {
            background-color: #f8f9fa; /* 배경색 변경 */
        }
        .update-container {
            max-width: 600px; /* 최대 너비 설정 */
            margin: auto; /* 중앙 정렬 */
            padding: 20px; /* 패딩 추가 */
            background-color: white; /* 배경색 흰색 */
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="update-container mt-5">
        <h2 class="text-center">게시글 수정하기</h2>
        <form action="/board/update/${boardDTO.id}" method="post">
            <div class="mb-3">
                <label for="input_title" class="form-label">제목</label>
                <input type="text" name="title" id="input_title" class="form-control" value="${boardDTO.title}" required>
            </div>
            <div class="mb-3">
                <label for="input_content" class="form-label">내용</label>
                <textarea name="content" id="input_content" class="form-control" rows="5" required>${boardDTO.content}</textarea>
            </div>
            <div class="d-flex justify-content-end mb-3">
                <input type="submit" value="수정하기" class="btn btn-primary me-3">
                <input type="button" value="취소" class="btn btn-secondary" onclick="history.back()">
            </div>
        </form>
    </div>
</div>
</body>
</html>
