<%@ page language="java" contentType="text/html; charset-UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <!--
        별개의 스타일시트 혹은 JS 파일을 만들 경우 우리가 헤드 태그 아넹서
        그 파일에 대한 링크를 해야 한다.

        springboot 기준으로, css 파일, JS 파일, 이미지 등
        자원(= resource) 파일들은 static 폴더에 넣으면 된다.
        그 후에 해당 파일을 불러올 때에는 link 태그 이용
    -->
    <link rel="stylesheet" href="/showOne.css">
    <title>${boardDTO.id}번 게시글</title>
    <style>

        /*
           스타일 태그를 다는 두번째 방법
           <head> 안에 <style> 태그를 만들어서
           어떤 엘리먼트 혹은 어떤 selector를 사용해서
           특정 한 부분 혹은 특정 모든 태그에게
           똑같은 css를 부여할 수 있다.

           selector:
           특정 태그 혹은 클래스, id를 가진 것을 선택하는 선택자
           태그는 아무런 기호없이 태그 이름 자체를 적어주면 된다.
           클래스는 .클래스이름 으로 선택하게 된다.
           id는 #id로 선택하게 된다.
           물론, 특정 태그의 특정 클래스 혹은 id를 가진 것도 우리가 위의 선택자를
           섞어서 쓰면 선택할 수 있다.
         */

        /* body 태그와 그 하위 태그 모두에게 글자색을 파랑색으로 바꿔보자 */
        body {
            color: blue;
        }

        /* class 이름이 h3-date 인 친구들의 글자 크기를 20으로 바꿔보자 */
        .h3-date {
            /*
                CSS의 크기 단위
                px: pixel, 고정 되어 있는 크기.
                em: 기본 폰트 사이즈(주로 16px)를 기준으로 크기 결정
                    만약 25프로 더 큰(=20px)가 필요하다면 1.25em으로 적어줌
                vw: 현재 뷰의 가로 길이를 기준.
                    1vm은 현재 가로 길이의 1프로를 뜻함.
                    만약 우리화면 크기가 가로로 1280 일 경우, 12.8px이 1vm이 됨.
                vh: 현재 뷰의 세로 길이를 기준.
                고정 크기: 상대 크기
                고정 크기: 계산이 편함. 내가 원하는 사이즈를 지정.
                상대 크기: 화면 크기가 달라지더라도 특정한 비율을 기대.

                전에는 고정 크기의 css 단위를 쓰는 것이 보편ㄴ적이었지만 반응형 웹이라는 개념이
                등장하면서 상대 크기를 쓰는 경우도 많음.

                하지만 반응형 웹의 경우, 우리가 일일이 계산을 하는 것보다 반응형 웹 자체를 지원하는 라이브러리 혹은
                프레임워크를 쓰는 것이 더욱 편함. 대표적인 예시가 바로 bootstrap이 됨.
            */
            font-size: 5vw;
        }

        /* id가 writer 인 태그에게 글자 색상을 다른 것을 부여해보자 */
        #id {
            color: rgb(50, 100, 150);
        }

        /* 여러개의 셀렉터를 섞는 경우 앞에 나오는 것을 부모라고 생각하면 좀 더 편하다
           예시: p#id -> p 태그로 아이디가 id인 경우
            div.row -> div 태그 중 클래스가 row인 친구
         */
        /*h4.h5-date {*/
        /*    color: #811055;*/
        /*}*/
    </style>

</head>
<script src="/js/selectOne.js">
    showOne()
</script>

<%--우리가 스타일 어트리뷰트를 태그 안에 지정하고--%>
<%--값을 부여하여 스타일을 지정 할 수 있다.--%>
<%--이 때 여러개의 css를 지정해야할 경우에는--%>
<%--하나의 css를 적을때마다 ; 을 통해서 분리해준다.--%>

