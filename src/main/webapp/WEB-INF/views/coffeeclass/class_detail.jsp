<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>  
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClassDetail</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!-- css추가 -->
    <link rel="stylesheet" href="${ contextPath }/resources/css/coffeeclass/classdetail.css">
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>

    
    
</head>
<body>
   	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
   
    <div class="container" style="margin-top: 20vh;">
        <div class="row">
            <!--왼쪽-->
            <div class="col">
            <!-- <img src="../resources/images/class/classp7.jpg" style="width: 400px; height: 500px;"> -->
            <!-- carousel -->
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner" id="caroselLeft">
                <div class="carousel-item active" data-bs-interval="10000">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clThumbnail }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clPhoto }" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.trPhoto }" alt="...">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>


            </div>
            <!--오른쪽-->
            <div class="col">
              <div class="cl-info">
                  <table class="cl-table">
                    <thead>
                      <tr>
                        <td colspan="3">
                          <pre class="cl-title">${ coffeeclass.className }</pre>
                        </td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>주최카페</td> <!-- cafeNo를 통해 이름 불러오기 -->
                        <td colspan="2">${ coffeeclass.cafeNo }</td>
                      </tr>
                      <tr>
                        <td>연계 카페명</td> <!-- cafeNo를 통해 이름 불러오기 -->
                        <td> ${ coffeeclass.cafeNo }</td>
                        <!--마우스 오버시 등장하는 정보-->              
                        <div class="help-tip" style="float:right;">
                    
                          <div class="info">
                          <p>카페이름 : ${ coffeeclass.cafeNo } </p> <!-- cafeNo를 통해 이름 불러오기 -->
                          <p>카페 위치 :  ${ coffeeclass.cafeNo }   </p> <!-- cafeNo를 통해  -->
                          <a href = "${ ContextPath }/cafe/user/here">☕카페보러가기</a>
                          </div>
                      
                          </div>
                       </td>
                      </tr>
                      <tr>
                        <td>
                          <ul>
                            <li>난이도</li>
                            <li>소요시간</li>
                          </ul>
                        </td>
                        <td>
                          <ul style="border-left: 2px solid black;">
                            <li>난이도</li>
                            <li>소요시간</li>
                          </ul>
                        </td>
                        <td>
                          <ul style="border-left: 2px solid black;">
                            <li>${ coffeeclass.classLvl }</li>
                            <li>${ coffeeclass.clRuntime }</li>
                          </ul>
                        </td>
                      </tr>
                      <tr>
                        <td>날짜</td>
                        <td colspan="2">
                          <select style="width: 80%;">
                            <option value="" class = "selectdate" disabled ="disabled" selected>날짜</option> 
                            <option value="" class = "selectdate">"${ coffeeclass.classDate }"</option>
                          </select>          
                        </td>
                      </tr>
                      <tr>
                        <td>시간</td>
                        <td colspan="2">
                          <select style="width: 80%;">
                            <option value="" class = "selecttime" disabled="disabled" selected>시간</option>
                          	<c:forEach var="time" items="#{ classTimes }">
                           		<option class = "selecttime" name="classTime" value="${ time }">${ time }</option>
                        	</c:forEach>
                        </select>          
                        </td>
                      </tr>
                      <tr>
                        <td>결제금액</td>
                        <td colspan="2">
                          ${ coffeeclass.clPrice }원
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="btnDiv" id = "classupdate">
                    <form action="${ contextPath }/coffeeclass/register" method="POST">
                    	<input type="hidden" id="user_id" name="buyerId" value="${ sessionScope.loginUser.id }">
                    	<input type="hidden" id= "class_no" name="classNo" value="${ coffeeclass.classNo }">
                    	<input type="hidden" id= "class_name" name="className" value="${ coffeeclass.className }">
                    	<input type="hidden" id="cl_price" name="clPrice" value="${ coffeeclass.clPrice}">
	                    <input type="hidden" id = "cl_date" name="classDate" value = "${ coffeeclass.classDate }">
	                    <input type="hidden" id = "cl_time" name="classTime" value = "${ coffeeclass.classTime }">
	                    <button class="btn" id = "register-btn" onclick="onSubmit();">
	                    	  수강신청
	                      <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
	                    </button>
                    </form>
                    <button type="button" class="btn" id = "cart-btn">
                      	  장바구니
                      <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    </button>
                    
                     <!--클래스 신고-->                    
                    <button style="border:transparent; background-color:transparent;">
                      <div class="report" style="margin-bottom: 3vh;">
                        <i class="fa fa-bullhorn" aria-hidden="true" id="reportclass" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
                      </div>
                    </button>
                   
                    </div> 
                    
                    <div class="btnDiv">
	                    <button type="button" class= "btn" id = "register-btn"
	                     onclick="location.href='${ contextPath }/coffeeclass/updateclass?classNo=${ coffeeclass.classNo }'">
	                      	클래스 정보수정
	                      <i class="fa fa-wrench" aria-hidden="true"></i>
	                    </button>                     
	                    <button type="button" class="btn btn-primary" id="cart-btn" data-bs-toggle="modal" data-bs-target="#deleteModal"
	                     >
	                                             클래스 삭제
	                    <i class="fa fa-trash" aria-hidden="true"></i> 
	                    </button>
                    </div>     
                   
              </div>
        </div>
    </div>
  </div>

      <!-- tab -->
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">
              상세정보
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button" role="tab" aria-controls="review" aria-selected="false">
              후기
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="qa-tab" data-bs-toggle="tab" data-bs-target="#qa" type="button" role="tab" aria-controls="qa" aria-selected="false">Q&A</button>
        </li>
        </ul>
        <div class="tab-content" id="myTabContent">
        
        
        <!-- 상세 정보 -->
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <!-- Product description section 1-->
                <div class="row align-items-center py-md-3">
                    <!--사진-->
                    <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2"><img class="d-block rounded-3" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clThumbnail }" alt="Image"></div>
                    <!--설명-->
                    <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
                    <h2 class="h3 mb-4 pb-2">클래스 소개</h2>
                    <h6 class="fs-base mb-3">${ coffeeclass.clShortDes }</h6>
                    <p class="fs-sm text-muted pb-2">${ coffeeclass.classDes }</p>
                    </div>
                </div>
              <!-- Product description section 2-->
              <div class="row align-items-center py-4 py-lg-5">
                <div class="col-lg-5 col-md-6 offset-lg-1"><img class="d-block rounded-3" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clPhoto} " alt="Map"></div>
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4">
                <h2 class="h3 mb-4 pb-2">클래스 커리큘럼</h2>
                <p class="fs-sm text-muted pb-md-2"> ${ coffeeclass.classCurri }</p>
                </div>
              </div>
              <!-- Product description section 1-->
              <div class="row align-items-center py-md-3">
                <!--사진-->
                <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2"><img class="d-block rounded-3" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.trPhoto}" alt="Image"></div>
                <!--설명-->
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
                <h2 class="h3 mb-4 pb-2">강사 소개</h2>
                <h6 class="fs-base mb-3">${ coffeeclass.trName }</h6>
                <p class="fs-sm text-muted pb-2">${ coffeeclass.trIntro }</p>
                </div>
            </div>
              
        </div>
        

    <!-- 후기 , Q&A -->
    <jsp:include page="/WEB-INF/views/coffeeclass/class_detail_comment.jsp"/>
  
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
	
	<!-- 모달 (신고, 삭제) -->
	<jsp:include page="/WEB-INF/views/coffeeclass/class_detail_modal.jsp"/>
	
	
	<!-- KG이니시스 -->
	<script>
	$("#register-btn").click(function){
		var IMP = window.IMP;	// 이니시스 결제 API 오픈
		IMP.init('imp95013192');
    	//var bn_code = document.getElementById("bn_code"); // 넘겨받을 값을 input으로 바꾼것의 id
    	//var duration = document.getElementById("duration"); // 넘겨받을 값을 input으로 바꾼것의 id
		var payitem = document.getElementById("class_name");
    	var price = document.getElementById("cl_price");
    	var classdate = document.getElementById("cl_date");
    	var classtime = document.getElementById("cl_time");
    	
    	if(classdate.value == "") {
			Swal.fire({
				title : "날짜를 선택해주세요",
				icon : 'warning'
			});
			return;
		}
		
		if(duration.value == "") {
			Swal.fire({
				title : "시간을 선택해주세요",
				icon : 'warning'
			});
			return;
		}
		
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : payitem,			// 결제하는 상품명
			amount : price,			// 결제 금액
			buyer_email : '${ sessionScope.loginUser.email }',
			buyer_name : '${ sessionScope.loginUser.name }',
			buyer_tel : '${ sessionScope.loginUser.phone }',
			buyer_addr : '${ addr[1] }' + '${ addr[2] }',
			buyer_postcode : '${ addr[0] }'
		}, function(rsp) {
			if(rsp.success) {
				var msg = "결제가 완료되었습니다.<br>";
				// msg += '고유 ID : ' + rsp.imp_uid + "<br>";
				// msg += '상점 거래 ID : ' + rsp.merchant_uid + "<br>";
				// msg += '결제 금액 : ' + rsp.paid_amount + "<br>";
				msg += '카드 승인번호 : ' + rsp.apply_num;
				
				Swal.fire({
					title : msg,
					icon : 'success'
				}).then(function(result){
					if(result.isConfirmed) {
	    				$("#ad_form").submit();
					}
				});
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '[에러내용]<br>' + rsp.error_msg;
				
				Swal.fire({
					title : msg,
					icon : 'warning'
				});
			}
		});
	}

	</script>
      
</body>
</html>