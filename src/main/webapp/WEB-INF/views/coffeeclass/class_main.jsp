<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lahol-CoffeeClassMain</title>

<!-- search css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/coffeeclass/main.css">
<!-- icon css -->
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<style>
#searchValue::placeholder{
	color:#fbf8e8;
}

#pagetable{
 color:black
}
</style>
</head>
<body>
	
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<section class="Classheader">
            <div class="headSearch">
                <!-- 클래스 타이틀 문구 -->
                <div class="cafe-title">
                    <span id="spanTitle"></span>
                </div>
                <br><br>
                <!-- 검색 -->
				<main>
		        <div style="vertical-align:middle;">
					<div id="searchArea" style="border: 2px solid white; ">
					<form action="${ contextPath }/coffeeclass/search" method="get">
						<input id="searchValue" placeholder="에티오피아 커피유학생과 수업하고싶다면?" style="font-size : 18px; vertical-align:middle; background-color:transparent;"
						type="search" name="searchValue" <c:if test="${ !empty param.searchValue }">value="${ param.searchValue }"</c:if>>
						<button onclick="searchClass()" class="searchBtn" style="color : white;">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
					</div>
					<c:if test="${ loginUser != NULL && loginUser.grade eq 'P' }">
					<button id = "cr8btn" onclick="location.href ='${ contextPath }/coffeeclass/createclass'" >클래스<br>개설<img id="cr8btn2" src="${ contextPath }/resources/img/coffeeclass/logo-wobg.png"></button>
					</c:if>	
				</div>			
				</main>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
            <script>
                new TypeIt("#spanTitle", {
                    strings: ["COFFEE CLASS"],
                    speed: 200,
                    loop: true
                    }).go();
            </script>           
      <!-- 서치 -->
		<script>
		    function searchClass(){
		    	var searchValue = $("#searchValue").val();
		    	location.href="${ ContextPath}/coffeeclass/search?searchValue" + searchValue;
		    	
		    }
		</script>
	</section>
    
    
   
    <!-- 정렬 방식 -->
    <section class="class-content-sc">
 
  	<div class="small-container classes">
    <h2>진행중인 클래스</h2>
    
    <!-- 필터 검색 -->
    <div class="filter select animated">
     <form action="${ contextPath }/coffeeclass/filter" method="get">
      <select class= "category options animated popInTo" name="searchCategory">
             <option disabled="disabled" selected>카테고리</option>
             <option class ="option" value="all">전체</option>
             <option class ="option" value="coffee">로스팅/원두</option>
             <option class ="option" value="art">라테아트/디자인</option>
             <option class ="option" value="dessert">디저트</option>
             <option class ="option" value="certi">자격증</option>
             <option class ="option" value="etc">기타</option>
       </select>
       <select class ="classLoca options animated popInTo" name="searchLocation">
             <option disabled="disabled" selected>지역</option>
             <option class ="option" value="all">전체</option>
             <option class ="option" value="서울">서울</option>
             <option class ="option" value="경기">경기</option>
             <option class ="option" value="강원">강원</option>
             <option class ="option" value="부산">부산</option>
             <option class ="option" value="제주">제주</option>
        </select>
         <button id="filterbtn" type="submit"><i class="fa fa-arrow-right" aria-hidden="true">GO</i></button>
       </form>
     </div>
    
    <div style="font-size: 30px; margin : 15vh;">
	<p style="text-align : center;">${ nothing }</p>
	</div>
	
	<div class="row">	
	<!-- 각 카페에 대한 리스트 -->
	<c:forEach var="cl" items="${ list }">
	<c:if test="${ cl.status eq 'Y' }">
	<div class="col" id="classdetail" onclick="selectClass('${cl.classNo}');" style="max-width: 200px; margin: 2vw;">
 		<img src="${ contextPath }/resources/nuploadFiles/classImg/${ cl.clThumbnail }" class ="card-img-top">
		<h4 style="padding-top: 5vh; height: 40px;">${ cl.className }</h4>
		
		<p style="float:left; padding-top: 7vh;">${ cl.clPrice }원 </p>
		
		<!-- 별점 -->
		<div class="rating" style="float:right; padding-top: 7vh;">
		
			<c:forEach var = "i" begin="1" end="${ cl.avggrade }">
	       	 <i class="fa fa-star"></i>
			</c:forEach>
			<c:if test="${ cl.avggrade ne 0 }">
			 [${ cl.avggrade }점]
			</c:if> 
		</div>
	</div>
	</c:if>
	</c:forEach>
	
	
      
	<!-- 페이징 처리 -->
	<table id="pagetable">
		<tr>
			<td colspan="6"  style="text-align : center;">
			<!-- 이전 -->
			<c:if test="${ pi.currentPage <= 1}">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="/coffeeclass">
					<c:param name="page" value="${ pi.currentPage -1 }"/>
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
			</c:if>
			
			<!-- 페이지 숫자 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="orange" size="4"><b>[${ p }]</b></font> &nbsp;
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="/coffeeclass">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>	
			</c:forEach>
		
			<!-- 다음 -->
			<c:if test="${ pi.currentPage >= pi.maxPage}">
				[다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="/coffeeclass">
					<c:param name="page" value="${ pi.currentPage + 1 }"/>
				</c:url>
				<a href="${ after }">[다음]</a>
			</c:if>
			</td>
		</tr>
	</table>	
  	</div>
  </div>
 </section>
  	<script>
  		function selectClass(classNo){
  			location.href='${contextPath}/coffeeclass/classdetail?classNo='+classNo;
  		}
  	</script>

   
    
   <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>