<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드 메뉴 동작</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 메뉴바는 어떤 페이지이든 포함하고 있으므로 contextPath 변수 선언 후 application에서 모두 사용 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>

<script>

$(function() {
    $(".side-item").click(function(e) {
        e.preventDefault();
        $(".side-item").removeClass("active");
        $(this).addClass("active");
    });
    });
    
//cafe sidemenubar 페이지 이동

	// home
	   const cafeHome = document.getElementById("cafeHome");
	   cafeHome.addEventListener("click", function() {
	       location.href='${ contextPath }/cafe/home';
	   });

	//주문 내역
	const cafeOrd = document.getElementById("cafeOrd");
	cafeOrd.addEventListener("click", function(){
	    location.href='${ contextPath }/cafe/order';
	});
	
	
	//예약 내역
	const cafeRes= document.getElementById("cafeRes");
	cafeRes.addEventListener("click", function() {
	 location.href='${ contextPath }/cafe/biz/res';
	});
	
	//카페 등록
	const cafeWri = document.getElementById("cafeWri");
	cafeWri.addEventListener("click", function(){
	 location.href='${ contextPath }/cafe/biz/write';
	});
	
	//카페 확인
	const cafeCon= document.getElementById("cafeCon");
	cafeCon.addEventListener("click", function() {
	 location.href='${ contextPath }/cafe/biz/confirm';
	});
</script>
</body>
</html>