<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 주문 내역서</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="${ contextPath }/resources/css/basket/basket.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	<%@include file="/WEB-INF/views/cart/cartJS.jsp" %>
	<section id="content" class="content_css" >
            <div class="outer1">
              
                <div class="cart">
                    <div class="store1"> 
                        <div class="oder">
                                    <input type="hidden" name="cmd" value="order">
                                    <div class="basketdiv" id="basket">

                                        <div class="row head">
                                            <div class="subdiv">
                                                <div class="check">선택</div>
                                                <div class="img">이미지</div>
                                                <div class="pname">상품명</div>
                                            </div>
                                            <div class="subdiv">
                                                <div class="basketprice">가격</div> 
                                                <div class="num">수량</div>
                                                <div class="sum">합계</div>
                                                <div class="del">자세히 보기</div>
                                            </div>
                                            <div class="subdiv">
                            
                                                <div class="basketcmd">삭제</div>
                                            </div>
                                            <div class="split"></div>
                                        </div>
                                        
                                        <!-- 상품 -->  
                                        <c:forEach var="cor" items="${ CoffeeOrder }">   
                                        <div class="row data">
                                            <div class="subdiv">
                                                <div class="check">
                                                    <label class="checkbox">
                                                        <input type="checkbox" id="checkB" name="buy" value="260" checked/>
                                                        <span class="warning"></span>
                                                    </label>
                                                </div>
                                                <div class="img"><img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cor.cfIchname }" width="100"></div>
                                                <div class="pname">
                                                	<input type="hidden" id="cfName"  value="${ cor.cfName }">
                                                    <span>${ cor.cfName }</span>
                                                </div>
                                            </div>
                                            <div class="subdiv">
                                            	
                                                <div class="basketprice">${ cor.cfPrice }</div>
                                                <div class="num">
                                                    ${ cor.cfResAmount }
                                                </div>
                                                <c:set var="cfSum" value="${ cor.cfPrice * cor.cfResAmount }"/>
                                                <input type="hidden" id="cfSum"  value="${ cfSum }">
                                                <div class="sum">${ cfSum }</div>
                                               <div class="del">
                                               	<button style="border: 0; background: white;"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                                               </div>
                                            </div>
                                            <div class="subdiv">
                                             
                                                <div class="basketcmd">
                                                
                                                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">
                                                   x
                                                </a>
                                                </div>
                                            </div>
                                        </div>
                                        <c:set var= "totalCount" value="${totalCount + cor.cfResAmount}"/>
                                        <c:set var= "total" value="${total + cfSum}"/>
                                        </c:forEach>
                                        
                                
                                    </div>
                  
                            
                                  
                                    <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: <c:out value="${totalCount}"/>개</div>
                                  
                               
                               
                            </div>
                            </div><!-- /store1 -->
                            </div><!-- /cart -->
                        
                        
                        
						
						<!-- 카페 주소 -->
						<%-- <%@include file="./cafeAddress.jsp" %> --%>
                           
                       <div>
                           <!-- 쿠폰 및 전체 금액 -->
                          <div class="row py-5 p-4 rounded shadow-sm">
						     <div class="col-lg-6">
						       <div class="rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="background: #F3EFEB;">적용 가능한 할인쿠폰</div>
						       <div class="p-4">
						         <div class="input-group mb-4 border rounded-pill p-2">
						           <input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0">
						           <div class="input-group-append border-0">
						             <button id="button-addon3" type="button" class="btn px-4 rounded-pill" style="background: #5A452E; color: white;" onclick="winPopup();"><i class="fa fa-gift mr-2"></i>coupon</button>
						           </div>
						         </div>
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
						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">상품금액 </strong><strong><c:out value="${total}"/></strong></li>
						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">할인금액</strong><strong id="couponPrice">0</strong></li>
						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">결제금액</strong>
						             <h5 class="font-weight-bold" id="resultPrice"><c:out value="${total}"/></h5>
						           </li>
						         </ul>
						         <button id="check_module" class="btn rounded-pill py-2 btn-block" style="background: #5A452E; color: white; width : 100%" type="button">결제하기</button>
						        
						       </div>
						     </div>
						   </div>
          </div>
              
              
          </div>
			
			<script>
				var cfName = $("#cfName").val();
				var cfSum = $("#cfSum").val();
				$("#check_module").click(function () {
				var IMP = window.IMP; // 생략가능
				IMP.init('imp85155473');
				// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
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
				name: cfName,
				//가격 (6개월이면 100원, 1년이면 200원으로 설정되야함)
				amount: 100,
				
				//결제 마지막 결제내역 확인란(이메일, 이름만보임)
				
				//임대인의 이메일
				buyer_email: '${ sessionScope.loginUser.email }',
				//임대인의 이름
				buyer_name: '${ sessionScope.loginUser.name }',
				//임대인의 휴대전화
				buyer_tel: '${ sessionScope.loginUser.phone }',
				//임대인의주소
				buyer_addr: '${ addr[1] }' + '${ addr[2] }',
				/*
				모바일 결제시,
				결제가 끝나고 랜딩되는 URL을 지정
				(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
				*/
				buyer_postcode: '123-456',
				m_redirect_url: 'https://www.yourdomain.com/payments/complete'
				}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
				
				// 결제 후 ALERT창	
		
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				});
				});
			</script>



            
        </section>
        <jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>