<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <title>게시글 작성하기</title>
    <style>
        body {
            background-color: #f8f9fa; /* 배경색 변경 */
        }
        .write-container {
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
    <div class="write-container mt-5">
        <h2 class="text-center">게시글 작성하기</h2>
        <form action="/board/write" method="post">
            <div class="mb-3">
                <label for="input_title" class="form-input">제목</label>
                <input type="text" name="title" id="input_title" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="input_content" class="form-input">내용</label>
                <textarea name="content" id="input_content" class="form-control" rows="5" required></textarea>
            </div>
            <div class="d-flex justify-content-end mb-3">
                <input type="submit" value="작성하기" class="btn btn-primary me-3">
                <a href="/board/showAll" class="btn btn-secondary">취소</a>
            </div>
        </form>

        <script>
            // DOM
            // 우리가 HTML 태그들을 컨드롤 할 때 사용되는 특수한 자바스크립트 객체
            // 우리가 먼저 특정 요소를 DOM을 선택해 주어야 함.

            // 우리 페이지에서 특정 태그를 찾는 방법
            // document.getElementsByTagName(태그이름)
            // 단, 해당 페이지에 동일한 태그가 여러가지가 나올 수 있기 때문에
            // 내부적으로 배열을 가진 HTML 엘레먼트 객체가 나옴.
            let form = document.getElementsByTagName("form")

            form[0].setAttribute('method', 'POST')
            form[0].setAttribute('action', '/board/write')
            form[0].setAttribute('id', 'form-write')

            // 특정 요소 선택하기
            // 특정 클래스 이름 가진 객체들 다 나와!
            form = document.getElementsByClassName("form-input")
            console.log(form)

            // 특정 아이디 가진 책체 나와
            form = document.getElementById("form-write")


            // 우리가 필요에 따라서는 자바스크립트로 HTML 객체를 만들어서 특정 위치에 추가하는
            // 것도 가능, 이때는 우리가 document.createElement(태그이름)으로 만들어주기 위함
            let txt = document.createElement("p")
            txt.textContent = "자바스크립트에서 만든 p태그"
            txt.setAttribute("style", "color: beige; background-color: gray");

            // 만든 태그를 form에 추가하는 코드
            form[0].append(txt)
            // 단 한가지 주의할 점, 위에서처럼 태그를 만들 경우
            // 해당 태그는 한번만 추가 가능. 그 이유는 태그를 하나의 객체로 보기 때문
            // 중복으로 추가하면?
            form[0].append(txt)
            // 중복 추가가 되지 않고
            // 만약 여러 개의 태그를 한 태그 안에 append해야 한다면
            // 그 여러 개의 태그 각각을 객체로 만들어서 넣어주어야 함.

            // 하지만 기본 JS 라이브러리는 우리가 직접 하나씩 get element by id,
            // get elements by tagname(classname) 이런 식으로 하기 때문에 귀찮음...
            // 물론 JS도 노력하여 querySelector 라는 친구를 만들어주긴 하지만

        </script>
    </div>
</div>
</body>
</html>
