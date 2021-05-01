<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="${ contextPath }/resources/css/basket/basket.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<style>


 #cke{
    border-left-width: 0px;
    border-top-width: 0px;
    border-bottom-width: 0px;
  
    padding-top: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
    border-right-width: 0px;
    padding-right: 0px;
    margin-top: 0px;
    margin-left: 0px;
    margin-bottom: 0px;
    margin-right: 0px; 
    height: 0px;
    margin-top: 0px;
 
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	<%@include file="./cartJS.jsp" %>
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
               <div class="del">배송비/예약</div>
           	
           </div>
           <div class="subdiv">

               <div class="basketcmd">삭제</div>
           </div>
           <div class="split"></div>
       </div>
       
       <!-- 상품 갯수 -->
       <input type="hidden" value="${ cartNum }">
       
       <c:choose>
       	<c:when test="${!empty cartlist }">
       <!-- 카페 상품 -->
       <c:forEach var="crt" items="${ cartlist }">
       	<c:if test="${ crt.cres != null }">

       		<div class="row data">
            <div class="subdiv">
                <div class="check">
                    <label class="checkbox">
                        <input type="checkbox" id="checkB" name="buy" value="260" checked/>
                        <span class="warning"></span>
                    </label>
                </div>
          <div class="img"><img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ crt.photoName }" width="100"></div>
          <c:set var= "name" value="${ crt.cartName }"/>
          <div class="pname">
              <span id="cafeName">${ crt.cartName }</span>
          </div>
      </div>
      <div class="subdiv">
      <fmt:parseNumber var="cartSum" type="number" value="${ crt.cartPrice }" />
      <fmt:formatNumber type="number" maxFractionDigits="3" value="${ cartSum }" var="cafeSum" />
          <div class="basketprice">
          	${ cafeSum }원
          </div>
          <div class="num">
              <div class="updown">
                 <%-- <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="${ crt.cartCount }" onkeyup="javascript:basket.changePNum(3);"> --%>
                 <!-- <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                 <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span> -->
             	<button style="border: 0; background: white;"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
             </div>
          </div>
          
          <div class="sum">${ cafeSum }원</div>
          <div class="del">${ crt.cartRes }</div> 
      </div>
    <div class="subdiv">
          <div class="basketcmd">
            <button  class="abutton" id="cke" onclick="location.href='${ contextPath }/cart/cart/delete?sT=${ crt.cartNo }'">
            x 
          </button>
          </div>
    </div>
    	 <c:set var="cartTotal" value="${ cartTotal + cartSum}"/>
     </div>
    
    </c:if>
    
    <input type="hidden" name="payItem" value="${ crt.cartName }">
    <input type="hidden" name="payPrice" value="${ crt.cartPrice }">
    <input type="hidden" name="buyId" value="${ sessionScope.loginUser.id }">
    <input type="hidden" name="cafeRes" value="${ crt.cres }">
    <%-- <input type="hidden" name="payDC" value="${ sessionScope.loginUser.id }">
    <input type="hidden" name="payTotal" value="${ crt.cres }"> --%>
    
    </c:forEach> 
                          	
                          	
   	<!-- 스토어 -->
   	<c:forEach var="crt" items="${ cartlist }">
   	<c:if test="${ crt.purchaseNo != null }">
   	<div class="row data">
        <div class="subdiv">
            <div class="check">
                <label class="checkbox">
                    <input type="checkbox" id="checkB" name="buy" value="260" checked/>
                    <span class="warning"></span>
                </label>
            </div>
            <div class="img"><img src="${ contextPath }/resources/img/store/${ crt.photoName }" width="100" height="100"></div>
            <div class="pname">
                <span>${ crt.cartName }</span>
            </div>
        </div>
        <div class="subdiv">
        <fmt:parseNumber var="cartSum" type="number" value="${ crt.cartPrice }" />
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${ cartSum }" var="storeSum" />
            <div class="basketprice">
            	${ storeSum }원
            </div>
            <div class="num">${ crt.cartCount }</div>
            <c:set var="ProSum" value="${ crt.cartPrice *crt.cartCount }"/>
            <fmt:parseNumber var="pro" type="number" value="${ ProSum }" />
            <fmt:formatNumber type="number" maxFractionDigits="3" value="${ pro }" var="storedelSum" />
               <div class="sum">${ storedelSum }원</div>
               <fmt:parseNumber var="del" type="number" value="${ crt.shipFee }" />
            <fmt:formatNumber type="number" maxFractionDigits="3" value="${ del }" var="delPrice" />
            <div class="del">${ delPrice }원</div> 
            
        </div>
        
            <%-- <div class="sum">${ crt.cartPrice *crt.cartCount }원</div> --%>
            
        <div class="subdiv">
            <div class="basketcmd">
            <button  class="abutton"  id="cke" onclick="location.href='${ contextPath }/cart/cart/delete?sT=${ crt.cartNo }'">
              x
            </button>
            </div>
        </div> 





        <input type="hidden" id="cResNo"  value="${ crt.cres }">
    </div>

      <c:set var= "storeTotal" value="${ storeTotal + ProSum}"/>
      </c:if>
      </c:forEach>
      
      <!-- 클래스 상품 -->
      <c:forEach var="crt" items="${ cartlist }">
   	<c:if test="${ crt.classNo != null }">
   	<div class="row data">
        <div class="subdiv">
            <div class="check">
                <label class="checkbox">
                    <input type="checkbox" id="checkB" name="buy" value="260" checked/>
                    <span class="warning"></span>
                </label>
            </div>
            <div class="img"><img src="${ contextPath }/resources/nuploadFiles/classImg/${ crt.photoName }" width="100" height="100"></div>
            <div class="pname">
                <span>${ crt.cartName }</span>
            </div>
        </div>
        <div class="subdiv">
        <fmt:parseNumber var="classCartSum" type="number" value="${ crt.cartPrice }" />
        <fmt:formatNumber type="number" maxFractionDigits="3" value="${ classCartSum }" var="classSum" />
            <div class="basketprice">
            	${ classSum }원
            </div>
            <div class="num">1</div>                        
            <div class="sum">${ classSum }원</div>
            <div class="del">${ classSum }원</div> 
        </div>
       
        <div class="subdiv">
            <div class="basketcmd">
              <button  class="abutton" id="cke" onclick="location.href='${ contextPath }/cart/cart/delete?sT=${ crt.cartNo }'">
                X
            </button>
            </div>
        </div>
    </div>
      <c:set var= "classTotal" value="${ classTotal + classCartSum }"/>
      </c:if>
      </c:forEach>
      
  <c:set var= "total" value="${ total + cartTotal + storeTotal + classTotal }"/>
