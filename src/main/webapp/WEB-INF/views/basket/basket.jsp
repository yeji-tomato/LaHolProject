<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<section id="content" class="content_css" style="height: 1700px;" >
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
                                                <div class="num" style="   width: 50px;  ">수량</div>
                                                <div class="sum">합계</div>
                                                <div class="del">배송비</div>
                                            
                                            </div>
                                            <div class="subdiv">
                            
                                                <div class="basketcmd">삭제</div>
                                            </div>
                                            <div class="split"></div>
                                        </div>
                                        
                                        <!-- 상품 -->     
                                        <div class="row data">
                                            <div class="subdiv">
                                                <div class="check">
                                                    <label class="checkbox">
                                                        <input type="checkbox" id="checkB" name="buy" value="260" checked/>
                                                        <span class="warning"></span>
                                                    </label>
                                                </div>
                                                <div class="img"><img src="https://www.twosome.co.kr:7009/Twosome_file/PRODUCT/1145_big_img" width="100"></div>
                                                <div class="pname">
                                                    <span>텀블러</span>
                                                </div>
                                            </div>
                                            <div class="subdiv">
                                                <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000">20,000원</div>
                                                <div class="num">
                                                    <div class="updown">
                                                        <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2" onkeyup="javascript:basket.changePNum(1);">
                                                        <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                                        <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                                    </div>
                                                </div>
                                                <div class="sum">40,000원</div>
                                                <div class="del">2,500</div> 
                                            </div>
                                            <div class="subdiv">
                                                <div class="basketcmd">
                                                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">
                                                    X
                                                </a>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- 상품 -->     
                                        <div class="row data">
                                            <div class="subdiv">
                                                <div class="check">
                                                    <!-- <input type="checkbox" name="buy" value="261" checked="">&nbsp; -->
                                                    <label class="checkbox">
                                                        <input type="checkbox" id="checkB" name="buy" value="260" checked/>
                                                        <span class="warning"></span>
                                                    </label>
                                                </div>
                                                <div class="img"><img src="https://img.hankyung.com/photo/202102/01.25546146.1.jpg" width="100"></div>
                                                <div class="pname">
                                                    <span>바리스타 클래스수업</span>
                                                </div>
                                            </div>
                                            <div class="subdiv">
                                                <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" value="19000">19,000원</div>
                                                <div class="num">
                                                    <div class="updown">
                                                        <input type="text" name="p_num2" id="p_num2" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(2);">
                                                        <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                                        <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                                    </div>
                                                </div>
                                                <div class="sum">19,000원</div>
                                                <div class="del"></div> 
                                            </div>
                                            <div class="subdiv">
                                                
                                                <div class="basketcmd">
                                                    <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">
                                                        X
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- 상품 -->     
                                        <div class="row data">
                                            <div class="subdiv">
                                                <div class="check">
                                                    <!-- <input type="checkbox" name="buy" value="262" checked="">&nbsp; -->
                                                    <label class="checkbox">
                                                        <input type="checkbox" id="checkB" name="buy" value="260" checked/>
                                                        <span class="warning"></span>
                                                    </label>
                                                </div>
                                                <div class="img"><img src="https://i.pinimg.com/564x/77/0d/a6/770da6b422e6457ee09897be29bb18a0.jpg" width="100"></div>
                                                <div class="pname">
                                                    <span>커피예약</span>
                                                </div>
                                            </div>
                                            <div class="subdiv">
                                                <div class="basketprice"><input type="hidden" name="p_price" id="p_price3" class="p_price" value="15200">15,200원</div>
                                                <div class="num">
                                                    <div class="updown">
                                                        <input type="text" name="p_num3" id="p_num3" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(3);">
                                                        <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                                        <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                                    </div>
                                                </div> 
                                                <div class="sum">15,200원</div>
                                                <div class="del"> </div>
                                            </div>
                                            <div class="subdiv">
                                                <div class="basketcmd">
                                                    <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">
                                                        X
                                                    </a>
                                            </div>
                                            </div>
                                        </div>
                                
                                    </div>
                            
                                    <div class="right-align basketrowcmd">
                                        <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                                        <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
                                    </div>
                            
                                  
                                    <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 4개</div>
                                  
                               
                               
                            </div>
                            </div><!-- /store1 -->
                            </div><!-- /cart -->
                        </form>

                            <!-- 배송지 입력 -->
                            <div>

                            </div>

                            
                            </div>

            
        </section>
</body>
</html>