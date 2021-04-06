<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메뉴바는 어떤 페이지이든 포함하고 있으므로 contextPath 변수 선언 후 application에서 모두 사용 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menubar</title>
<!-- menubar css -->
<!-- <link rel="stylesheet" href="<c:url value="/resources/menubar.css"/>"> -->
<link rel="stylesheet" href="${ contextPath }/resources/css/common/menubar.css" type="text/css">

</head>
<body>
	<nav id="nav">
        <div class="menuWrapper">
            <div class="mainMenu">
                <ul>
                    <li><a href="#">STORE</a></li>
                    <li><a href="#">CLASS</a></li>
                    <li><a href="#">CAFE</a></li>
                    <li><a href="#">PLAY GROUND</a></li>
                </ul>
            </div>
            <div class="logoArea">
                <img src="${ contextPath }/resources/img/common/logo-lahol2.png">
            </div>
            <div class="loginArea">
                <div class="infoArea">
    
                </div>
                <div class="loginMenu">
                    <ul>
                        <li><a href="#">SIGN IN</a></li>
                        <li><a href="#">SIGN UP</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    
    <!-- 제이쿼리 CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
            $(window).on("scroll", function() {
            if($(window).scrollTop() > 50) {
                $("nav").addClass("active");
            } else {
                $("nav").removeClass("active");
            }
        });
    </script>
</body>
</html>