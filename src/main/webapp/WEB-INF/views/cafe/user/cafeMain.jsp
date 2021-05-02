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
						<form action="${ contextPath }/cafe/search" method="get">
                        <div class="search-icon"><i class="fa fa-search search-icon"></i></div>
                        <input type="text" placeholder="카페명 또는 지역을 검색해주세요." id="search" class="searchVal" name="searchValue" autocomplete="off" value="${ param.searchValue }">
                        <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
                            xml:space="preserve">
                        <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
                        <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
                        </svg>
                        <button class="go-icon" type="submit" style="background: transparent; border: 0"><i class="fa fa-arrow-right"></i></button>
                   		</form>
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
    <hr>
    <!-- 정렬 방식 -->
    <section class="content-cafe-sc">
        <!-- <h1 style="color: gray; margin-left: 7%;">CAFE</h1> -->
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
	                        <p style="color: #96877D; font-size: 13px;">${ addr2 }<br>
	                         ${ addr3 }</p>
	                    </div>
	                </div>
	            </div>
            </c:when>
            <c:otherwise>
            <div class="col">
            	결과에 알맞는 카페가 존재하지 않습니다.
           	</div>
            </c:otherwise>
            </c:choose>
             
            </c:forEach>
            </div>
            
        </div>
        
     	<!-- 페이징 바 -->
 	<div aria-label="Page navigation" class="cafe-order-page">
     <ul class="pagination">
         <c:if test="${ pi.currentPage > 1 }">
         <li class="page-item">
         <c:url var="before" value="/cafe/biz/orderDate?checkDate=${ param.checkDate }">
        	<c:param name="page" value="${ pi.currentPage -1 }" />
     	 </c:url>
         <a class="page-link" id="page-color" href="${ before }"   aria-label="Previous">
             <span aria-hidden="true">&laquo;</span>
         </a>
         </li>
         </c:if>
		<!-- 페이징 숫자 -->
        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
    		<c:if test="${ p eq pi.currentPage }">
       		<li class="page-item" id="page-hover"><a class="page-link" id="page-color">${ p }</a></li>
    		</c:if>	
    		<c:if test="${ p ne pi.currentPage }">
    		<c:url var="pagination" value="/cafe/biz/order">
          	<c:param name="page" value="${ p }"/>
       	</c:url>
       	 <li class="page-item"><a class="page-link" id="page-color" href="${ pagination }">${ p }</a></li>
    		 </c:if>
 			</c:forEach>
    	 <c:if test="${ pi.currentPage < pi.maxPage }">
    	 <c:url var="after" value="/cafe/biz/order">
          <c:param name="page" value="${ pi.currentPage + 1 }" />
     </c:url>
     <li class="page-item">
         <a class="page-link" id="page-color"  href="${ after }"  aria-label="Next">
             <span aria-hidden="true">&raquo;</span>
         </a>
     </li>
      </c:if>   
    </ul>
 </div>

    </section>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>