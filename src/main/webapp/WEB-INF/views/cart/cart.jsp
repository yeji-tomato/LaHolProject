<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="${ contextPath }/resources/css/basket/basket.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	<%@include file="./cartJS.jsp" %>
	<section id="content" class="content_css" >
            <div class="outer1">
                <form name="orderform" id="orderform" method="post" class="orderform" action="/Page">      
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
                                        
                                        <!-- 상품 --> 
                                        <c:forEach var="crt" items="${ cartlist }"> 
                                        <!-- 카페 상품 -->
                                        <c:choose>
                                        	<c:when test="${ crt.cres != null }">
                                        		<div class="row data">
	                                            <div class="subdiv">
	                                                <div class="check">
	                                                    <label class="checkbox">
	                                                        <input type="checkbox" id="checkB" name="buy" value="260" checked/>
	                                                        <span class="warning"></span>
	                                                    </label>
	                                                </div>
	                                                <div class="img"><img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ crt.photoName }" width="100"></div>
	                                                <div class="pname">
	                                                    <span>${ crt.cartName }</span>
	                                                </div>
	                                            </div>
	                                            <div class="subdiv">
	                                                <div class="basketprice">
	                                                	<input type="button" value="주문내역" style="border: 0;"/>
	                                                </div>
	                                                <div class="num">
	                                                    <div class="updown">
                                                        <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(3);">
                                                        <!-- <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                                        <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span> -->
                                                    </div>
	                                                </div>
	                                                <div class="sum">${ crt.cartPrice }원</div>
	                                                <div class="del">${ crt.cartRes }</div> 
	                                            </div>
	                                            <div class="subdiv">
	                                                <div class="basketcmd">
	                                                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">
	                                                    X
	                                                </a>
	                                                </div>
	                                            </div>
	                                        </div>
                                        	</c:when>
                                        	
                                        	<c:when test="${ crt.purchaseNo != null }">
                                        	<!-- 스토어 -->
                                        	<div class="row data">
	                                            <div class="subdiv">
	                                                <div class="check">
	                                                    <label class="checkbox">
	                                                        <input type="checkbox" id="checkB" name="buy" value="260" checked/>
	                                                        <span class="warning"></span>
	                                                    </label>
	                                                </div>
	                                                <div class="img"><img src="${ contextPath }/resources/img/store/${ crt.photoName }" width="100"></div>
	                                                <div class="pname">
	                                                    <span>${ crt.cartName }</span>
	                                                </div>
	                                            </div>
	                                            <div class="subdiv">
	                                                <div class="basketprice">
	                                                	${ crt.cartPrice }원
	                                                </div>
	                                                <div class="num">
	                                                    <div class="updown">
                                                        <input type="text" name="p_num2" id="p_num2" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(3);">
                                                        <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                                        <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                                    </div>
	                                                </div>
	                                                <div class="sum">${ crt.cartPrice }원</div>
	                                                <div class="del">${ crt.cartRes }</div> 
	                                            </div>
	                                            <div class="subdiv">
	                                                <div class="basketcmd">
	                                                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">
	                                                    X
	                                                </a>
	                                                </div>
	                                            </div>
	                                        </div>
                                        	</c:when>
                                        	
                                        	<c:when test="${ crt.classNo != null }">
                                        	<!-- 클래스 -->
                                        	<div class="row data">
	                                            <div class="subdiv">
	                                                <div class="check">
	                                                    <label class="checkbox">
	                                                        <input type="checkbox" id="checkB" name="buy" value="260" checked/>
	                                                        <span class="warning"></span>
	                                                    </label>
	                                                </div>
	                                                <div class="img"><img src="${ contextPath }/resources/img/store/${ crt.photoName }" width="100"></div>
	                                                <div class="pname">
	                                                    <span>${ crt.cartName }</span>
	                                                </div>
	                                            </div>
	                                            <div class="subdiv">
	                                                <div class="basketprice">
	                                                	${ crt.cartPrice }원
	                                                </div>
	                                                <div class="num">
	                                                    <div class="updown">
                                                        <input type="text" name="p_num3" id="p_num3" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(3);">
                                                        <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                                        <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                                    </div>
	                                                </div>
	                                                <div class="sum">${ crt.cartPrice }원</div>
	                                                <div class="del">${ crt.cartRes }</div> 
	                                            </div>
	                                            <div class="subdiv">
	                                                <div class="basketcmd">
	                                                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">
	                                                    X
	                                                </a>
	                                                </div>
	                                            </div>
	                                        </div>
                                        	
                                        	</c:when>
                                        </c:choose>
                                        
                                        </c:forEach> 
                                        
                                        

                                        
                                
                                    </div>
                            
                                    <div class="right-align basketrowcmd">
                                        <a href="javascript:void(0)" class="abutton" id="trashBtn" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                                        <a href="javascript:void(0)" class="abutton" id="trashBtn" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
                                    </div>
                            
                                  
                                    <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 2개</div>
                                  
                               
                               
                            </div>
                            </div><!-- /store1 -->
                            </div><!-- /cart -->
                        </form>
                        
                        

                        <!-- 배송지 입력 -->
						<%@include file="./storeAddress.jsp" %>
						
						<!-- 카페 주소 -->
						<%-- <%@include file="./cafeAddress.jsp" %> --%>
                           
                       <div>
                           <!-- 쿠폰 및 전체 금액 -->
                          <%@include file="./couponTotal.jsp" %> 
                       </div>
                           
                           
                       </div>

            
        </section>
        <jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>