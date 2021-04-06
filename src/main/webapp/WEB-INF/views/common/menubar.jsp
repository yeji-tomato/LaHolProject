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
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<!-- 아이콘 cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<nav id="nav">
        <div class="menuWrapper">
            <div class="mainMenu">
                <ul>
                    <li><a href="#">STORE</a></li>
                    <li><a href="#">CLASS</a></li>
                    <li><a href="${ contextPath }/cafe/user">CAFE</a></li>
                    <li><a href="#">PLAY GROUND</a></li>
                </ul>
            </div>
            <div class="logoArea">
            	<a href="${ contextPath }" class="logoA">
                	<img src="${ contextPath }/resources/img/common/logo-lahol2.png">
                </a>
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