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
				<input id="searchValue" placeholder="에티오피아 커피유학생과 수업하고싶다면?"
				type="search" name="searchValue" <c:if test="${ !empty param.searchValue }">value="${ param.searchValue }"</c:if>>
				<button onclick="searchClass()" class="searchBtn">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
			</form>
			</div>
		</main>
			
		<script>
		    function searchClass(){
		    	var searchValue = $("#searchValue").val();
		    	location.href="${ ContextPath}/coffeeclass/search?searchValue" + searchValue;
		    	
		    }
		
		</script>
	</section>
    
  <%--     <!-- 클래스 개설 버튼 -->
     <c:if test="${ loginUser.id eq ='ADMIN' }">
     <div style="margin-top: 80px; text-align: center;">
     	<a href="${ contextPath }/coffeeclass/createclass" class="create-btn" id = "createclass">클래스 개설하기</a>
     </div>
     </c:if> --%>
    
    
    <hr style="margin-top: 5%;">
    <!-- 정렬 방식 -->
    <section class="class-content-sc">
    
    
    
    <!-- 클래스 정렬 -->
    <%--  <div class="classes">
      <h2>마이 클래스</h2>
      <div class="row">	
      
       <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class2.png" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>[원두]기후에 따른 커피맛의 변화 알아보기</h4>
              <p>30000원</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half"></i>
              </div>
          </div>
          <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class10.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>[자격증]바리스타 자격증 일주일만에 쌉가능</h4>
              <p>80000원</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
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
		</div>
 --%>
  	<div class="small-container classes">
      <h2>진행중인 클래스</h2>
      <!-- 필터 검색 -->
    <div class="filter">
     <form action="${ contextPath }/coffeeclass/filterSearch" method="get">
      <select class= "category" name="searchCondition1">
             <option disabled="disabled" selected>카테고리</option>
             <option value="all">전체</option>
             <option value="coffee">로스팅/원두</option>
             <option value="art">라테아트/디자인</option>
             <option value="dessert">디저트</option>
             <option value="certi">자격증</option>
             <option value="etc">기타</option>
       </select>
       <select class ="classLoca" name="searchCondition2">
             <option disabled="disabled" selected>지역</option>
             <option value="All">전체</option>
             <option value="Capital">서울/경기</option>
             <option value="GW">강원</option>
             <option value="BS">부산</option>
             <option value="JJ">제주</option>
        </select>
        <!--  <input type="date" value="날짜"> -->
        <%--  <select class ="clPrice" name="searchCondition">
             <option disabled="disabled" selected>가격대</option>
             <option value="<50000">50000원 미만</option>
             <option value="50000~100000">5~10만원</option>
             <option value=">=100000">100,000원 이상</option>
        </select> --%>
         <button id="filterbtn" onclick="filterOn();"><i class="fa fa-arrow-right" aria-hidden="true">GO</i></button>
       </form>
     </div>
      
      <div class="row">
         <!-- 키값 -->
      	  <c:forEach var="cl" items="${ list }">
      	  	  <div class="col" id="classdetail" onclick="selectClass('${cl.classNo}');" style="max-width: 200px;">
              	<img src="${ contextPath }/resources/nuploadFiles/classImg/${ cl.trPhoto }" class ="card-img-top" onclick="">
              	<h4>${ cl.className }</h4>
         	  	<p>${ cl.clPrice }원</p>
         	  	<!-- 별점 -->
         	  	 <div class="rating">
	             <i class="fa fa-star"></i>
	             <i class="fa fa-star-half"></i>
	             </div>
         	  </div>
      	  </c:forEach>
      
      <nav aria-label="Page navigation example">
				<ul class="pagination d-flex justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
  		</div>
  	</div>
  

  
   <div class="classes">
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
  </div> 

	<!-- 상세페이지 이동 -->
	<!-- <script>
       const detail = document.getElementById("classdetail");
       detail.addEventListener("click", function(){
           location.href='${ contextPath }/coffeeclass/classdetail';
       });
  	</script> -->
  	<script>
  		function selectClass(classNo){
  			location.href='${contextPath}/coffeeclass/classdetail?classNo='+classNo;
  		}
  		
  		// 필터 정렬
  		function filterOn(){
  			var searchCondition1 = $("#searchCondition1").val();
  			var searchCondition2 = $("#searchCondition2").val();
	    	location.href="${ ContextPath}/coffeeclass/search?searchCondition1" + searchCondition1 + "&searchCondition2" + searchCondtion2;
  		}
  	</script>
  	

    </section>
    
   <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>