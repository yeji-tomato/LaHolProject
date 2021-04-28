<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 및 전체 결제</title>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>  
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>    
</head>
<body>
	<div class="row py-5 p-4 rounded shadow-sm" style="margin: 5%">
     <div class="col-lg-6">
       <div class="rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="background: #F3EFEB;">적용 가능한 할인쿠폰</div>
       <div class="p-4">
         <div class="input-group mb-4 border rounded-pill p-2">
           <input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0" id="applyCoupon">
           <div class="input-group-append border-0">
             <button id="button-addon3" type="button" class="btn px-4 rounded-pill" style="background: #5A452E; color: white;" onclick="winPopup();"><i class="fa fa-gift mr-2"></i>coupon</button>
           </div>
          
         </div>
          <p id="couponSequence" style="color: white"></p>
           	<input type="hidden" id="cfName"  value="${ cor.cfName }">
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
           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">상품금액 </strong><strong id="sumPrice"><c:out value="${totalPrice}"/></strong></li>
           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">배송비</strong><strong>2,500</strong></li>
           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">할인금액</strong><strong id="couponPrice">0</strong></li>
           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">결제금액</strong>
            <fmt:parseNumber var="sumPrice" type="number" value="${ total + 2500 }" />
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${ sumPrice }" var="totalPrice" />
             <h5 class="font-weight-bold" id="resultPrice"><c:out value="${totalPrice}"/></h5>
           </li>
         </ul>
         <button id="check_module" class="btn rounded-pill py-2 btn-block" style="background: #5A452E; color: white; width : 100%" type="button">결제하기</button>
       </div>
     </div>
   </div>
   
   <input type="hidden" id="id" value="${ sessionScope.loginUser.id }"/>
   <script>
		
		$("#check_module").click(function () {
			
		//var cfNameArr = new Array();
		var cfName = $("#cafeName").text(); // 물품명
		// for(int i = 0; i < )
		console.log(cfName);
		
		
		
		
		
		var cfSum = $("#sumPrice").text();	// 결제 금액
		var cafeResNo = $("#cResNo").val();
		var couponPrice = $("#couponPrice").text();
		var resultPrice = $("#resultPrice").text();
		
		var couponNo = $("#couponSequence").text();
		var id = $("id").val();
			
			
		var IMP = window.IMP; // 생략가능
		IMP.init('imp85155473');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
		pg: 'html5_inicis', // version 1.1.0부터 지원.
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: cfName + '...',
		amount: 100,
		
		//임대인의 이메일
		buyer_email: '${ sessionScope.loginUser.email }',
		//임대인의 이름
		buyer_name: '${ sessionScope.loginUser.name }',
		//임대인의 휴대전화
		buyer_tel: '${ sessionScope.loginUser.phone }',
		//임대인의주소
		buyer_addr: '${ addr[1] }' + '${ addr[2] }',
		buyer_postcode: '123-456',
		m_redirect_url: 'https://www.yourdomain.com/payments/complete'
		}, function (rsp) {
		console.log(rsp);
		if (rsp.success) {
		
		// 결제 후 ALERT창	
	
		var msg = '결제가 완료되었습니다.';
		
		Swal.fire({
			title : msg,
			icon : 'success'
		}).then(function(result){
			
			
			$.ajax({
       			url:"${ contextPath }/cart/payment",
        		type : "post",
        		data : {
        			payItem : cfName,
        			cafeRes : cafeResNo,
        			payPrice : cfSum,
        			payDC : couponPrice,
        			payTotal : resultPrice	
        		},
        		success : function(data){
        			location.href="${ contextPath }";
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
			
			$.ajax({
       			url:"${ contextPath }/cart/success",
        		type : "post",
        		data : {
        			id : id
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
		}
		alert(msg);
		});
		});
	</script>
</body>
</html>