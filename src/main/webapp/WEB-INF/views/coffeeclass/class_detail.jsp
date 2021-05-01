<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  	<!-- iamport -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>    
</head>
<body>
   	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

   
    <div class="container" style="margin-top: 20vh;">
        <div class="row">
            <!--왼쪽-->
            <div class="col">
            <!-- carousel -->
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner" id="caroselLeft">
                <div class="carousel-item active" data-bs-interval="7000">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clThumbnail }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clPhoto }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="3000">
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
              <div class="cl-info" style="max-width : 22vw;">
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
                        <td style="width : 30px;">
                          <ul>
                            <li>난이도</li>
                            <li>${ coffeeclass.classLvl }</li>
                          </ul>
                        </td>
                        <td style="width : 30px;">
                          <ul style="border-left: 2px solid black;">
                            <li>소요시간</li>
                            <li>${ coffeeclass.clRuntime }</li>
                          </ul>
                        </td>
                        <td style="width : 30px;"> 
                          <ul style="border-left: 2px solid black;">
                            <li>수강정원</li>
                            <li>${ coffeeclass.studentMax }</li>
                          </ul>
                        </td>
                      </tr>
                      <fmt:formatDate var="Date" value="${ coffeeclass.classDate }" pattern="yyyy-MM-dd[E]"/>
                      <tr>
                        <td>날짜</td>
                        <td name="classDate">
                          ${ Date }  
                        </td>
                      </tr>
                      <tr>
                        <td>시간</td>
                        <td colspan="2">
                          <form id ="cl_register" action="${ contextPath }/coffeeclass/register"  method="GET">
                          <input type="hidden" id= "class_no" name="classNo" value="${ coffeeclass.classNo }">
                          <select style="width: 80%;" name = "selectedTime">
                            <option class = "selecttime" disabled="disabled" selected>시간</option>
                        	<option class = "selecttime" value="${ coffeeclass.classTime }">${ coffeeclass.classTime }</option>
                        	<c:if test="${ !empty coffeeclass.classTime2 }">
                        	<option class = "selecttime" value="${ coffeeclass.classTime2 }">${ coffeeclass.classTime2 }</option>
                        	</c:if>
                        	<c:if test="${ !empty coffeeclass.classTime3 }">
                        	<option class = "selecttime" value="${ coffeeclass.classTime3 }">${ coffeeclass.classTime3 }</option>
                        	</c:if>
                          </select> 
                          </form>       
                        </td>
                      </tr>
                      <tr>
                        <td>결제금액</td>
                        <td colspan="2">
                          ${ coffeeclass.clPrice }원
                        </td>
                      </tr>
                      <tr></tr>
                      <tr colspan="3">
                        <td style="background-color :none; border:0px; cursor: pointer;" onclick="location.href='${ contextPath }/cafe/detail?caCode=${ coffeeclass.cafeNo }'"> ☕☕연계 카페로 이동하기</td>             
                      </tr>
                    </tbody>
                  </table>
                  <div class="btnDiv" id = "classupdate">
                  
                  <script>
				function submitForm() {
					if( $('select[name=classTime]:checked').val() == 'dd'){
				    document.getElementById("envselection").submit();
					
				    
				}
				</script>
                  
                  
                  
                  
                  	<!-- 바로결제 -->
                  								
                   <%--  <form id ="cl_register" action="${ contextPath }/coffeeclass/register"  method="GET">
                    	-<input type="hidden" id= "class_no" name="classNo" value="${ coffeeclass.classNo }">
                    	<input type="hidden" id = "cl_time" name="selectedTime" value = "${ coffeeclass.classTime }">
                    	 <input type="hidden" id="user_id" name="buyerId" value="${ sessionScope.loginUser.id }">
                    	<input type="hidden" id= "class_name" name="className" value="${ coffeeclass.className }">
                    	<input type="hidden" id="cl_price" name="clPrice" value="${ coffeeclass.clPrice}">
	                    <input type="hidden" id = "cl_date" name="classDate" value = "${ coffeeclass.classDate }">
	                    
                    </form> --%>
                    
                     <!-- 일반사용자들에게 보여지는 버튼 or 자신의 사업장이 아닌 클래스 열람시 보여지는 버튼 -->
                     <c:if test="${ loginUser == NULL || loginUser.id ne coffeeclass.clWriter }">
	                     <button class="btn" id = "register-btn">
	                    	  수강신청
	                      <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
	                    </button> 
	                    <button type="button" class="btn" id = "cart-btn">
	                      	  장바구니
	                      <i class="fa fa-shopping-cart" aria-hidden="true"></i>
	                    </button>
	                    <!-- 장바구니 -->
	                    <form id = "cartclass" action="${ contextPath }/cart/cartclass" method="post">
	                    <input type="hidden" id="user_id" name="buyerId" value="${ sessionScope.loginUser.id }">
                    	<input type="hidden" id= "class_no" name="classNo" value="${ coffeeclass.classNo }">
                    	<input type="hidden" id= "class_name" name="className" value="${ coffeeclass.className }">
                    	<input type="hidden" id="cl_price" name="clPrice" value="${ coffeeclass.clPrice}">
	                    <input type="hidden" id = "cl_date" name="classDate" value = "${ coffeeclass.classDate }">
	                    <input type="hidden" id = "cl_time" name="classTime" value = "${ coffeeclass.classTime }">
	                    </form>
	                    
	                     <!--클래스 신고-->                    
	                    <button style="border:transparent; background-color:transparent;">
	                      <div class="report" style="margin-bottom: 3vh;">
	                        <i class="fa fa-bullhorn" aria-hidden="true" id="reportclass" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
	                      </div>
	                    </button>
                     </c:if>
                    </div> 
                    
                    
                    
                    <!-- 클래스 개설한 당사자에게만 보여지는 버튼 -->
                    <c:if test="${ loginUser != NULL && loginUser.id eq coffeeclass.clWriter }">
                    <div class="btnDiv">
	                    <button type="button" class= "btn" id="changeinfo"
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
                    </c:if>   
                   
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
                    <% 
                    	// 뷰페이지용 치환변수 선언
                    	pageContext.setAttribute("crcn", "\r\n");	//Space, Enter
                        pageContext.setAttribute("br", "<br/>");	// br태그
                    %>
                    <p class="fs-sm text-muted pb-2" style="white-space: pre-line;">${ coffeeclass.classDes }</p>
                    </div>
                </div>
              <!-- Product description section 2-->
              <div class="row align-items-center py-4 py-lg-5">
                <div class="col-lg-5 col-md-6 offset-lg-1"><img class="d-block rounded-3" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clPhoto} " alt="Map"></div>
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4">
                <h2 class="h3 mb-4 pb-2">클래스 커리큘럼</h2>
                <p class="fs-sm text-muted pb-md-2" style="white-space: pre-line;"> ${ coffeeclass.classCurri }</p>
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
                <p class="fs-sm text-muted pb-2" style="white-space: pre-line;">${ coffeeclass.trIntro }</p>
                </div>
            </div>
        </div>
             <!-- 후기 , Q&A -->
    		<jsp:include page="/WEB-INF/views/coffeeclass/class_detail_comment.jsp"/>
        </div>
        

    
  
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
	
	<!-- 모달 (신고, 삭제) -->
	<jsp:include page="/WEB-INF/views/coffeeclass/class_detail_modal.jsp"/>
	
	<!-- 장바구니 insert -->
	function
	
	
	
	<script>	
	$(document).on("click", "#cart-btn", function(){
		alert("장바구니에 추가되었습니다.");
		$("#cartclass").submit();
	});
	
	$(document).on("click", "#register-btn", function(){
		alert("결제페이지로 이동합니다");
		$("#cl_register").submit();
	});
	
	
	</script>
	
	
	<%-- 
	 KG이니시스
	 $("#register-btn").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp85155473');
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        // IMP.request_pay(params, callback);
        IMP.request_pay({
        pg: 'html5_inicis', // version 1.1.0부터 지원.
        /*
        'kakao':카카오페이,
        html5_inicis':이니시스(웹표준결제)
        'nice':나이스페이
        'jtnet':제이티넷
        'uplus':LG유플러스
        'danal':다날
        'payco':페이코
        'syrup':시럽페이
        'paypal':페이팔
        */
        pay_method: 'card',
        /*
        'samsung':삼성페이,
        'card':신용카드,
        'trans':실시간계좌이체,
        'vbank':가상계좌,
        'phone':휴대폰소액결제
        */
        merchant_uid: 'merchant_' + new Date().getTime(),
        /*
        merchant_uid에 경우
        https://docs.iamport.kr/implementation/payment
        위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
        참고하세요.
        나중에 포스팅 해볼게요.
        */
        //결제창에서 보여질 이름 (6개월권, 1년권인지 판별해야함)
        name: '${coffeeclass.className}',
        //가격 (6개월이면 100원, 1년이면 200원으로 설정되야함)
        amount: 100,
        // '${coffeeclass.clPrice}',
        //결제 마지막 결제내역 확인란(이메일, 이름만보임)
        
        //임대인의 이메일
        buyer_email: 'iamport@siot.do',
        //임대인의 이름
        buyer_name: '구매자이름',
        //임대인의 휴대전화
        buyer_tel: '010-1234-5678',
        //임대인의주소
        buyer_addr: '서울특별시 강남구 삼성동',
        /*
        모바일 결제시,
        결제가 끝나고 랜딩되는 URL을 지정
        (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
        */
        buyer_postcode: '123-456',
        m_redirect_url: 'http://localhost:8828/lahol/coffeeclass/',
	}, function (rsp) {
        console.log(rsp);
        if (rsp.success) {
	        // 결제 후 ALERT창
	        $.ajax({
	          method: "POST",
	          url : "${contextPath}/coffeeclass/register",
	          contentType: "application/json",
	          data : JSON.stringify({
	        	  impUid: rsp.imp_uid,
	        	  paymentId: rsp.merchant_uid,
	        	  totalPrice : rsp.paid_amount,
	        	  buyDate: rsp.paid_at,
	        	  buyerId: 'user001',
	        	  classNo: '${coffeeclass.classNo}',
	          	  className: '${coffeeclass.className}',
	        	  classPrice: '${coffeeclass.clPrice}'
	          }),
	          dataType: 'json'  
	        }).done(function(data) {
	            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	            if ( everythings_fine ) {
	              var msg = '결제가 완료되었습니다.';
	              msg += '\n고유ID : ' + rsp.imp_uid;
	              msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	              msg += '\결제 금액 : ' + rsp.paid_amount;
	              msg += '카드 승인번호 : ' + rsp.apply_num;

	              alert(msg);
	            } else {
	              //[3] 아직 제대로 결제가 되지 않았습니다.
	              //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			      
	            }
          	});
        } else {
        	var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        alert(msg);
        }
      }); // end of ajax
    }); // end of onclick 
 --%>


      
</body>
</html>