<%--<body style="background-color: blue; color: blue">--%>
<%--
    Javascript
    자바스크립트는 스크립트 언어로서, 브라우저 내부가 실행하는 언어.
    CSS처럼 우리가 태그 내부, <script> 태크에 별도 저장, .js 파일에 별도 저장해서
    해당 기능을 로딩하여 사용 가능하다. 자바스크립트도 객체지향 언어로써 내부적으로
    객체를 만들어서 사용할 수 있음.

    자바스크립트는 파이썬 혹은 자바와는 다르게 ;의 사용을 해도 좋고 안해도 좋고 라고 설정.
    둘 중 무엇이 더 나은지는 사람마다 의견 차이가 있지만 누구든 혼용하는 것은 매우 나쁘게 봄.

    자바스크립트에서 변수를 만들 때에는 우리가 var, let을 쓰고 상수를 만들 때는 const를 씀
    예전에는 var과 let을 혼용하였지만 점점 추세는 let으로만 만드는 것을 권장.
    var와 let의 차이는 똑같은 이름의 변수를 선언할 수 있는가 없는가의 차이가 있음.
    var는 같은 이름의 변수를 중복선언 가능,
    let은 중복 선언이 불가능.
    그렇기 때문에 우리도 let을 사용하여 변수를 선언하는 실습 진행.

    hoisting
    자바스크립트가 변수를 선언하는 위치를 항상 최상위로 올려서 모든 변수는 선언을 먼저 하게
    되는 기능을 말한다. 이 기능 때문에, 우리는 어떠한 함수에서 선언한 변수를
    다른 함수에서도 사용은 가능하지만 값의 초기화 문제에서 자유로울 수 없다.
    즉, 변수 자체를 사용할 수 있지만 해당 변수 값이 초기화가 안 되는 경우가 존재하기에
    우리가 정확한 값을 받아서 쓸 수 없는 경우도 많다.
    특히 var을 쓸 때 이러한 문제가 발생하기 때문에 let을 사용하여 만약 초기화가 안 되어
    있으면 reference error를 발생시키는 식으로 사용하여 값의 무결성을 유지할 수 있다.

    익명함수 vs 애로우 함수
    익명 함수란, 함수 자체에 이름을 붙이는 것이 아니라 함수를 이름 없이 만들고 그 함수를
    어떠한 변수에 저장시키는 것을 말한다.
    자바와는 다르게 자바스크립트에서는 함수도 객체처럼 다를 수 있기에 가능한 문법.

    애로우 함수란, 자바에서의 람다 표현식과 같고 함수를 처음부터 선언하는 것이 아니라
    (파라미터) => { 함수 내용 } 으로 만들 수 있다. 위의 익명함수라는 용어와 혼용이 되는
    경우가 많은데, 비록 의미는 같더라도 => 가 안들어가면 익명함수, 들어가면 애로우 함수라고
    생각하면 좋다.

    on이벤트
    우리가 HTML 태그 안에 여러가지 이벤트에 대한 처리가 가능. 예를 들어 해당 태그를
    클릭했을 경우, 드래그 했을 경우 등의 다양한 이벤트가 발생할 수 있고 해당 이벤트에
    대한 처리를 우리가 자바스크립트로 하게 된다.
    간단하게는 onclick="location.href='/board/showOne/~~~'"과 같은 이벤트 처리가
    있고 만약 더 복잡해질 경우에는 함수를 만들어서 해당 이벤트를 어떻게 처리될 지를 별도의
    자바스크립트 함수로 처리하게 됨.

    DOM
    Document Object Model
    문서 객체 모델
    DOM이란, 자바스크립트에서 HTML 페이지를 하나의 객체로 인식하고 그 안에 모든 태그들로
    전부 객체로 처리하여 관리하는 데이터타입.
    우리가 필요에 따라 자바스크립트로 HTML 요소를 만들어서 특정 위치에 넣는다든지, 특정
    요소의 현재 값을 바꾼다든지 등의 다양한 처리를 DOM을 통해서 하게 된다.
    즉, 웹 프로그래밍에서 DOM은 자바스크립트 파트의 알파이자 오메가이다.
