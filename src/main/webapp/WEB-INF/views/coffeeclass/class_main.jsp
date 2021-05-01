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

</head>
<body>
	
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<section class="Classheader">
            <div class="headSearch">
                <!-- <div id="parallelogram"></div> -->
                <div class="cafe-title">
                    <span id="spanTitle"></span>
                </div>
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
        <main>
			<div id="searchArea">
			<form action="${ contextPath }/coffeeclass/search" method="get">
				<input id="searchValue" placeholder="에티오피아 커피유학생과 수업하고싶다면?" style="font-size : 18px; vertical-align:middle; "
				type="search" name="searchValue" <c:if test="${ !empty param.searchValue }">value="${ param.searchValue }"</c:if>>
				<button onclick="searchClass()" class="searchBtn">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
			</form>
			</div>
			<c:if test="${ loginUser != NULL && loginUser.grade eq 'P' }">
			<button id = "cr8btn" onclick="location.href ='${ contextPath }/coffeeclass/createclass'" ><img src="${ contextPath }/resources/img/coffeeclass/newbtn.png"></button>
			</c:if>
			
		</main>
			
		<script>
		    function searchClass(){
		    	var searchValue = $("#searchValue").val();
		    	location.href="${ ContextPath}/coffeeclass/search?searchValue" + searchValue;
		    	
		    }
		</script>
	</section>
    
    
    <hr style="margin-top: 5%;">
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
      
	<h2>${ nothing }</h2>
	<div class="row">
	
	<!-- 키값 -->
	<c:forEach var="cl" items="${ list }">
	<div class="col" id="classdetail" onclick="selectClass('${cl.classNo}');" style="max-width: 200px;">
 		<img src="${ contextPath }/resources/nuploadFiles/classImg/${ cl.trPhoto }" class ="card-img-top" onclick="">
		<h4>${ cl.className }</h4>
		<p>${ cl.clPrice }원</p>
		
		<!-- 별점 -->
		<div class="rating">
			<c:forEach var = "i" begin="1" end="${ cl.avggrade}">
	       	 <i class="fa fa-star"></i>
			</c:forEach>
		</div>
	</div>
	</c:forEach>
      
	<!-- 페이징 처리 -->
	<tr>
		<td colspan="6">
		<!-- 이전 -->
		<c:if test="${ pi.currentPage <= 1}">
			[이전] &nbsp;
		</c:if>
		<c:if test="${ pi.currentPage > 1 }">
			<c:url var="before" value="/coffeeclass">
				<c:param name="page" value="${ pi.currrentPage -1 }"/>
			</c:url>
			<a href="${ before }">[이전]</a> &nbsp;
		</c:if>
		
		<!-- 페이지 숫자 -->
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<font color="red" size="4"><b>[${ p }]</b></font>
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
  	</div>
  </div>
  

  
   <%-- <div class="classes">
      <h2>진행예정 / 종료된 클래스</h2>
      <div class="row">
          <div class="col" style="max-width: 200px;">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class1.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>클래스이름</h4>
              <p>가격</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half"></i>
              </div>
          </div>
      </div>
      <nav aria-label="Page navigation example">
				<ul class="pagination d-flex justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
  </div>  --%>

  	<script>
  		function selectClass(classNo){
  			location.href='${contextPath}/coffeeclass/classdetail?classNo='+classNo;
  		}
  		
 
  	</script>
  	

    </section>
    
   <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>