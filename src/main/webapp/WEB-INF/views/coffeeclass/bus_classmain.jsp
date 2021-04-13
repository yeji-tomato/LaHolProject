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

     
     <!-- 클래스 개설 버튼 -->
     <div style="margin-top: 80px; text-align: center;">
     	<a href="${ contextPath }/coffeeclass/createclass" class="create-btn" id = "createclass">클래스 개설하기</a>
     </div>
     

     <hr style="margin-top: 5%;">
     
      <!-- 검색부분 -->
            <main>
                <div class="search-container">
                    <div class="search-box">
                        <div class="search-icon"><i class="fa fa-search search-icon"></i></div>
                        <form action="" class="search-form">
                            <input type="text" placeholder="Search" id="search" autocomplete="off" style="margin-left: 18px;">
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
 
    
    <!-- 필터 -->
    <div class="filter">
         <select class = "place">
             <option value="">지역</option>
             <option value="">서울/경기</option>
             <option value="">강원</option>
             <option value="">대구</option>
             <option value="">제주</option>
         </select>
         <input type="date" value="날짜">
         <select class= "hour">
             <option value="">시간</option>
             <option value="">오전</option>
             <option value="afternoon">오후</option>
             <option value="evening">저녁</option>
         </select>
         <button id="filterbtn"><i class="fa fa-arrow-right" aria-hidden="true">GO</i></button>
     </div>
  
       
    <!-- 정렬 방식 -->
    <section class="class-content-sc">
    
    
    <!-- 클래스 정렬 -->
     <div class="classes">
      <h2>마이 클래스</h2>
      <div class="row">
          <c:forEach var="cl" items="${ list }">
      	  	  <div class="col" id="classdetail" onclick="selectClass('${cl.classNo}');">
              	<img src="${ contextPath }/resources/img/coffeeclass/classphoto/class2.png" class ="card-img-top" onclick="">
              	<h4>${ cl.className }</h4>
         	  	<p>${ cl.clPrice }원</p>
         	  	<!-- 별점 -->
         	  </div>
      	  </c:forEach>
      	  
          <div class="col" id="classdetail">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class9.jpg" class ="card-img-top" onclick="location.href='bus_classdetail.html'">
              <h4>신라호텔 수석 바리스타가 알려주는 좋은원두</h4>
              <p>50000원</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              
              </div>
          </div>
          <div class="col" id="classdetail">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class5.jpg" class ="card-img-top" onclick="location.href='bus_classdetail.html'">
              <h4>미대출신 바리스타의 라떼아트</h4>
              <p>33000원</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half"></i>
              <i class="fa fa-star-half"></i>
              </div>
          </div>

      </div>
  </div>
  <div class="small-container classes">
      <h2>진행중인 클래스</h2>
      <div class="row">
          <div class="row">				<!-- 키값 -->
      	  <c:forEach var="cl" items="${ list }">
      	  	  <div class="col" id="classdetail" onclick="selectClass('${cl.classNo}');">
              	<img src="${ contextPath }/resources/img/coffeeclass/classphoto/class2.png" class ="card-img-top" onclick="">
              	<h4>${ cl.className }</h4>
         	  	<p>${ cl.clPrice }원</p>
         	  	<!-- 별점 -->
         	  </div>
      	  </c:forEach>
          <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class10.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>클래스이름</h4>
              <p>가격</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half"></i>
              </div>
          </div>
          <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class1.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>클래스이름</h4>
              <p>가격</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              
              </div>
          </div>
          <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class10.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>클래스이름</h4>
              <p>가격</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half"></i>
              </div>
          </div>
          <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class6.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>클래스이름</h4>
              <p>가격</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half"></i>
              </div>
          </div>
      </div>
  </div>
  <div class="classes">
      <h2>진행예정 / 종료된 클래스</h2>
      <div class="row">
          <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class1.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>클래스이름</h4>
              <p>가격</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half"></i>
              </div>
          </div>
          <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class3.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>클래스이름</h4>
              <p>가격</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              
              </div>
          </div>
          <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class11.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>클래스이름</h4>
              <p>가격</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half"></i>
              <i class="fa fa-star-half"></i>
              </div>
          </div>
          <div class="col">
              <img src="${ contextPath }/resources/img/coffeeclass/classphoto/class9.jpg" class ="card-img-top" onclick="location.href='classdetail.html'">
              <h4>클래스이름</h4>
              <p>가격</p>
              <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half"></i>
              </div>
          </div>
      </div>
  </div>
    </section>
    
  <!--   <script>
  		function selectClass(classNo){
  			location.href='${contextPath}/coffeeclass/classdetail?classNo='+classNo;
  		}
  	</script>
  	 -->

	<script>
	
	
	</script>

    
   <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>