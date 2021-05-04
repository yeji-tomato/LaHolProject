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
    <style>
    .classphotos{
    	height : 50vh; 
    	width : 45vw;
    }
    
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}

    </style>   
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
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clThumbnail }" class="d-block w-100" alt="..." style="width: 400px; height:450px;">
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clPhoto }" class="d-block w-100" alt="..." style="width: 400px; height:450px;">
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.trPhoto }" alt="..." style="width: 400px; height:450px;">
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
                  <table class="cl-table" style="width : 500px;">
                    <thead>
                      <tr>
                        <td colspan="3">
                          <pre class="cl-title">${ coffeeclass.className }</pre>
                        </td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
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
                        <td> 
                          <ul style="border-left: 2px solid black;">
                            <li>수강정원</li>
                            <li>${ coffeeclass.studentMax }</li>
                          </ul>
                        </td>
                      </tr>
                      <fmt:formatDate var="Date" value="${ coffeeclass.classDate }" pattern="yyyy-MM-dd[E]"/>
                      <tr>
                        <td>날짜</td>
                        <td name="classDate" style="width: 150px;">
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
                      <tr><td></td></tr>
                      <tr><td></td></tr>
                      <tr>
                      	
                        <td colspan="3" style="background-color :none; border:0px; cursor: pointer; color : orange;" onclick="location.href='${ contextPath }/cafe/detail?caCode=${ coffeeclass.cafeNo }'"> ☕☕연계 카페로 이동하기</td>             
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
              
				<!-- 일반사용자들에게 보여지는 버튼 or 자신의 사업장이 아닌 클래스 열람시 보여지는 버튼 -->
                <c:if test="${ loginUser == NULL || loginUser.id ne coffeeclass.clWriter }">
                  <div class="row row-cols-auto">
				    <div class="col">
				      <button class="btn" id = "register-btn">
                	  수강신청
	                  <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
	                </button> 
				    </div>
				    <div class="col">
				      <button type="button" class="btn" id = "cart-btn">
	                  	  장바구니
	                  <i class="fa fa-shopping-cart" aria-hidden="true"></i>
	                	</button>
	                	<!-- 장바구니 -->
		                <form id = "cartclass" action="${ contextPath }/cart/cartclass" method="post">
		             	<input type="hidden" name="userId" value="${ sessionScope.loginUser.id }">
		               	<input type="hidden" id= "class_no" name="classNo" value="${ coffeeclass.classNo }">
		               	<input type="hidden" id= "class_name" name="cartName" value="${ coffeeclass.className }">
		               	<input type="hidden" id="cl_price" name="cartPrice" value="${ coffeeclass.clPrice}">
		              <%--   <input type="hidden" id = "cl_date" name="shipFee" value = "${ coffeeclass.classDate }"> --%>
		                <input type="hidden" id = "cl_time" name="clTime" value = "${  coffeeclass.classDate }">
		                </form>
				    </div>
				    <div class="col">
				   	<!--  <button type="button" class="btn" id="report-btn" style="width : 5vw; height : 8vh; background-color : #935039; color:white;">
	                  	<p style="font-size : 17px;">신고</p>
	                    <i class="fa fa-bullhorn" aria-hidden="true" id="reportclass" data-bs-toggle="modal" data-bs-target="#exampleModal" 
	                    style=" color : white; margin-bottom:2px; margin-right:2px;"></i>
	                	</button> -->
				     
				     <!--클래스 신고-->                    
	                    <button style="width : 5vw; height : 8vh;" id="rep-btn" class="btn" >
	                      <div class="report" style="margin-bottom: 3vh;">
	                      	신고<br>
	                        <i class="fa fa-bullhorn" aria-hidden="true" id="reportclass" data-bs-toggle="modal" data-bs-target="#exampleModal" style=" color:white;"></i>
	                      </div>
	                    </button> 
				    </div>
				   <!--  <button class="btn" type="button" id = "register-btn" style="width : 5vw; height : 8vh;">
                     	신고 &nbsp;
                  		<i class="fa fa-bullhorn" aria-hidden="true"  style="color : white; text-align : center" id="reportclass" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
                	</button>  -->
  					</div>  
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
                <button type="button" class="btn btn-primary" id="delete-btn" data-bs-toggle="modal" data-bs-target="#deleteModal"
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
                <div class="row align-items-center py-md-3 detailinfo">
                    <!--사진-->
                    <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2">
                    	<img class="d-block rounded-3" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clThumbnail }" alt="Image">
                    </div>
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
              <div class="row align-items-center py-4 py-lg-5 detailinfo">
                <div class="col-lg-5 col-md-6 offset-lg-1"><img class="d-block rounded-3 classphotos" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clPhoto} " alt="Map"></div>
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4">
                <h2 class="h3 mb-4 pb-2">클래스 커리큘럼</h2>
                <p class="fs-sm text-muted pb-md-2" style="white-space: pre-line;"> ${ coffeeclass.classCurri }</p>
                </div>
              </div>
              <!-- Product description section 3-->
              <div class="row align-items-center py-md-3 detailinfo">
                <!--사진-->
                <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2"><img class="d-block rounded-3 classphotos" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.trPhoto}" alt="Image"></div>
                <!--설명-->
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
                <h2 class="h3 mb-4 pb-2">강사 소개</h2>
                <h6 class="fs-base mb-3">${ coffeeclass.trName }&nbsp;강사님</h6>
                <p class="fs-sm text-muted pb-2" style="white-space: pre-line;">${ coffeeclass.trIntro }</p>
                </div>
             </div>
              <%-- <!-- Product description section 4-->
              <div class="row align-items-center py-4 py-lg-5 detailinfo">
                
                <!-- cafeMap.jsp -->
                 <input type="hidden" id="la" value="${ cafeInfo.caLa }">
			     <input type="hidden" id="lo" value="${ cafeInfo.caLo }">
			     
				<div id="map" style="width:100%;height:60vh;"></div>
			    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3400cb260ccc2b8ecfb54e177422380a&libraries=services&libraries=services"></script>
				<script>
				var mapla = parseFloat(document.getElementById('la').value);
				var maplo = parseFloat(document.getElementById('lo').value);
				var mapContainer = document.getElementById('map'), // 지도의 중심좌표
			    mapOption = { 
			        center: new kakao.maps.LatLng(mapla, maplo), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    }; 
			
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
				// 지도에 마커를 표시합니다 
				var marker = new kakao.maps.Marker({
				    map: map, 
				    position: new kakao.maps.LatLng(mapla, maplo)
				});
			
				// 커스텀 오버레이에 표시할 컨텐츠 입니다
				// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
				// 별도의 이벤트 메소드를 제공하지 않습니다 
				var content = '<div class="wrap">' + 
				            '    <div class="info">' + 
				            '        <div class="title">' + 
				            '            ${ cafeInfo.caName }' + 
				            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
				            '        </div>' + 
				            '        <div class="body">' + 
				            '            <div class="img">' +
				            '                <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.mainPhoto }" width="73" height="70">' +
				            '           </div>' + 
				            '            <div class="desc">' + 
				            '                <div class="ellipsis">${ addr2 }</div>' + 
				            '                <div class="jibun ellipsis">${ addr3 }</div>' + 
				            '            </div>' + 
				            '        </div>' + 
				            '    </div>' +    
				            '</div>';
			
				// 마커 위에 커스텀오버레이를 표시합니다
				// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				var overlay = new kakao.maps.CustomOverlay({
				    content: content,
				    map: map,
				    position: marker.getPosition()       
				});
			
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(marker, 'click', function() {
				    overlay.setMap(map);
				});
			
				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
				function closeOverlay() {
				    overlay.setMap(null);     
				}
				</script> 
                
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4">
                <h2 class="h3 mb-4 pb-2">클래스 위치</h2>
                <h6>${ coffeeclass.classLoca }</h6>
                </div>
              </div>  --%>
        </div>
             <!-- 후기 , Q&A -->
    		<jsp:include page="/WEB-INF/views/coffeeclass/class_detail_comment.jsp"/>
        </div>
        

    
  
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
	
	<!-- 모달 (신고, 삭제) -->
	<jsp:include page="/WEB-INF/views/coffeeclass/class_detail_modal.jsp"/>
	
	<!-- 장바구니 insert -->
	<script>	
	$(document).on("click", "#cart-btn", function(){
		 if(confirm("장바구니로 이동하시겠습니까?") == true){
			 $("#cartclass").submit();
		    }
		    else{
		        return "";
		    }
	});	
	</script> 
	<!-- 바로구매 -->
	<script>
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