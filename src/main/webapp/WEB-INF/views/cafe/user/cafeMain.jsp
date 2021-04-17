<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 검색 페이지</title>
<!-- search css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/search.css">
</head>
<body>
	
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<section class="searchCafe">
            <div class="headSearch">
                <!-- <div id="parallelogram"></div> -->
                <div class="cafe-title">
                    <span id="spanTitle"></span>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
            <script>
                new TypeIt("#spanTitle", {
                    strings: ["CAFE"],
                    speed: 500,
                    loop: true
                    }).go();
            </script>
            <!-- 서치 -->
            <main>
                <div class="search-container">
                    <div class="search-box">
                        <div class="search-icon"><i class="fa fa-search search-icon"></i></div>
                        <form action="" class="search-form">
                            <input type="text" placeholder="Search" id="search" autocomplete="off">
                        </form>
                        <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
                            xml:space="preserve">
                        <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
                        <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
                        </svg>
                        <div class="go-icon"><i class="fa fa-arrow-right"></i></div>
                    </div>
                </div>
            </main>
            <script>
            $(document).ready(function(){
                    $("#search").focus(function() {
                    $(".search-box").addClass("border-searching");
                    $(".search-icon").addClass("si-rotate");
                    });
                    $("#search").blur(function() {
                    $(".search-box").removeClass("border-searching");
                    $(".search-icon").removeClass("si-rotate");
                    });
                    $("#search").keyup(function() {
                        if($(this).val().length > 0) {
                        $(".go-icon").addClass("go-in");
                        }
                        else {
                        $(".go-icon").removeClass("go-in");
                        }
                    });
                    $(".go-icon").click(function(){
                    $(".search-form").submit();
                    });
                });
            </script>
    </section>
    <hr style="margin-top: 5%;">
    <!-- 정렬 방식 -->
    <section class="content-cafe-sc">
        <h1 style="color: gray; margin-left: 7%;">CAFE</h1>
        <div class="container" id="ct-cf">
            
            <div class="row row-cols-4" id="rowP">
            <c:forEach var="cm" items="${ CafeMainList }">
            <c:choose>
            <c:when test="${!empty cm}">
	            <div class="col">
	                <div class="card" id="cardShape" onclick="location.href='${ contextPath }/cafe/detail?caCode=${ cm.caCode }'">
	                    <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cm.mainPhoto }" class="card-img-top" alt="...">
	                    <div class="card-body" id="card-body">
	                        <h3 class="card-text">${ cm.caName }</h3>
	                        <c:forTokens var="addr" items="${ cm.caAddress }" delims="," varStatus="status">
                            <c:if test="${ status.index eq 0 }">
                            	<c:set var="addr1" value="${ addr }"/>
                            </c:if>
                            <c:if test="${ status.index eq 1 }">
                            	<c:set var="addr2" value="${ addr }"/>
                            </c:if>
                            <c:if test="${ status.index eq 2 }">
                            	<c:set var="addr3" value="${ addr }"/>
                            </c:if>
                            </c:forTokens>
	                        <p style="color: #96877D">${ addr2 }<br>
	                         ${ addr3 }</p>
	                    </div>
	                </div>
	            </div>
            </c:when>
            </c:choose> 
          
            </c:forEach>
            </div>
            
        </div>
        
        <!-- 페이징 바 -->
        <div aria-label="Page navigation" class="cafe-order-page">
            <ul class="pagination">
                <li class="page-item">
                <a class="page-link" id="page-color" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
                </li>
                <li class="page-item" id="page-hover"><a class="page-link" id="page-color" href="#">1</a></li>
                <li class="page-item"><a class="page-link" id="page-color" href="#">2</a></li>
                <li class="page-item"><a class="page-link" id="page-color" href="#">3</a></li>
                <li class="page-item">
                <a class="page-link" id="page-color" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                </li>
            </ul>
            </div>

    </section>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>