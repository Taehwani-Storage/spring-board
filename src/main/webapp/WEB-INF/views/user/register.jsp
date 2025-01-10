<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <title>회원 가입하기</title>
</head>
<body>
<div class="container-fluid">
    <h1>${message}</h1>
    <form method="post" action="/user/register">
        <div class="row mt-5 justify-content-center">
            <div class="col-2">
                <label for="input_username">아이디</label>
            </div>
            <div class="col-5">
                <input type="text" name="username" id="input_username" value="${userDTO.username}" class="form-control">
            </div>
        </div>
        <div class="row mt-3 justify-content-center">
            <div class="col-2">
                <label for="input_password" class="form-control-plaintext">비밀번호</label>
            </div>
            <div class="col-5">
                <input type="password" name="password" id="input_password" value="${userDTO.password}" class="form-control">
            </div>
        </div>
        <div class="row mt-3 justify-content-center">
            <div class="col-2">
                <label for="input_nickname" class="form-control-plaintext">닉네임</label>
            </div>
            <div class="col-5">
                <input type="text" name="nickname" id="input_nickname" value="${userDTO.nickname}" class="form-control">
            </div>
        </div>
        <div class="row mt-3 justify-content-center">
            <div class="col-3">
                <input type="submit" value="가입하기" class="btn btn-outline-success">
                <a href="/" class="btn btn-outline-dark ms-2">뒤로가기</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>