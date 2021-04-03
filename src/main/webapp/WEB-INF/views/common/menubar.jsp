<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menubar</title>
<!-- menubar css -->
<link rel="stylesheet" href="<c:url value="/resources/menubar.css"/>">
</head>
<body>
	<!-- menubar -->
    <nav id="nav">
        <div class="menuWrapper" style="position: relative;  z-index: 2;">
            <div class="mainMenu">
                <ul>
                    <li><a href="#">STORE</a></li>
                    <li><a href="#">CLASS</a></li>
                    <li><a href="#">CAFE</a></li>
                    <li><a href="#">PLAY GROUND</a></li>
                </ul>
            </div>
            <div class="logoArea">
                <img src="../resources/images/img_common/logo-lahol2.png">
                <!-- <img src="/resources/images/img_common/logo-lahol2.png"> -->
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

        <script>
            $(window).on("scroll", function() {
            if($(window).scrollTop() > 50) {
                $("nav").addClass("active");
            } else {
                //remove the background property so it comes transparent again (defined in your css)
                $("nav").removeClass("active");
            }
        });
        </script>
    </nav>
</body>
</html>