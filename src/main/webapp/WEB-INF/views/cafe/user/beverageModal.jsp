<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                <input type="number" value="${ coffee.cfCount }" id="count"/>
                                    <button type="button" class="minus${ coffee.cfNo }" id="pmBtn">
                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                    </button>
                                    
                                    <input type="number" class="countBox" value="1" min="1" max="100" readonly>
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
				<input type="text" id="cfNo" value="${ coffee.cfNo }"/>
				<!-- 카페 예약 번호 -->
				<input type="text" id="caResNo" value="${ cafeRes.caResNo }"/>
                <!-- 아이디 -->
                <input type="text" id="caResNo" value="${ cafeRes.userId }"/>
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
                    </script>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" id="confirmBtn"  data-bs-dismiss="modal" onclick="cartBtn('${ coffee.cfNo }')" >담기</button>
                <button type="button" class="btn" id="cancelBtn" data-bs-dismiss="modal" aria-label="Close">취소</button>
            </div>
            <script>
            function cartBtn(cfNo){
            	$(".cart").addClass("cartAdd");
            	
            	var cfNo = $("#cfNo").val();
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
            		}
            	});
            }
            </script>
        </div>
        </div>
    </div>
   
</body>
</html>