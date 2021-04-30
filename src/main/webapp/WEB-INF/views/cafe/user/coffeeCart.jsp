<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- coffeeCart css -->
<%-- <link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/coffeeCart.css"> --%>
</head>
<body>
	<div class="coffeeBasket">
	  	<div class="rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="background: #F3EFEB; height: 7vh;">
	  	<i class="fa fa-coffee cTitle" id="cfIcon" aria-hidden="true"></i>
        &nbsp;<h5 class="cTitle">${ cafeRes.caResType }</h5>&nbsp;&nbsp;&nbsp;
        
        
        <fmt:formatDate var="date" value="${ cafeRes.caResDate }" pattern="yyyy-MM-dd"/>
        <c:set var="hereTogo" value="${ cafeRes.caResType }" />
        <c:if test="${ hereTogo eq '매장' }">
        	<strong style="color: #96877D;" class="cTitle">${ date } &nbsp; ${ cafeRes.caResHereTime } &nbsp; ${ cafeRes.caResPer }명</strong>
        </c:if>
        <c:if test="${ hereTogo eq '포장' }">
        	<strong style="color: #96877D;" class="cTitle">${ date } &nbsp; ${ cafeRes.caResGoTime } &nbsp; ${ cafeRes.caResPer }명</strong>
        </c:if> 
        
	  <a href="#" id="selectItem" style="float: right; color : black;">
        	<i class="fa fa-angle-down" aria-hidden="true"></i>
	   </a>
	</div>


<div class="container">
  <div class="shopping-cart">
  <div class="p-4">
         <div class="list-unstyled mb-4">
         	<table style="width : 100%">
         		<tbody>
         			<tr id="CoffeeCart">
         				<td class="d-flex justify-content-between py-3 border-bottom">
		                	<strong class="text-muted">메뉴를 선택해주세요!</strong>
		                </td>
         			</tr>
         			<tr id="totalPrice">
         			</tr>
         		</tbody>
         	</table>
         </div>
       </div>
       
       <div class="cartBtn">
       <a href="${ contextPath }/cafe/coffee/order?caResNo=${cafeRes.caResNo}">
        <button id="card">
            <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
        </button>
        </a>
        <button id="cartBtn" onclick="commonCart()">
            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
        </button>
    	</div>
    	
    	<input type="hidden" name="cRes" id="cRes" value="${ cafeRes.caResNo }"/>
       	<input type="hidden" name ="cartRes" id="cartRes" value="${ cafeRes.caResType }"/>
       	
       	<input type="hidden" name ="cartName" id="cartName" value="${ cafeRes.caNo }"/>
       	<input type="hidden" name ="userId" id="userId" value="${ loginUser.id }"/>
    	<!-- 장바구니 insert Ajax -->
       	<script>
       	function commonCart(){
       		var cRes = $("#cRes").val();
       		var cartName = $("#cartName").val();
       		var cartRes = $("#cartRes").val()
       		var total = $("#toPrice").text();
       		var userId = $("#userId").val();
       		var cartCount = $("#cartCount").val();
       		$.ajax({
       			url:"${ contextPath }/cart/cafe/insert",
        		type : "post",
        		data : {
        			cres : cRes,
        			cartName : cartName,
        			cartRes : cartRes,
        			total : total,
        			userId : userId,
        			cartCount : cartCount
        		},
        		success : function(data){
        			alert("장바구니에 추가되었습니다.");
        			location.href="${ contextPath }/cart/main";
        		},
        		error : function(e){
					console.log(e);
				}
        		
       		});
       	}
       	
       	</script>
       </div>
       
       
       </div>
       
	</div>
<script>
	$(function(){
	 
	  $("#selectItem").on("click", function() {
	    $(".shopping-cart").fadeToggle("fast");
	  });
	  
	})();
</script>

</body>
</html>