<fmt:parseNumber var="t" type="number" value="${ total }" />
<fmt:formatNumber type="number" maxFractionDigits="3" value="${ t }" var="totalPrice" />
<div class="bigtext right-align sumcount" id="sum_p_num">합계: <c:out value="${totalPrice}"/></div>
</c:when>
<c:otherwise>
	<div style="width: 100%; text-align: center;">
		담겨진 상품이 없습니다.	
	</div>
</c:otherwise>     
</c:choose>      
 </div>
</div>
 </div>
 <!-- 배송지 입력 -->
<%@include file="./storeAddress.jsp" %>

<!-- 쿠폰 및 전체 금액 -->
<%@include file="./couponTotal.jsp" %> 
   
   

</div><!-- /store1 -->
</div><!-- /cart -->
     
     <script>
	       $(document).on('click', '#check', function(){
      					
          				var cfName = $("#check").val(); // 제품정보
          				// var cfSum = $("#st").text();    
          				$.ajax({
   			url:"${ contextPath }/cart/cart/delete",
    		type : "get",
    		data : {
    			sT : cfName 
    			 
    		},
    		success : function(data){
    			alert("상품이 삭제되었습니다.");
    			location.href="${ contextPath }/cart/main";
    		},
    		error : function(e){
	console.log(e);
}
    		
   		});
   
	     	});
	       
	     $(document).on('click', '#checkc', function(){
      					
          				var cfName = $("#checkc").val(); // 제품정보
          				// var cfSum = $("#st").text();    
          				$.ajax({
   			url:"${ contextPath }/cart/cart/delete",
    		type : "get",
    		data : {
    			sT : cfName 
    			 
    		},
    		success : function(data){
    			alert("상품이 삭제되었습니다.");
    			location.href="${ contextPath }/cart/main";
    		},
    		error : function(e){
	console.log(e);
}
    		
   		});
   
	     	});
	       
	       
	       
</script>
						 

             
         <div>
             
         </div>
             

            
        </section>
        <jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>