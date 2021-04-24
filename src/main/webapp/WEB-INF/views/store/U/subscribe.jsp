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
	<link rel="stylesheet" href="${ contextPath }/resources/css/store/subscribe/subscribe.css?3sd">	
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
	 
    
	 <div id="aa" style="   height: 2000px; ">

	 <div class="banner" style="   height: 200px; ">
        <h1 style="padding-top: 18vh; color: #4B654A;"> 라홀 정기구독  <i class="fa fa-rocket" aria-hidden="true"></i></h1>
    </div>
   
    <div>
        
        <!--입력란-->
        <div id="tbColor3" style="  padding-bottom: 0px;  padding-top: 0px; "> 
        <div id="createform">
            <div class= "content-header">
                <h2 class = "intro">
                   정기 구독 상품
                </h2>
              
                </div>

                <div class="container">
                    <!--구독 상품 정보-->
                    <div class="if">
                        <div class="np"> 
                            <div id="a">이미지</div>
                            <div id="a" style="  margin-left: 30%;">제품소개</div> 
                             <div id="a" style="  margin-left: 420px; ">가격</div> 
                           
                        </div> 
                        

                        <div class="pi" > 
                            <img  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }" width="250px" height="280px "   >  
                        </div> 
                        <div class="prname" style="color:gray;">
                            <a>제품명:${s.PR_NAME }</a><br><a style="font-size:19px;">카테고리:${s.ST_CATAGORY }</a><br><a style="font-size:16px;">원산지/제조:${s.ORIGIN }</a>
                        </div> 

                        <div class="prp" style=" margin-left: 330px; ">
                            <a> <fmt:formatNumber value="${s.PR_PRICE}" pattern="#,###"/>원  </a> 
                        </div>
                     

                    </div>
                    <div id="dihr">
                    <!--구독 할인 정보 -->
                    <form   id="terms_form" action="${ contextPath }/store/subscribe"  method="post"  >    
					 <input type="hidden" name ="PR_CODE" value="${ s.PR_CODE }">
					 <input type="hidden" name ="PR_PRICE" value="${ s.PR_PRICE }">	
					 <input type="hidden" name ="PR_NAME" value="${ s.PR_NAME }">	 
					    
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
                    <h5  style="color:gray;">최대 9개월 할인했을경우!</h5>
                        <div class="hh">
                            <div> 총금액 :  ${(s.PR_PRICE*9)*1 }   원 </div>
                            <div style="margin-left: 20%;"> 할인금액:    <fmt:formatNumber value="   ${(s.PR_PRICE*9)*0.15*1 } " pattern="#,###"/>원 </div>
                            <div style="margin-left: 20%;"> 할인된금액:  <fmt:formatNumber value="  ${  (s.PR_PRICE*9)- (s.PR_PRICE*9)*0.15 }  " pattern="#,###"/>원 </div> 
                        </div>
                    
                        <div class="hh2">
                            <div style="   margin-top: 40px; float: right;  "> = 월 구독액:    <a style="color: brown;"> <fmt:formatNumber value="  ${  ((s.PR_PRICE*9)- ((s.PR_PRICE*9)*0.15)) /9  }  " pattern="#,###"/>     원</a>  </div>
                        </div>

                    </div>

                    <hr>
  
                    <!--구독 배성 정보-->
                    <div class="deinf">
                        <h4>    신규주소지<input name="chkbox" type="checkbox"  value="주문자  회원정보와 동일한 주소를 사용합니다"  checked="checked" onClick="checkDisable(this.form)"  > </h4>
                          
                        <div class="di1" name="di1" style="float: left;"> 
                            <table > 
		                      	<h6 style="width: 400px; "><a style="color: red;"> <div id='result' ></div> </a> </h6>  
                                <tr >
                                    <th style="width: 200px;" >구매자 성함</th> 
                                    <td style="text-align:left;">  ${ loginUser.name }  </td>
                                </tr>
                                
                                <tr>
                                    <th>연락처</th>
                                    <td style="text-align:left;"> ${ loginUser.phone } </td>   
                                </tr>

                                 

                                <tr>
                                    <th >배송받을 주소</th>
                                    <td style="text-align:left;width: 202px;">${ loginUser.addr } </td>
                                </tr>
                                
                                <tr>
                                    <th>주문 메시지</th>
                                    <td><textarea  name="dd" rows="5" cols="40"  style="  width: 300px;  " class="form-control"> </textarea></td>
                                </tr>
                            </table>
                        </div>
                        <!-- 새로입력하기 -->
                        
                        <div class="di1" style="float: left;"> 
                            <table >
                             
                                <tr >
                                    <th style="width: 200px;" >구매자 성함</th>
                                    <td><input name="aa" type="text" class="form-control"  id='result'  required    maxlength="8" style="
                                        width: 100px; "    >  </td>
                                </tr>
                                
                                <tr>
                                    <th>연락처</th>
                                    <td><input name="textbox"  type="text" class="form-control"
                                       required style="  width: 300px; "  name="텍스트박스" > </td>
                                </tr>

                                 
                                      
	
	                            <tr>
                                    <th >도로명주소</th>
                                    <td style="float: left;"><input type="text" class="postcodify_address"    placeholder="주소" name="address" readonly  >  <input name="detail_address" type="button"   id="postcodify_search_button"  value="검색"></td>
                                </tr>
                                <tr>
                                    <th>상세주소</th>
                                    <td><input class="form-control" type="text" style="  width: 300px;  "
                                          required name="detailaddr" ></td>
                                </tr>
                                
                                <tr>
                                    <th>주문 메시지</th>
                                    <td><textarea name="텍스트박스"   rows="5" cols="40"  style="  width: 300px; "  class="form-control"  > </textarea></td>
                                </tr>
                            </table>
                        </div>
	  					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<!-- 검색 버튼 클릭 시 팝업 레이어 열리도록 -->
						<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

    		
 

 
 
 					</div>
 	 
 					
 					  </form>
 					  <div style="margin-top: 100px;">
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
					function getCheckboxValue(event)  {
						  let result = '';  
						  if(event.target.checked)  {
						    result = event.target.value;      
						  }else {
						    result = ''; 
						  }
						  
						  document.getElementById('result').innerText
						    = result; 
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
				           buyer_name : '${ loginUser.name } ',
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
				               $("#terms_form").submit();
				                
				           } 
				           alert(msg);
				       });		
			 	}
					 
			</script>    



				<script>
					function getCheckboxValue(event)  {
						  let result = '';  
						  if(event.target.checked)  {
						    result = event.target.value;    
						    result2 = ${ loginUser.phone };    
						  }else {
						    result = ''; 
						    result2 = ''; 
						  }
						  
						  document.getElementById('result').innerText
						    = result; 
						  document.getElementById('result2').innerText
						    = result2;  
						}
					
				</script>
			    
				 		
				 <script >
				
				 function checkDisable(frm)
				 {
				     if( frm.chkbox.checked == true ){
				 	   frm.textbox.disabled = false;
				 	   frm.aa.disabled = false;
				 	  frm.detail_address.disabled = false;
				 	 frm.텍스트박스.disabled = false;
				 	 frm.address.disabled = false;
				 	frm.detailaddr .disabled = false;
				 	 frm.dd.disabled = true;
				 	} else 
				 	{
				 	   frm.textbox.disabled =  true;
				 	  frm.aa.disabled =  true;
				 	 frm.detail_address.disabled =  true;
				 	 frm.텍스트박스.disabled =  true;
				 	 frm.dd.disabled = false;
				 	 frm.address.disabled =true;
				 	frm.detailaddr .disabled =true;
				 	}
				     
				     let result = '';  
					  if(event.target.checked)  {
						  result = ''; 
					  }else { 
					    result = event.target.value;     
					  }
					  
					  document.getElementById('result').innerText
					    = result; 
					 
				 }
				
				</script>

	
           
</body>
</html>