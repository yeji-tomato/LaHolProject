<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>LaHol - Search ID</title>
    <style>
        html {
            height: 100%;
        }

        body {
            height: 100%;
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
            height: 100%;
            margin: auto;
        }
        
        .wrapper * {
        	font-family: 'NEXON Lv1 Gothic OTF';
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
        }

        p {
            color: white;
            text-align: center;
        }

        .login_area .confirmIdDiv {
            width : 318px;
            margin: 0 auto 24px;
            /* padding: 20px 8px; */
            height : 130px;
            border : 1px solid #e7e7e7;
            background : rgba(243, 215, 152, 0.3);
        }

        .confirmIdDiv p {
            margin: 57px auto 57px;
            font-size : 16px;
            line-height: 16px;
            color :#5A452E;
        }

        #userName,
        #userPNo,
        #userEmail {
            display: block;
            margin: 0 auto 10px;
            padding : 20px 18px;
            width: 280px;
            height: 14px;
            border: 1px solid #e7e7e7;
            
            transition: border 0.3s;
        }

        #userName:focus,
        #userPNo:focus,
        #userEmail:focus {
            border : 1px solid #5A452E;
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

        .login_area span{
            display : inline-block;
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
            content : "";
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
            border-left : 1px solid #a1a1a1;
        }

        ul.list li:first-child {
            border-left: none;
        }

        ul.list li a {
            text-decoration: none;
            color : #6f6f6f;
        }

        ul.list li a:hover {
            color : #343434;
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
            transition: background-color 0.3s, border-color 0.3s;
        }

        
        @keyframes main_shake{
            10%, 90%{transform:translate3d(0, -1px, 0);}
            30%, 70%{transform:translate3d(0, 2px, 0);}
            50%{transform:translate3d(0, -3px, 0);}
        }
        
        #goMain:hover {
            background-color: #344633;
            border-color: #344633;
            animation: main_shake 0.5s;
        }

        @media only screen and (max-height : 936px) {
            .bg, #cover_1, #cover {
                height : 936px;
            }
        }
        
        @media only screen and (max-height : 864px) {
            .login_wrapper{
            	padding: 140px 0;
            }
            
        }
        
        @media only screen and (max-height : 800px) {
            .login_wrapper{
            	padding: 130px 0;
            }
            
        }
    </style>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			Swal.fire({
				title : '${msg}',
				icon : 'warning'
			});
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
                        <b id="userNameTab">${ searchMember.name }님</b>의 아이디
                    </span>

                </div>
                <div class="confirmIdDiv">
                <c:set var="id" value="${ searchMember.id }"/>
                <c:set var="idLength" value="${ fn:length(id) - 3 }"/>
                    <p>${ fn:substring(id, 0, idLength) }***</p>

                </div>
                <button type="button" class="login_ok" onclick="location.href='${contextPath}/member/loginView'">확인</button> <!-- 로그인 화면으로 -->
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
</body>
</html>