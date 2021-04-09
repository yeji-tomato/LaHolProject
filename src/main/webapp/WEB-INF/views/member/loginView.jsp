<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<!-- sweetalert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <title>LaHol - SIGN IN</title>
    <style>
        body {
            padding: 0px;
            margin: 0 auto;
            line-height: 1;
            background: rgba(90, 69, 49, 1);

        }

        .bg {
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0;
            position: absolute;

            transition: all 0.5s;
        }

        #bg1 {
            background: url("${ contextPath }/resources/img/member/bg1.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: -2;
        }

        #cover {
            width: 100%;
            height: 100%;
            background: rgba(90, 69, 49, 0.6);
            position: absolute;
            z-index: -1;
        }

        #cover_1 {
            width: 100%;
            height: 100%;
            background: rgba(90, 69, 49, 0.9);
            position: absolute;
            z-index: -3;
        }

        .wrapper {
            width: 100%;
            margin: auto;
        }

        .login_wrapper {
            padding: 196px 0;
            margin: auto;
            min-width: 1200px;
            min-height: 516px;
        }

        .login_area {
            text-align: center;
            margin: 0 auto;
            width: 390px;
            min-height: 516px;
            background: #fff;
            border: 1px solid #5A452E;
            
            font-family: 'NEXON Lv1 Gothic OTF';
        }

        p {
            color: white;
            text-align: center;
        }

        #userId,
        #userPwd {
            display: block;
            margin: 0 auto 10px;
            padding: 20px 18px;
            width: 280px;
            height: 14px;
            border: 1px solid #e7e7e7;
            font-family: 'NEXON Lv1 Gothic OTF';

            transition: border 0.3s;
        }

        #userId:focus,
        #userPwd:focus {
            border: 1px solid #5A452E;
            outline: none;
        }

        .login_logo {
            width: 390px;
            height: 130px;
            margin: auto;
        }

        .login_logo img {
            padding: 20px;
            width: 110px;
            height: 80px;
        }

        .login_header span {
            display: inline-block;
            position: relative;
            padding-top: 4px;
            height: 56px;
            line-height: 56px;
        }

        .login_area span {
            display: inline-block;
            padding-top: 4px;
            position: relative;
        }

        .login_header span::before,
        .login_area span::before {
            position: absolute;
            left: 50%;
            top: 0;
            margin-left: -20px;
            width: 40px;
            height: 1px;
            background: #dadada;
            content: "";
        }

        .login_header span {
            font-family: 'NEXON Lv1 Gothic OTF';
        }

        .login_header span b {
            color: #5A452E;
        }

        .login_ok {
            display: block;
            margin: 0 auto 24px;
            width: 318px;
            height: 66px;
            background: #4B654A;
            border: 1px solid #4B654A;
            font-size: 16px;
            font-family: 'NEXON Lv1 Gothic OTF';
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .login_ok:hover {
            background-color: #344633;
            border-color: #344633;
        }

        ul.list {
            list-style: none;
            text-align: center;
            font-size: 12px;
            margin: 0;
            padding: 0;
            margin-bottom: 30px;
        }

        ul.list li {
            display: inline-block;
            padding: 0 14px;
            height: 14px;
            text-align: center;
            line-height: 14px;
            border-left: 1px solid #a1a1a1;
        }

        ul.list li:first-child {
            border-left: none;
        }

        ul.list li a {
            text-decoration: none;
            color: #6f6f6f;
        }

        ul.list li a:hover {
            color: #343434;
        }

        #goMain {
            display: block;
            margin: 12px auto 12px;
            width: 68px;
            height: 22px;
            background: #4B654A;
            border: 1px solid #fff;
            font-size: 12px;
            color: #fff;
            cursor: pointer;
            font-family: 'NEXON Lv1 Gothic OTF';
            transition: background-color 0.3s, border-color 0.3s;
        }


        @keyframes main_shake {

            10%,
            90% {
                transform: translate3d(0, -1px, 0);
            }

            30%,
            70% {
                transform: translate3d(0, 2px, 0);
            }

            50% {
                transform: translate3d(0, -3px, 0);
            }
        }

        #goMain:hover {
            background-color: #344633;
            border-color: #344633;
            animation: main_shake 0.5s;
        }

        @media only screen and (max-height : 912px) {
            .bg, #cover_1, #cover {
                height : 912px;
            }
        }
        
        .swal2-confirm,
        .swal2-cancel,
        .swal2-html-container,
        .swal2-title {
        	font-family: 'NEXON Lv1 Gothic OTF';
        }
    </style>
</head>

<body>
	<c:if test="${ !empty msg }">
		<script>
			Swal.fire('${msg}');
		</script>
		<c:remove var="msg"/>
	</c:if>
    <div id="cover_1"></div>
    <div class="bg" id="bg1"></div>
    <div id="cover"></div>
    <div class="wrapper">
        <div class="login_wrapper">
            <div class="login_area">
                <div class="login_header">
                    <div class="login_logo">
                        <img src="${ contextPath }/resources/img/common/logo-lahol2.png">
                    </div>
                    <span>
                        <b>LaHol</b> SIGN IN
                    </span>

                </div>
                <form method="POST" id="login_form" action="${ contextPath }/member/login">

                    <input type="text" id="userId" name="id" placeholder="아이디" onkeydown="onKeyDown();">
                    <input type="password" id="userPwd" name="pwd" placeholder="비밀번호" onkeydown="onKeyDown();">
                    <button type="button" class="login_ok" onclick="onSubmit();">로그인</button>

                </form>

                <ul class="list">
                    <li>
                        <a href="${ contextPath }/member/signUpView">회원가입</a>
                    </li>
                    <li>
                        <a href="${ contextPath }/member/idSearch">아이디 찾기</a>
                    </li>
                    <li>
                        <a href="${ contextPath }/member/pwdSearch">비밀번호 찾기</a>
                    </li>
                </ul>
                <span></span>
                <div class="returnMain">
                    <button type="button" id="goMain" onclick="location.href='${ contextPath }'">메인으로</button>
                </div>
            </div>
        </div>
    </div>
    <script>

        function onKeyDown() {
            if (event.keyCode == 13) {
                event.preventDefault();
                onSubmit();
            }
        }

        function onSubmit() {
            var userId = document.getElementById("userId");
            var userPwd = document.getElementById("userPwd");

            if (userId.value == "") {
            	Swal.fire({
					title : '아이디를 입력해주세요.',
					icon : 'warning'
				});
                userId.focus();
                return;
            }

            if (userPwd.value == "") {
            	Swal.fire({
					title : '비밀번호를 입력해주세요.',
					icon : 'warning'
				});
                userPwd.focus();
                return;
            }

            if(!chk(/^[a-z][a-z\d]{5,11}$/, userId, "아이디를 다시 입력해주세요.")) { // 영소문자 시작, 6~12자리
                return;
            }

            if(!chk(/(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$/, userPwd, "비밀번호를 다시 입력해주세요.")) { // 특수문자,숫자,영대소문자 포함 8자 이상
                return;
            }

            $("#login_form").submit();
        }

        // 정규 표현식, 검사할 함수
        function chk(reg, e, msg) {

            if (reg.test(e.value)) {
                return true;
            }
            Swal.fire({
				title : msg,
				icon : 'warning'
			});
            e.value = "";
            e.focus();
            return false;
        }
    </script>
</body>
</html>