<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">  
<title>Lahol-CoffeeClassMain</title>
<!-- bootstrap css-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<!-- search css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/coffeeclass/busmain.css">

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
                    strings: ["CLASS REGISTER"],
                    speed: 200,
                    loop: true
                    }).go();
            </script>           

	<!-- 클래스 개설 설명 -->
	<div style="background-color: peach; margin-top: 10vh;">	
		<div class="row">
	    <div class="col-8" >
	    	<div class="intro-text" style="margin-left : 10vw;">
	    	<h3>라홀의 선생님이 되어주세요 !</h3><br><br><br>
	    	<h5>커피와 관련된 지식이 검증된 사람이라면 누구나 클래스를 운영하실 수 있어요. </h5>
	    	<h5>더 많은 사람과 커피에 대한 사랑을 나눌 수 있는 기회, <br> 내 클래스를 더 널리 알릴 수 있는 기회를 라홀이 제공해드립니다.</h5>
			</div>
	    </div>
	    <div class="col-4" style="text-align: left;">
	    	<img src="${ contextPath }/resources/img/coffeeclass/bus_create.png">
	    </div>
	  	</div>
	</div>
	
	<!-- 클래스 개설 절차 -->
	<div style="margin-top: 25px;">
		<h2 style="text-align : center;">클래스 개설 절차</h2>
		<div class="row">
		    <div class="col-sm"> <img src="${ contextPath }/resources/img/coffeeclass/step1.PNG" class="step-photos"></div>
		    <div class="col-sm"> <img src="${ contextPath }/resources/img/coffeeclass/step2.PNG" class="step-photos"></div>
		    <div class="col-sm"> <img src="${ contextPath }/resources/img/coffeeclass/step3.PNG" class="step-photos"></div>
     	</div>
	</div>

     
     <!-- 클래스 버튼 -->
     <div style="margin-top: 80px; text-align: center;">
     <!-- 클래스 개설 버튼 -->
     	<a href="${ contextPath }/coffeeclass/createclass" class="create-btn" id = "createclass">클래스 개설하기</a>
     <!-- 클래스 메인페이지 이동 버튼 -->
     	<a href="${ contextPath }/coffeeclass" class="create-btn" id = "createclass">클래스 둘러보기</a>
     </div>


       
    
    
   <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>