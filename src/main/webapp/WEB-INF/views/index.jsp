<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <title>로그인 페이지</title>
    <style>
        body {
            background-color: #f8f9fa; /* 배경색 변경 */
        }
        .login-container {
            max-width: 400px; /* 최대 너비 설정 */
            margin: auto; /* 중앙 정렬 */
            padding: 20px; /* 패딩 추가 */
            background-color: white; /* 배경색 흰색 */
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
        .btn-custom {
            width: 100%; /* 버튼 너비 100% */
        }
    </style>
</head>
<%-- 기본적으로 부트스트랩은 Grid 시스템을 사용
    그리드 시스템은 웹페이지를 커다란 표처럼 표현하는 바이고,
    새로 한줄마다 가로 12칸에 분배가 되어 우리가 필요한 만큼 끌어서 쓸 수 있음.--%>
<%-- 부트스트랩에서 어떤 CSS를 적용할지는 클래스로 지정 --%>
<%-- container-fluid는 우리가 출력할 화면의 영역을 유기적으로 조절 --%>
<body>
<div class="container-fluid">
    <%-- 부트스트랩을 사용하며 우리가 표현할 화면을 표처럼 생각해서 만들기 --%>
    <div class="login-container mt-5">
        <h2 class="text-center">로그인</h2>
        <form method="post" action="/user/auth">
            <div class="row mb-3">
                <label for="input_username" class="col-sm-3 col-form-label">아이디</label>
                <%-- col은 우리가 특정 길이만큼 지정 가능한테, 그 길이의 합은 반드시 12가 되어야 함,
                    만약 따로 지정하지 않으면 자동으로 12칸을 균등 분배 --%>
                <div class="col-sm-9">
                    <input type="text" name="username" id="input_username" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <label for="input_password" class="col-sm-3 col-form-label">비밀번호</label>
                <div class="col-sm-9">
                    <input type="password" name="password" id="input_password" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-3"></div>
                <div class="col-sm-9">
                    <input type="submit" value="로그인" class="btn btn-outline-success btn-custom">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-3"></div>
                <div class="col-sm-9">
                    <a href="/user/register" class="btn btn-outline-dark btn-custom">회원가입</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
