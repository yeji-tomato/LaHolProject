<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 및 전체 결제</title>
</head>
<body>
	<div class="row py-5 p-4 rounded shadow-sm">
     <div class="col-lg-6">
       <div class="rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="background: #F3EFEB;">적용 가능한 할인쿠폰</div>
       <div class="p-4">
         <div class="input-group mb-4 border rounded-pill p-2">
           <input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0" id="applyCoupon">
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
           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">상품금액 </strong><strong id="totalPrice"><c:out value="${total}"/></strong></li>
           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">배송비</strong><strong>2,500</strong></li>
           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">할인금액</strong><strong id="couponPrice">0</strong></li>
           <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">결제금액</strong>
            
             <h5 class="font-weight-bold" id="resultPrice"><c:out value="${total}"/></h5>
           </li>
         </ul><a href="#" class="btn rounded-pill py-2 btn-block" style="background: #5A452E; color: white;">결제하기</a>
       </div>
     </div>
     <!-- 쿠폰 적용 후 화면에 출력 -->
     <script>
     	
		
		
     </script>
   </div>
</body>
</html>