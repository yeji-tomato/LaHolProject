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
<style>
	.infoArea {
        display : flex;
        justify-content : flex-end;
        align-items : center;
        color : #4B654A;
    }

    .infoArea p {
        margin : 0 15px;
    }

    .infoArea svg {
        fill : #4B654A;
        width : 20px;
        height : 20px;
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
	<!-- 사업자로 로그인 되었을 경우 -->
	<nav id="nav">
        <div class="menuWrapper">
        <c:choose>
        <c:when test="${ loginUser.grade eq 'P'}">
            <div class="mainMenu">
                <ul>
                    <li><a href="${ contextPath }/store/list2">STORE</a></li>
                    <li><a href="${ contextPath }">CLASS</a></li>
                    <li><a href="${ contextPath }/cafe/home">CAFE</a></li>
                </ul>
            </div>
            <div class="logoArea">
            	<a href="${ contextPath }/bus/main" class="logoA">
                	<img src="${ contextPath }/resources/img/common/logo-lahol2.png">
                </a>
            </div>
         </c:when>
         <c:otherwise>
         	<div class="mainMenu">
                <ul>
                    <li><a href="${ contextPath }/store/list">STORE</a></li>
                    <li><a href="${ contextPath }/coffeeclass">CLASS</a></li>
                    <li><a href="${ contextPath }/cafe/user">CAFE</a></li>
                    <li><a href="${ contextPath }/playground/intro">PLAY GROUND</a></li>
                </ul>
            </div>
            <div class="logoArea">
            	<a href="${ contextPath }" class="logoA">
                	<img src="${ contextPath }/resources/img/common/logo-lahol2.png">
                </a>
            </div>
            </c:otherwise>
         </c:choose>
            <div class="loginArea">
                <div class="infoArea">
					<c:if test="${ !empty sessionScope.loginUser }">
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 50 50" xml:space="preserve">
							<path d="M24 49h2a5.01 5.01 0 0 0 4.899-4H49v-6.618l-6-3V23c0-8.2-5.517-15.122-13.029-17.286C29.819 3.092 27.659 1 25 1s-4.819 2.092-4.971 4.714C12.517 7.878 7 14.8 7 23v12.382l-6 3V45h18.101A5.01 5.01 0 0 0 24 49zm2-2h-2a3.006 3.006 0 0 1-2.829-2h7.657A3.004 3.004 0 0 1 26 47zM25 3c1.396 0 2.561.962 2.895 2.255C26.95 5.101 25.988 5 25 5s-1.95.101-2.895.255A2.997 2.997 0 0 1 25 3zM3 39.618l6-3V23c0-8.822 7.178-16 16-16s16 7.178 16 16v13.618l6 3V43H3v-3.382z" id="Layer_1_1_"/><metadata><rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/elements/1.1/"><rdf:Description about="https://iconscout.com/legal#licenses" dc:title="bell-ring-notification-alert-alarm" dc:description="bell-ring-notification-alert-alarm" dc:publisher="Iconscout" dc:date="2018-05-24" dc:format="image/svg+xml" dc:language="en"><dc:creator><rdf:Bag><rdf:li>Becris .</rdf:li></rdf:Bag></dc:creator></rdf:Description></rdf:RDF></metadata>
						</svg>
						<p id="loginInfo">WELCOME ${ sessionScope.loginUser.id }</p>
					</c:if>
                </div>
                <div class="loginMenu">
                	<c:if test="${ empty sessionScope.loginUser }">
                    <ul>
                        <li><a href="${ contextPath }/member/loginView">SIGN IN</a></li>
                        <li><a href="${ contextPath }/member/signUpView">SIGN UP</a></li>
                    </ul>
                    </c:if>
                    <c:if test="${ !empty sessionScope.loginUser }">
                    <ul>
                        <li><a href="${ contextPath }/member/mypageView">MY PAGE</a></li>
                        <li><a href="${ contextPath }/member/logout">LOGOUT</a></li>
                    </ul>
                    </c:if>
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