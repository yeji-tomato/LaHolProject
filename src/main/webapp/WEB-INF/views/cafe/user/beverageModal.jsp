<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음료 선택 모달</title>
</head>
<body>
	<!-- Modal -->
    <div class="modal fade" id="staticBackdrop${ coffee.cfNo }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <i class="fa fa-coffee" id="coffee-icon" aria-hidden="true"></i>
                <button type="button" id="close-icon" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="bev" id="bev-info">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ coffee.cfIchname }" class="card-img-top" alt="...">
                            </div>
                            <div class="col" id="text-bev">
                            <ul class="bev-ul">
                                <li><h3>${ coffee.cfName }</h3></li>
                                <li>
                                <input type="hidden" value="${ coffee.cfCount }" id="count"/>
                                    <button type="button" class="minus${ coffee.cfNo }" id="pmBtn">
                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                    </button>
                                    
                                    <input type="number" class="countBox" value="1" min="1" max="100"readonly>
                                    <button type="button" class="plus${ coffee.cfNo }"  id="pmBtn">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                    <script>
                                        $(".plus${ coffee.cfNo }").click(function(){
                                        	var count = $("#count").val();
                                            var num = $(".countBox").val();
                                            var plusNum = Number(num)+1;
    
                                            if(plusNum >= count){
                                                $(".countBox").val(num);
                                            }else{
                                                $(".countBox").val(plusNum);
                                            }
                                        });
    
                                        $(".minus${ coffee.cfNo }").click(function(){
                                            var num = $(".countBox").val();
                                            var minusNum = Number(num)-1;
    
                                            if(minusNum <= 0){
                                                $(".countBox").val(num);
                                            }else{
                                                $(".countBox").val(minusNum);
                                            }
                                        })
                                    </script>
                                </li>
                                <li>
                                    <br>
                                    <h5 style="color: #4B654A;">${ coffee.cfPrice }원</h5>
                                </li>
                            </ul>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- 카페 번호 -->
				<input type="hidden" id="coffeeNo" value="${ coffee.cfNo }"/>
				<!-- 카페 예약 번호 -->
				<input type="hidden" id="caResNo" value="${ cafeRes.caResNo }"/>
                <!-- 아이디 -->
                <input type="hidden" id="caResNo" value="${ cafeRes.userId }"/>
                <div class="bev" id="hotOrIce">
                    <hr>
                    <h4>종류</h4>
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="hi" id="hot">
                                <input type="hidden" id="hotIce" value="HOT"/>
                                	HOT
                                </div>
                            </div>
                            <div class="col">
                                <div class="hi" id="ice">
                                <input type="hidden" id="hotIce" value="HOT"/>
                                	ICE
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        $(function() {
                        $(".hi").click(function(e) {
                            e.preventDefault();
                            $(".hi").removeClass("select");
                            $(this).addClass("select");
                            
                        });
                        });
                    </script>
                </div>
                <div class="bev" id="capacity">
                    <br>
                    <h4>용량</h4>
                    <div class="row">
                        <div class="col">
                            <!-- <button class="cap" id="tall">TALL</button> -->
                            <div class="cap" id="tall">
                            <input type="hidden" id="capa" value="TALL"/>
                            TALL
                            </div>
                        </div>
                        <div class="col">
                            <div class="cap" id="grande">
                            <input type="hidden" id="capa" value="GRANDE"/>
                            GRANDE
                            </div>
                        </div>
                        <div class="col">
                            <div class="cap" id="venti">
                            <input type="hidden" id="capa" value="VENTI"/>
                            VENTI
                            </div>
                        </div>
                    </div>
                    <script>
                        $(function() {
                        $(".cap").click(function(e) {
                            e.preventDefault();
                            $(".cap").removeClass("select");
                            $(this).addClass("select");
                            
                        });
                        });
                    </script>
                </div>
                <div class="bev" id="cup">
                    <br>
                    <h4>컵</h4>
                    <div class="row">
                        <div class="col">
                            <div class="cup" id="store">
                            <input type="hidden" id="cups" value="매장컵"/>
                            	매장컵
                            </div>
                        </div>
                        <div class="col">
                            <div class="cup" id="store">
                            <input type="hidden" id="cups" value="일회용컵"/>
                            	일회용컵
                            </div>
                        </div>
                        <div class="col">
                            <div class="cup" id="store">
                            <input type="hidden" id="cups" value="개인컵"/>
                               	 개인컵<br>
                                (-300원)
                            </div>
                        </div>
                    </div>
                    <script>
                        $(function() {
                        $(".cup").click(function(e) {
                            e.preventDefault();
                            $(".cup").removeClass("select");
                            $(this).addClass("select");
                        });
                        });
                        
                        var coffeeNo = $("#coffeeNo").val();
                    </script>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" id="confirmBtn"  data-bs-dismiss="modal" onclick="cartBtn('${ coffee.cfNo }')" >담기</button>
                <button type="button" class="btn" id="cancelBtn" data-bs-dismiss="modal" aria-label="Close">취소</button>
            </div>
            <script>
            function cartBtn(cfNo){
            	
            	
/*             	var coffeeNo = $("#coffeeNo").val();
            	console.log(coffeeNo); */
            	//console.log(cfNo);
            	var caResNo = $("#caResNo").val();
            	var hotIce = $(".select > #hotIce").val();
            	var capa = $(".select > #capa").val();
            	var cups = $(".select > #cups").val();
            	var countBox = $(".countBox").val();
            	$.ajax({
            		url:"${ contextPath }/cafe/coRes/insert",
            		type : "post",
            		data : {
            			cfNo : cfNo,
            			caResNo : caResNo,
            			cfResHI : hotIce,
            			cfResCap : capa,
            			cfResCup : cups,
            			cfResAmount : countBox
            		},
            		success : function(data){
            			cosole.log(data);
            		},
            		error : function(e){
    					console.log(e);
    				}
            	});
            	
            	$.ajax({
    				url:"${ contextPath }/cafe/coRes/basket",
    				type: "get",
    				data : {
    					cfNo : cfNo,
    					caResNo : caResNo
    				},
    				dataType : "json",
    				success : function(data){
    					//console.log(data);
    					var str = '';
    					var total = '';
    					var toPrice = 0;
    					
    					CoffeeCart = $("#CoffeeCart");
    					CoffeeCart.html("");
    					totalPrice = $("#totalPrice").html("");
    					
    					for(var i in data){
    						
    						str += '<td class="d-flex justify-content-between py-3 border-bottom">';
    						str += '<li class="clearfix">';
    						str += '<img src="${ contextPath }/resources/nuploadFiles/cafeImg/' + data[i].cfIchname + '" alt="..."  style="width: 100px;"/>';
    						str += '&nbsp;<span class="item-name">'+ data[i].cfName +'</span>';
    					
    						str += '&nbsp;<span class="item-price">'+ data[i].cfPrice +'원</span>';
    						str += '&nbsp;<span class="item-name" id="countBox">수량 :'  + data[i].cfResAmount +'</span><br>';
    						str += '</li>';
    		                str += '</td>';
    		                
    		                
    		                
    		                toPrice += parseInt(data[i].cfPrice * data[i].cfResAmount);
    					}
    					
    					CoffeeCart.append(str);
    					
    					total += '<td class="d-flex justify-content-between py-3 border-bottom">';
		                total += '<strong class="text-muted">결제금액</strong>';
		                total += '<h5 class="font-weight-bold" id="toPrice">' + toPrice + '</h5>';
		                total += '<h5>원</h5>';
		                total += '</td>';
		                
		                totalPrice.html(total);
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
   
</body>
</html>