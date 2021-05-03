<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 수강신청</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="${ contextPath }/resources/css/basket/basket.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>  
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>  
<style>

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	<%@include file="/WEB-INF/views/cart/cartJS.jsp" %>
	<section id="content" class="content_css" >
            <div class="outer1">
            
            <h1 style="text-align:center;">클래스 수강신청 페이지</h1><br><br><br>
              
                <div class="cart">
                    <div class="store1"> 
                        <div class="oder">
                                    <input type="hidden" name="cmd" value="order">
                                    <div class="basketdiv" id="basket" style="cursor:default;" >

                                        <div class="row head">
                                            <div class="subdiv">
                                                <div class="check">선택</div>
                                                <div class="img"></div>
                                                <div class="pname">상품명</div>
                                            </div>
                                            <div class="subdiv">
                                                <div class="basketprice">가격</div> 
                                                <div class="date" style="width : 180px;">강의일자</div>
                                                <div class="time" style="width : 200px;">강의시간</div>
                                                
                                            </div>
                                            
                                            <div class="split"></div>
                                        </div>
                                        
                                        
                                        
                                        <!-- 상품 -->  
                                        <form id="registerClass" action="${ contextPath }/coffeeclass/registser/insert" method="post">
                                        <div class="row data" style="cursor:default;">
                                            <div class="subdiv">
                                                <div class="check">
                                                    <label class="checkbox">
                                                        <input type="checkbox" id="checkB" name="buy" value="260" checked/>
                                                        <span class="warning"></span>
                                                    </label>
                                                </div>
                                                <div class="img"><img style="height:100px; width:100px;" src="${ contextPath }/resources/nuploadFiles/classImg/${ cl.clThumbnail }" width="100"></div>
                                                 <div class="pname">
                                                   <span><input type="hidden" id="className" name="payItem" value="${ cl.className }"><p style="text-align:center;">${ cl.className }</p></span>
                                                </div>
                                            </div>
                                            <fmt:formatDate var="Date" value="${ cl.classDate }" pattern="yyyy-MM-dd[E]"/>
                                            <div class="subdiv">
                                            	
                                                <div class="basketprice"><input type="hidden" name="payPrice" value="${ cl.clPrice }">${ cl.clPrice }</div>
                                                <div class="date" style="width : 180px;">
                                                    ${ Date }   
                                                </div>
                                                <div class="time" style="text-align: center; width : 200px;">
                                                <input type="hidden" name="clTime" value="${ selectedTime }">
                                                	${ selectedTime }
                                                </div>
                                                <input type="hidden" id="cpnTotal" name="couponPrice">
                                                <input type="hidden" id="tPrice" name="total">
                                            </div>
                                        </div>
                                        
	                                        <c:set var= "total" value="${total + cl.clPrice }"/> 
											<input type="hidden" name="buyId" value="${ sessionScope.loginUser.id }">
					                    	<input type="hidden" name="clPayNo" value="${ cl.classNo }">
					                    	
                                        </form>
                                       
						               
                                    </div>                                                             
                            </div>
                            </div><!-- /store1 -->
                            </div><!-- /cart -->
                        
                        
                        
						
						
                           
                       <div>
                           <!-- 쿠폰 및 전체 금액 -->
                          <div class="row py-5 p-4 rounded shadow-sm">
						     <div class="col-lg-6">
						       <div class="rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="background: #F3EFEB;">적용 가능한 할인쿠폰</div>
						       <div class="p-4">
						         <div class="input-group mb-4 border rounded-pill p-2">
						           <input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0" id="applyCoupon">
						           <c:choose>
							           <c:when test="${ loginUser!= null }">
							           <div class="input-group-append border-0">
							             <button id="button-addon3" type="button" class="btn px-4 rounded-pill" style="background: #5A452E; color: white;" onclick="winPopup();"><i class="fa fa-gift mr-2"></i>coupon</button>
							           </div>
							           </c:when>
							           <c:when test="${ loginUser == null }">
							           <div class="input-group-append border-0">
							             <button id="button-addon3" type="button" class="btn px-4 rounded-pill" style="background: #5A452E; color: white;" onclick="alert('쿠폰사용을 위해 로그인을 해주세요 :)')"><i class="fa fa-gift mr-2"></i>coupon</button>
							           </div>
							           </c:when>
						           </c:choose>
						         </div>
						         <p id="couponSequence" style="color: white"></p>
						       </div>
						       <script type="text/javascript">
								    function winPopup() {
								        var popUrl = "${contextPath}/cart/coupon?total=${total}";
								        var popOption = "width=10vw,height=10vh";
								        window.open(popUrl, popOption, "_blank");						       
								    }
								</script>
						     </div>
						     
						     
						     
						     <div class="col-lg-6">
						       <div class="rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="background: #F3EFEB;">결제 정보</div>
						       <div class="p-4">
						         <ul class="list-unstyled mb-4">
						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">상품금액 </strong><strong id="sumPrice"><c:out value="${cl.clPrice}"/></strong></li>
						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">할인금액</strong><strong id="couponPrice">0</strong></li>
						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">결제금액</strong>
						             <h5 class="font-weight-bold" id="resultPrice"><c:out value="${total}"/></h5>
						           </li>
						         </ul>
						         <c:choose>

									<c:when test="${loginUser != null}">  
							         <button id="check_module" class="btn rounded-pill py-2 btn-block" style="background: #5A452E; color: white; width : 100%" type="button">결제하기</button>
									</c:when>
									<c:when test="${loginUser == null}"> 
									 	<button id="check_module" class="btn rounded-pill py-2 btn-block nonlog" style="background: #5A452E; color: white; width : 100%" 
										 type="button" disabled="disable">결제하기</button>
									 <div class="onlyLoginUser"><p style="text-align: center; color:gray;">로그인한 회원만 클래스 수강이 가능합니다.</p></div>
									</c:when>
								</c:choose>
						         
						       </div>
						     </div>
						   </div>
	          </div>     
	          </div>

			
			<script>
				$("#check_module").click(function () {
					
				var cfName = $("#className").val(); // 물품명
				var cafeResNo = $("#classNo").val();
				var cfSum = $("#sumPrice").text();	// 결제 금액
				var couponPrice = $("#couponPrice").text();
				var resultPrice = $("#resultPrice").text();
				
				var couponNo = $("#couponSequence").text();

					
				var IMP = window.IMP; // 생략가능
				IMP.init('imp85155473');
				// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				IMP.request_pay({
				pg: 'html5_inicis', // version 1.1.0부터 지원.
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: cfName,  // 이니시스 앱에서 보여질 상품명
				amount: 100,  // 이니시스 앱에서 보여질 가격 : 추후 resultPrice 로 바꾸기
				
				//임대인의 이메일
				buyer_email: '${ sessionScope.loginUser.email }',
				//임대인의 이름
				buyer_name: '${ sessionScope.loginUser.name }',
				//임대인의 휴대전화
				buyer_tel: '${ sessionScope.loginUser.phone }',
				//임대인의주소
				buyer_addr: '${ addr[1] }' + '${ addr[2] }',
				
				buyer_postcode: '${ addr[0] }',
				m_redirect_url: 'https://www.yourdomain.com/payments/complete'
				}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
		
				var msg = '결제가 완료되었습니다.';
				/* msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num; */
				Swal.fire({
					title : msg,
					icon : 'success'
				}).then(function(result){
					
					$("#cpnTotal").val(couponPrice);
					$("#tPrice").val(resultPrice);
					
					console.log($("#cpnTotal").val(couponPrice));
					console.log($("#tPrice").val(resultPrice));
					
					/* $.ajax({
		       			url:"${contextPath}/coffeeclass/register",
		        		type : "post",
		        		data : {
		        			payItem : cfName,
		        			cafeRes : cafeResNo,
		        			payPrice : '${cl.clPrice}',
		        			payDC : couponPrice,
		        			payTotal : resultPrice	
		        		},
		        		success : function(data){
		        			location.href="${ contextPath }/coffeeclass/class_detail?classNo="+${cl.classNo};
		        		},
		        		error : function(e){
							console.log(e);
						}
		        		
		       		}); */
					
					
					$.ajax({
		       			url:"${ contextPath }/cart/coupon/use",
		        		type : "post",
		        		data : {
		        			couponCode : couponNo
		        		},
		        		success : function(data){
		        			$("#registerClass").submit();
		        		},
		        		error : function(e){
							console.log(e);
						}
		        		
		       		});
					
				});
				} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				
				Swal.fire({
					title : msg,
					icon : 'warning'
				});
				
				}
				
				});
				});
			</script>

            
        </section>
        <jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>