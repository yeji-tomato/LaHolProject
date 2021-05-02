<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lahol-CoffeeClassMain</title>
<!-- bootstrap css-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<!-- search css -->
<link rel="stylesheet"
	href="${ contextPath }/resources/css/coffeeclass/busmain.css">

</head>
<body>

	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />

	<section class="Classheader">
		<div class="headSearch">
			<div id="parallelogram"></div>
			<div class="cafe-title">
				<!-- <span id="spanTitle">CLASS REGISTER</span> -->
				<img src="${ contextPath }/resources/img/coffeeclass/bustitle.png"
					style="height: 50vh; margin: 10vw;">
				<button class="buttons"
					onclick="location.href = '${ contextPath }/coffeeclass/createclass'">클래스
					개설하기</button>
				<button class="buttons"
					onclick="location.href = '${ contextPath }/coffeeclass'">
					클래스 둘러보기</a>
				</button>
			</div>
		</div>
	</section>


	<!-- 클래스 개설 설명 -->
	<div style="background-color: peach; margin-top: 14vh;">
		<div class="row">
			<div class="col-7">
				<div class="intro-text" style="margin-left: 8vw; margin-top: 9vh;">
					<h3>라홀의 선생님이 되어주세요 !</h3>
					<br>
					<br>
					<br>
					<h5>커피와 관련된 지식이 검증된 사람이라면 누구나 클래스를 운영하실 수 있어요.</h5>
					<h5>
						더 많은 사람과 커피에 대한 사랑을 나눌 수 있는 기회, <br> 내 클래스를 더 널리 알릴 수 있는 기회를
						라홀이 제공해드립니다.
					</h5>
				</div>
			</div>
		    <div class="col-4" style="text-align: left;">
				<img src="${ contextPath }/resources/img/coffeeclass/bus_create.png">
			</div>
	
	
		</div>
	</div>

	<section id="bottom-container" style="margin-top: 20vh;">
		<div id="title-area"><p style="background-color : #f8e18d; border-radius:10px;">&nbsp;&nbsp;클래스 개설 절차&nbsp;&nbsp;</p></div>
		<div id="process-card-container">
			<div class="process-card">
				<div class="right-box">
					<div class="card-title">1. 클래스 등록</div>
					<div class="card-desc">Lahol의 사업자로 회원가입을 한 뒤, 클래스 등록 양식에 맞춰
						클래스 개설신청을 해주세요</div>
				</div>
			</div>
			<div class="process-card">
				<div class="right-box">
					<div class="card-title">2. 검토 후 승인</div>
					<div class="card-desc">입력하신 정보는 관리자의 검토를 받게 됩니다. 사실여부 정도만
						확인하니 이 과정을 크게 우려하지 마세요.</div>
				</div>
			</div>
			<div class="process-card">
				<div class="right-box">
					<div class="card-title">
						3. 클래스 개설 & <br /> 정산
					</div>
					<div class="card-desc">승인 완료 후 마이페이지에서 결과를 확인하세요. 클래수 종료 후 정산
						받으실 수 있습니다.</div>
				</div>
			</div>
		</div>
	</section>
	
	<section id="bottom-container">
		<div id="title-area"><p style="background-color : #f8e18d; border-radius:10px;">&nbsp;&nbsp;클래스 개설 FAQ&nbsp;&nbsp;</p></div>
		<div id="process-card-container">
			<div class="accordion accordion-flush" id="accordionFlushExample">
			 <div class="accordion-item">
			   <h2 class="accordion-header" id="flush-headingOne">
			     <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			       	Q.라홀의 튜터가 되기 위한 조건은 무엇인가요?
			     </button>
			   </h2>
			   <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			     <div class="accordion-body">어렵지 않아요~ <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			   </div>
			 </div>
			 <div class="accordion-item">
			   <h2 class="accordion-header" id="flush-headingTwo">
			     <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
			        Q. 수수료는 어떻게 측정되어있나요?
			     </button>
			   </h2>
			   <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
			     <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
			   </div>
			 </div>
			 <div class="accordion-item">
			   <h2 class="accordion-header" id="flush-headingThree">
			     <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
			       Q. 어떤 클래스를 개설할 수 있나요?
			     </button>
			   </h2>
			   <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
			     <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
			    </div>
			  </div>
			</div>
		</div>
	</section>



	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp" />
</body>
</html>