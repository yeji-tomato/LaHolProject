<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="${ contextPath }/resources/css/basket/basket.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>  
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>  
<link rel="stylesheet" href="${ contextPath }/resources/css/basket/storeAddress.css" type="text/css">
 <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
</head>


</head>
  <style>
 
  #first:checked + div button{

 display:none;

}
  #first:checked + div input{

 display:none;

}
 </style>
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
                                                <div class="check"> </div>
                                                <div class="img">이미지</div>
                                                <div class="pname">상품명</div>
                                            </div>
                                            <div class="subdiv">
                                                <div class="basketprice">가격</div> 
                                                <div class="num">수량</div>
                                                <div class="sum">합계</div>
                                                <div class="del">수량변경 </div> 
                                            </div>
                                            <div class="subdiv">
                            
                                                <div class="basketcmd" style=" width: 60px;">배송비 </div>
                                            </div>
                                            <div class="split"></div>
                                        </div>
                                        
                                    
                                        <div class="row data">
                                            <div class="subdiv">
                                                <div class="check">
                                                    
                                                         
                                                        <span class="warning"></span>
                                                    
                                                </div>
                                                <div class="img"><img src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }" width="100"></div>
                                                <div class="pname">
                                                	 
                                                    <span> ${s.PR_NAME }</span>
                                                </div>
                                            </div>
                                            <div class="subdiv"> 
                                                <div class="basketprice"> <fmt:formatNumber value="${ s.PR_PRICE }" pattern="#,###"/></div> 
                                                 <div class="basketprice" style=" width: 0px;"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="${s.PR_PRICE }"> </div>
                                                <div class="num">
                                                    <div class="updown" style="float: left;margin-left: 30px;" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp수량
                                                        <input   readonly name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="${ su }" style="height: 26px; height: 26px;border-top-width: 0px;border-bottom-width: 0px;border-right-width: 0px;border-left-width: 0px;"onkeyup="javascript:basket.changePNum(1);">
                                                 <c:set var="cfSum" value="${ su*pr }"/>
                                                    </div>  
                                                </div> 
                                                <div class="sum" style=" width: 80px;"> <input type="hidden" name="sum" size="11" readonly  value=""  > ${ su*pr }   </div>
                                       
                                               <div class="del">
                                               	<button style="border: 0; background: white;" onclick="javascript:history.back();" ><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                                               </div>
                                            </div>
                                            <div class="subdiv">
                                             
			                                                   
			                             <div class="subdiv" style=" padding-left: 0px;width: 62px;">
			                                   <div class="basketcmd" >
			                                     <div>
			                                     2,500
			                                   </div>
			                                   </div>
			                               </div>
                                            </div>
                                        </div>
                                        <c:set var= "totalCount" value=""/> 
                                    
                                 
                                
                                    </div>
                  
                            
                                  
                                   
                                  
                               
                               
                            </div>
                            </div><!-- /store1 -->
                            </div><!-- /cart -->
                        
                        
                            <!-- 배송지 입력 -->
						 
							<div class="contact-form" style="height: 475px;">
			             
			            <form method="post">
			       
			                
			               <input type="checkbox" onClick="checkDisable(this.form)"  id="first">
			                	주문자 회원정보와 동일한 주소로 주문합니다.
			               <div class="row" id="radioDiv" >
			                    <div class="col-md-6">
			                        <div class="form-group">
			                            <input type="text" name="txtName" class="form-control" placeholder="* 이름" value="" />
			                        </div>
			                        <div class="form-group">
			                            <input type="text" name="txtEmail" class="form-control" placeholder="* 연락처" value="" />
			                        </div>
			                        
			        				<div class="form-group address" id="addText">
			        					<input type="text" name="txtPhone" class="form-control" placeholder="* 도로명주소" value="" />
			        				</div>
									<div class="form-group address" id="searchBtn">
										<button>
			                    			<i class="fa fa-search" aria-hidden="true"></i>
			                    		</button>
									</div>
			                        
			               			<div class="form-group">
			                            <input type="text" name="txtPhone" class="form-control" placeholder="* 상세주소" value="" />
			                        </div>
			                    </div>
			                    <div class="col-md-6">
			                        <div class="form-group">
			                            <textarea name="txtMsg" class="form-control" placeholder="* 주문 메시지 " style="width: 100%; height: 20vh;"></textarea>
			                        </div>
			                    </div>
			                    
			                </div>
			                
			        
			            </form>
					</div>
					
					 	 
						<c:set var= "total" value="${ (su*pr)+2500 }"/>
                      
                        
                      
                         <input type="hidden" id="cfName"  value="${s.PR_NAME}">
                         <input type="text" id="pr_code"  value="${s.PR_CODE}">
                         <input type="text" id="su"  value="${su}"> 
                        
                       <div>
                           <!-- 쿠폰 및 전체 금액 -->
                          <div class="row py-5 p-4 rounded shadow-sm">
						     <div class="col-lg-6">
						       <div class="rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="background: #F3EFEB;">적용 가능한 할인쿠폰</div>
						       <div class="p-4">
						         <div class="input-group mb-4 border rounded-pill p-2">
						           <input type="text" placeholder="Apply coupon" name="Coupons" value="" aria-describedby="button-addon3" class="form-control border-0" id="applyCoupon">
						           <div class="input-group-append border-0">
						             <button id="button-addon3" type="button" class="btn px-4 rounded-pill" style="background: #5A452E; color: white;" onclick="winPopup();"><i class="fa fa-gift mr-2"></i>coupon</button>
						           </div>
						         </div>
						         <p id="couponSequence" style="color: white"></p>
						       </div>
						       <script type="text/javascript">
								    function winPopup() {
								        var popUrl = "${contextPath}/cart/coupon?total=${su*pr}";
								        var popOption = "width=10vw,height=10vh";
								        window.open(popUrl, popOption, "_blank"); 
								    }
								</script>
						     </div>
						     <div class="col-lg-6">
						       <div class="rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="background: #F3EFEB;">결제 정보</div>
						       <div class="p-4">
						         <ul class="list-unstyled mb-4">      <div  type="hidden" class="bigtext right-align sumcount" id="sum_p_num"> </div>

						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">상품금액 </strong><strong id="sumPrice">            <fmt:formatNumber value="${ total }" pattern="#,###"/></strong></li>
						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">배송비</strong><strong>2,500</strong></li>
						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">할인금액</strong><strong id="couponPrice"><input type="hidden" name="payDC"></strong></li>
						           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">결제금액</strong>
						             <h5 class="font-weight-bold" id="resultPrice" name="total" > <fmt:formatNumber value="${ total }" pattern="#,###"/></h5> 
						           </li>  
						         </ul>
						         <button id="check_module" class="btn rounded-pill py-2 btn-block" style="background: #5A452E; color: white; width : 100%" type="button"  >결제하기</button>
						        
						       </div>
						     </div>
						   </div>
          </div>
          	 
             
          </div>
			
			<script>
				$("#check_module").click(function () {
					
				var cfName = $("#cfName").val(); // 물품명
				var cfSum = $("#sumPrice").text();	// 결제 금액
				 
				var couponPrice = $("#couponPrice").text();
				var resultPrice = $("#resultPrice").text(); 
				var couponNo = $("#couponSequence").text();
				var su = $("#su").text();
				var pr_code = $("#pr_code").text();
				
				var IMP = window.IMP; // 생략가능
				IMP.init('imp85155473');
				// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				IMP.request_pay({
				pg: 'html5_inicis', // version 1.1.0부터 지원.
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: cfName,
				amount: 100,
				
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
					
					
					$.ajax({
		       			url:"${ contextPath }/store/storecart2",
		        		type : "post",
		        		data : {
		        			payItem : cfName,
		        			cafeRes : cafeResNo,
		        			payPrice : cfSum,
		        			pay_dc : couponPrice,
		        			pay_total : resultPrice,	
		        			su : ${su},
		        			pr_code : pr_code
		        		},
		        		success : function(data){
		        			location.href="${ contextPath }/store/list";
		        		},
		        		error : function(e){
							console.log(e);
						}
		        		
		       		});
					
					
					$.ajax({
		       			url:"${ contextPath }/cart/coupon/use",
		        		type : "post",
		        		data : {
		        			couponCode : couponNo
		        		},
		        		success : function(data){
		        			location.href="${ contextPath }";
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
				}).then(function(result){
					
					
			/* 		$.ajax({
		       			url:"${ contextPath }/store/storecart2",
		        		type : "post",
		        		data : {
		        			payItem : cfName, 
		        			payPrice : cfSum,
		        			pay_dc : couponPrice,
		        			pay_total : resultPrice,	
		        			su : ${su},
		        			pr_code : ${s.PR_CODE}
		        		},
		        		success : function(data){
		        			location.href="${ contextPath }/store/list";
		        		},
		        		error : function(e){
							console.log(e);
						}
		        		
		       		});
					
					
					$.ajax({
		       			url:"${ contextPath }/cart/coupon/use",
		        		type : "post",
		        		data : {
		        			couponCode : couponNo
		        		},
		        		success : function(data){
		        			location.href="${ contextPath }";
		        		},
		        		error : function(e){
							console.log(e);
						}
		        		
		       		}); */
					
				});
				
				};
				
				});
				});
			</script>


        <script>
	 
        let basket = {
        	    totalCount: 0, 
        	    totalPrice: 0,
        	    //체크한 장바구니 상품 비우기
        	    delCheckedItem: function(){
        	        document.querySelectorAll("input[name=buy]:checked").forEach(function (item) {
        	            item.parentElement.parentElement.parentElement.remove();
        	        });
        	        //AJAX 서버 업데이트 전송
        	    
        	        //전송 처리 결과가 성공이면
        	        this.reCalc();
        	        this.updateUI();
        	    },
        	    //장바구니 전체 비우기
        	    delAllItem: function(){
        	        document.querySelectorAll('.row.data').forEach(function (item) {
        	            item.remove();
        	          });
        	          //AJAX 서버 업데이트 전송
        	        
        	          //전송 처리 결과가 성공이면
        	          this.totalCount = 0;
        	          this.totalPrice = 0;
        	          this.reCalc();
        	          this.updateUI();
        	    },
        	    //재계산
        	    reCalc: function(){
        	        this.totalCount = 0;
        	        this.totalPrice = 0;
        	        document.querySelectorAll(".p_num").forEach(function (item) {
        	            var count = parseInt(item.getAttribute('value'));
        	            this.totalCount += count;
        	            var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
        	            this.totalPrice += count * price;
        	        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
        	    },
        	    //화면 업데이트
        	    updateUI: function () {
        	        document.querySelector('#sum_p_num').input =  '주문' + this.totalCount.formatNumber() ; 
        	        document.querySelector('#sum_p_price2').textContent = '2: ' + this.totalPrice.formatNumber() + '원';
        	        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
        	    },
        	    //개별 수량 변경
        	    changePNum: function (pos) {
        	        var item = document.querySelector('input[name=p_num'+pos+']');
        	        var item2 = document.querySelector('input[name=p_num'+2+']');
        	        var p_num = parseInt(item.getAttribute('value'));
        	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
        	        
        	        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

        	        item.setAttribute('value', newval);
        	         
        	        item.value = newval;

        	        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
        	        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
        	        item2.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
        	        //AJAX 업데이트 전송

        	        //전송 처리 결과가 성공이면    
        	        this.reCalc();
        	        this.updateUI();
        	    },
        	    delItem: function () {
        	        event.target.parentElement.parentElement.parentElement.remove();
        	    }
        	}

        	// 숫자 3자리 콤마찍기
        	Number.prototype.formatNumber = function(){
        	    if(this==0) return 0;
        	    let regex = /(^[+-]?\d+)(\d{3})/;
        	    let nstr = (this + '');
        	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
        	    return nstr;
        	};
	                    //-->
	                    </script> 
	                    
	                    
	                    
	                    
	                    
	                    
	                     <script >
				
				 function checkDisable(frm)  {
				     if( frm.chkbox.checked == true ){
				    	 if( document.all["radioDiv"].style.display == "" ){
				         }else{
				                document.all["radioDiv"].style.display = ""; 
				                document.all["radioDiv2"].style.display = "none";  
				                
				         }
				      	  }else if ( frm.chkbox.checked == false){
				      		   if( document.all["radioDiv2"].style.display == "" ){ 
				             
				      	     }else{
				      	       document.all["radioDiv"].style.display = "none"; 
				               document.all["radioDiv2"].style.display = "";  
				      	     }
				      	  }
				 }
				</script>
				
				<script>
				$.ajax({
	       			url:"${ contextPath }/cart/coupon/use",
	        		type : "post",
	        		data : {
	        			couponCode : couponNo
	        		},
	        		success : function(data){
	        			location.href="${ contextPath }";
	        		},
	        		error : function(e){
						console.log(e);
					}
	        		
	       		});
				
				</script>

            
        </section>
        <jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>