<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정기구독</title>
<link rel="stylesheet" href="bus_create.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <!-- 스토어q css -->
	<link rel="stylesheet" href="${ contextPath }/resources/css/store/subscribe/subscribe.css?3d">	
    <!-- 폰트 모음 CSS-->
    <link rel="stylesheet" href="../common/fonts/fonts.css" />
 	  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 
</head>
<body>
<!-- menubar --> 
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<!-- carousel -->
	 
    
	 <div id="aa">

	 <div class="banner" style="   height: 200px; ">
        <h1 style="padding-top: 18vh;"> 정기구독을 통하여 할인 및 주기적으로 자동 배송 받으세요!</h1>
    </div>
    
    <div>
        
        <!--입력란-->
        <div id="tbColor3"> 
        <div id="createform">
            <div class= "content-header">
                <h2 class = "intro">
                    라홀 정기 구독
                </h2>
              
                </div>

                <div class="container">
                    <!--구독 상품 정보-->
                    <div class="if">
                        <div class="np"> 
                            <div id="a">이미지</div>
                            <div id="a" style="  margin-left: 30%;">상품명</div> 
                            <div style="margin-left: 70%;" >가격</div> 
                        </div> 
                        <hr>

                        <div class="pi" > 
                            <img  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }" width="250px" height="280px "   >  
                        </div> 
                        <div class="prname">
                            <a>${s.PR_NAME }</a>
                        </div> 

                        <div class="prp" style=" margin-left: 380px; ">
                            <a> <fmt:formatNumber value="${s.PR_PRICE}" pattern="#,###"/>원  </a> 
                        </div>
                     

                    </div>
                    <hr>
                    <!--구독 할인 정보 -->
                    <form   id="terms_form" action="${ contextPath }/store/subscribe"  method="post"  >    
					 <input type="hidden" name ="PR_CODE" value="${ s.PR_CODE }">
                    <div class="sp">
                        <div class="np2"> 
                          
                            <div id="a">구독 일수</div>
                            <div id="a" style="  margin-left: 30%;">할인률</div> 
                            <div style="margin-left: 70%;">할인금액</div>  
                        </div> 

                        <div class="spi">
                            <div class="t">
                                <div>
                                    <input type="radio" name="SUBSCRIPTIONS" value="3" onclick="submitForm()">3개월
                                </div>
                                <div id="h">
                                    <a>5%</a>
                                </div>
                                <div id="hp"> 
                                    <a> <fmt:formatNumber value=" ${(s.PR_PRICE*3)*0.05  }" pattern="#,###"/> 원 </a>
                                </div>
                            </div>
                            <div class="t">
                                <div>
                                    <input type="radio" name="SUBSCRIPTIONS" value="6" onclick="submitForm()">6개월
                                </div>
                                <div id="h">
                                    <a>10%</a>
                                </div>
                                <div id="hp">   
                                    <a>  <fmt:formatNumber value=" ${(s.PR_PRICE*6)*0.1 }" pattern="#,###"/> 원</a>
                                </div>
                            </div>
                            <div class="t">
                                <div>
                                    <input type="radio" name="SUBSCRIPTIONS" value="9" >9개월
                                </div>
                                <div id="h">
                                    <a>15%</a>
                                </div>
                                <div id="hp">  
                                    <a>  <fmt:formatNumber value=" ${(s.PR_PRICE*9)*0.15 } " pattern="#,###"/>  원</a>
                                </div>
                            </div>
                        </div>
 
                    </div>

                    <!-- 결제 정보 확인-->
					
                    <div class="ss">
                    <h5  style="color:red;">최대 9개월 할인했을경우!</h5>
                        <div class="hh">
                            <div> 총금액 :  ${(s.PR_PRICE*9)*1 }   원 </div>
                            <div style="margin-left: 20%;"> 할인금액:    <fmt:formatNumber value="   ${(s.PR_PRICE*9)*0.15*1 } " pattern="#,###"/>원 </div>
                            <div style="margin-left: 20%;"> 할인된금액:  <fmt:formatNumber value="  ${  (s.PR_PRICE*9)- (s.PR_PRICE*9)*0.15 }  " pattern="#,###"/>원 </div> 
                        </div>
                    
                        <div class="hh2">
                            <div style="   margin-top: 40px; float: right;  "> = 월 구독액:    <a style="color: brown;"> <fmt:formatNumber value="  ${  ((s.PR_PRICE*9)- ((s.PR_PRICE*9)*0.15)) /9  }  " pattern="#,###"/>          원</a>  </div>
                        </div>

                    </div>

                    <hr>
 
                    <!--구독 배성 정보-->
                    <div class="deinf">
                        <h4> 주문자 회원정보와 동일한 정보를 불러옵니다  <input type="checkbox" checked="checked"  ></h4>
                       
                        <div class="di1" style="float: left;"> 
                            <table >
                               
                                <tr >
                                    <th style="width: 200px;" >구매자 성함</th>
                                    <td><input type="text" class="form-control"   name="name" required    maxlength="8" style="
                                        width: 100px; " value=" ${ loginUser.name }"></td>
                                </tr>
                                
                                <tr>
                                    <th>연락처</th>
                                    <td><input type="text" class="form-control"
                                        name="" required style="  width: 300px; " value="${ loginUser.phone  }"> </td>
                                </tr>

                                 

                                <tr>
                                    <th>배송받을 주소</th>
                                    <td><input class="form-control" type="text" style="  width: 300px;  "
                                        name="detail_address" required value="${ loginUser.addr  } "></td>
                                </tr>
                                
                                <tr>
                                    <th>주문 메시지</th>
                                    <td><textarea rows="5" cols="40"  style="  width: 300px;  " class="form-control"> </textarea></td>
                                </tr>
                            </table>
                        </div>

 
 					</div>
 					  </form>
 					  <div style="margin-top: 170px;">
                            <button id="btnArea1"  onclick="onSubmit();"  >구독</button>
                            <button type="button" id="btnArea2"
                                onclick="javascript:history.back();">취소</button>  
                        </div>
 				</div>
 			 </div>
 			 
           </div>
      </div>

 

 </div>
                 
     
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
	
	<script>
	function submitForm() {
	    document.getElementById("envselection").submit();
	}
	</script>
	
	
	 
     <script>
 	 function onSubmit() {
		 var IMP = window.IMP; // 생략가능
	       IMP.init('imp37495715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	       
	       IMP.request_pay({
	           pg : 'kakaopay',
	           pay_method : 'card',
	           merchant_uid : 'merchant_' + new Date().getTime(),
	           name : '라홀 정기구독',
	          /*  if( $('select[name=SUBSCRIPTIONS]').val() == '3'){
	        	   amount : ${  ((s.PR_PRICE*9)- ((s.PR_PRICE*9)*0.05)) /3  }
	           }else if( $('select[name=SUBSCRIPTIONS]').val() == '6'){
	        	   amount : ${  ((s.PR_PRICE*9)- ((s.PR_PRICE*9)*0.15)) /6  }
	           }else if( $('select[name=SUBSCRIPTIONS]').val() == '9'){
	        	   amount : ${  ((s.PR_PRICE*9)- ((s.PR_PRICE*9)*0.15)) /9  }
	           } , */ 
	           amount : '100' ,
	           buyer_email : ' ',
	           buyer_name : ' ',
	           buyer_tel : '  ',
	           buyer_addr : '',
	           buyer_postcode : '123-456',
	           //m_redirect_url : 'http://www.naver.com'
	       }, function(rsp) {
	    	   console.log(rsp);
	          if (rsp.success) { 
	                  var msg = '결제가 완료되었습니다.';
	                  msg += '\n고유ID : ' + rsp.imp_uid;
	                  msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                  msg += '\n결제 금액 : ' + rsp.paid_amount;
	                  msg += '\n카드 승인번호 : ' + rsp.apply_num;
	                  $("#terms_form").submit();
	          } else {
	               var msg = '결제에 실패하였습니다.';
	               msg += '에러내용 : ' + rsp.error_msg;
	               //실패시 이동할 페이지 
	            
	                
	           } 
	           alert(msg);
	       });		
 	}
		 
</script>        
 		
 
           
</body>
</html>