--%>
<body>
<script>
    // 호이스팅 체험해보기
    // 우리가 message라는 객체를 선언과 초기화 전에 사용할 수 있을까?
    // 문법적으로 틀리지 않음

    // 우리가 변수를 나중에 선언하더라도 해당 변수를 그 위에 사용하더라도
    // 문법적으로 에러가 나진 않는다.
    // 호이스팅 기능 떄문에 내 변수에 저장된 값에 대한 무결성을 장담할 수 없다라는 단점이
    // 발생하므로 호이스팅 기능을 사용해도 괜찮긴 하지만 호이스팅 기능 사용을 최대한 피할 것.
    message = 3
    console.log(message)

    // 주로 스크립트 태그는 해드 혹은 바디의 최상단에 만들어서 우리가 필요한 자바스크립트
    // 코드를 적어주면 되는데 가끔 보면 해당 script 태그를 다른 위치에 적어주는 경우도
    // 있는데 이럴 경우, 가독성이 매우 안 좋아짐.
    var message = "hello World!"
    console.log(message)

    // let과 var의 차이
    // var은 중복 선언 가능
    var message = 312
    console.log(message)

    // let은 중복 선언 불가능
    let msg = 3
    let msg = "33"
    console.log(msg)

    // 자바스크립트 객체 만들기(JSON과 비슷)
    let student = {
        id: 1,
        name: "김태환",
        kor: 80,
        eng: 90,
        math: 85,
        print: function () {
            console.log("student.print()");
        }
    }
    student.print()

    // 함수를 만드는 다양한 방법
    // 1. 가장 기본적인 방법
    // functino 이름(파라미터) {
    //          내용
    // }
    function hi() {
        console.log("hi");
    }

    // 2. 익명 합수
    let hi2 = function (message) {
        console.log(message);
    }

    hi2("abc")

    // 3. 애로우 함수
    let hi3 = (message) => {
        console.log(message)
    }
    hi3("bcd")
    hi3("def")

    // typeof는 해당 값의 타입 알려줌.
    console.log(typeof(h13))
    let sample;
    // 아직 sample에 어떠한 값을 저장하지 않았기 때문에
    // sample의 현재값, 혹은 sample의 현재 타입을 물어보게 되면
    // undefined라는 값이 출력됨. undefined는 null과 같이 일종의 상태인데
    // 해당 공간이 아직 특정한 값으로 초기화가 되지 않은 상태라고 보면 됨.
    // null과는 다른 점은 null은 공간이 있지만 초기화가 안 되어 있은 것이고
    // undefined는 아직 공간 자체도 마련되지 않았다라고 생각하면 됨.
    console.log(typeof(sample))

    // NaN
    // Not a Number
    // 우리가 사칙연산 등 수학을 하는데 불가능한 연산을 요구하는 경우, 출력되는 결과.
    console.log(5/0)

    // ' ' vs " "
    console.log(typeof ('a'))
    console.log(typeof ("a"))

</script>
<p>적용됨</p>
<h1 style="color:red">제목: ${boardDTO.title}</h1>
<h2 style="color:orange">작성자: ${boardDTO.username}</h2>
<h3 style="color:green">내용: ${boardDTO.content}</h3>
<h4 style="color:blue">닉네임: ${boardDTO.nickname}</h4>
<h5 style="color:navy">제출일: ${boardDTO.entryDate}</h5>

<h5 class="card-subtitle h5-date">작성자: ${boardDTO.nickname}</h5>
<br/>
<p class="card-text">작성일: <fmt:formatDate value="${boardDTO.entryDate}"
                                          pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></p>
<p class="card-text">수정일: <fmt:formatDate value="${boardDTO.modifyDate}"
                                          pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></p>
<hr/>
<div class="container-fluid m-5">
    <div class="row justify-content-center">
        <div class="col-10">
            <div class="card">
                <div class="card-header">
                    <h1 class="card-title">${boardDTO.title}</h1>
                </div>
                <div class="card-body">
                    <h5 id="id" class="card-subtitle h5-date">작성자: ${boardDTO.nickname}</h5>
                    <br/>
                    <p class="card-text">작성일: <fmt:formatDate value="${boardDTO.entryDate}"
                                                              pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></p>
                    <p class="card-text">수정일: <fmt:formatDate value="${boardDTO.modifyDate}"
                                                              pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></p>
                    <hr/>
                    <p class="card-text">${boardDTO.content}</p>
                </div>
                <div class="card-footer text-end">
                    <a href="/board/update/${boardDTO.id}" class="btn btn-primary">수정하기</a>
                    <a href="/board/delete/${boardDTO.id}" class="btn btn-danger">삭제하기</a>
                    <a href="javascript:history.back()" class="btn btn-secondary">뒤로가기</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row justify-content-center mt-4">
        <div class="col-10">
            <div class="card">
                <div class="card-header">
                    <h5>댓글 작성</h5>
                </div>
                <div class="card-body">
                    <form action="/reply/add" method="post">
                        <input type="hidden" name="boardId" value="${boardDTO.id}"/>
                        <div class="mb-3">
                            <label for="content" class="form-label">댓글 내용</label>
                            <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">댓글 추가</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 댓글 목록 -->
    <div class="row justify-content-center mt-4">
        <div class="col-10">
            <div class="card">
                <div class="card-header">
                    <h5>댓글 목록</h5>
                </div>
                <div class="card-body">
                    <ul class="list-group">
                        <c:forEach var="reply" items="${replies}">
                            <li class="list-group-item">
                                    ${reply.nickname} <fmt:formatDate value="${reply.entryDate}"
                                                                      pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
                                <p>${reply.content}</p>
                                <a href="/reply/delete/${reply.id}" class="btn btn-danger btn-sm">삭제</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>