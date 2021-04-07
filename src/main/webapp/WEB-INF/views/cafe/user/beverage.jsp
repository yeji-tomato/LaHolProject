<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음료 선택 페이지</title>
<!-- beverage css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/beverage.css">
</head>
<body style="background: #f0ebe5;">
	
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	<!-- 음료  -->
    <div class="beverage-content">
    <div class="beverage-TB">
    <table class="bTable">
        <thead>
            <tr>
                <td class="berCate" colspan="5"><h1>COFFEE</h1></td>
            </tr>
        </thead>
        <tbody class="bTbody">
            <tr>
                <td data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/03/[9200000003427]_20210324165929651.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">제주 별다방 땅콩 라떼</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/03/[9200000003427]_20210324165929651.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">제주 별다방 땅콩 라떼</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <i class="fa fa-coffee" id="coffee-icon" aria-hidden="true"></i>
                <button type="button" id="close-icon" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </button>
            </div>
            <div class="modal-body">
                <form>
                <div class="bev" id="bev-info">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/03/[9200000003427]_20210324165929651.jpg" class="card-img-top" alt="...">
                            </div>
                            <div class="col" id="text-bev">
                            <ul class="bev-ul">
                                <li><h3>제주 별다방 땅콩 라떼</h3></li>
                                <li>
                                    <button type="button" class="minus" id="pmBtn">
                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                    </button>
                                    <input type="number" class="countBox" value="1" min="1" max="100" readonly>
                                    <button type="button" class="plus"  id="pmBtn">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                    <script>
                                        $(".plus").click(function(){
                                            var num = $(".countBox").val();
                                            var plusNum = Number(num)+1;
    
                                            if(plusNum >= 100){
                                                $(".countBox").val(num);
                                            }else{
                                                $(".countBox").val(plusNum);
                                            }
                                        });
    
                                        $(".minus").click(function(){
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
                                    <h5 style="color: #4B654A;">4500원</h5>
                                </li>
                            </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="bev" id="hotOrIce">
                    <hr>
                    <h4>종류</h4>
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="hi" id="hot">HOT</div>
                            </div>
                            <div class="col">
                                <div class="hi" id="ice">ICE</div>
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
                            <div class="cap" id="tall">TALL</div>
                        </div>
                        <div class="col">
                            <div class="cap" id="grande">GRANDE</div>
                        </div>
                        <div class="col">
                            <div class="cap" id="venti">VENTI</div>
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
                            <div class="cup" id="store">매장컵</div>
                        </div>
                        <div class="col">
                            <div class="cup" id="store">일회용컵</div>
                        </div>
                        <div class="col">
                            <div class="cup" id="store">
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
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" id="confirmBtn" data-bs-dismiss="modal">담기</button>
                <button type="button" class="btn" id="cancelBtn" data-bs-dismiss="modal">취소</button>
            </div>
            <script>
                $(function() {
                $("#confirmBtn").click(function(e) {
                    e.preventDefault();
                    $(".cart").addClass("cartAdd");
                });
                });
            </script>
        </div>
        </div>
    </div>

    


    <table class="bTable">
        <thead>
            <tr>
                <td class="berCate" colspan="5"><h1>BEVERAGE</h1></td>
            </tr>
        </thead>
        <tbody class="bTbody">
            <tr>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/03/[9200000003427]_20210324165929651.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">제주 별다방 땅콩 라떼</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/03/[9200000003427]_20210324165929651.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">제주 별다방 땅콩 라떼</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="card" id="cardShape">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h4 class="card-text">카페 아메리카노</h4>
                            <p style="color: #96877D">4500원</p>
                        </div>
                    </div>
                </td>

            </tr>
        </tbody>
    </table>
    </div>
    </div>

    <!-- 장바구니 -->
    <div class="cart">
        <div class="cartTable">
        <button style="float:right;" class="cartCloseBtn">
			<i class="fa fa-times" aria-hidden="true"></i>
		</button>
		<script>
		$(function() {
            $(".cartCloseBtn").click(function(e) {
                e.preventDefault();
                $(".cart").removeClass("cartAdd");
            });
            });
		</script>
    <table>
        <thead>
            <tr style="width: 100%;">
                <td colspan="5">
                    <i class="fa fa-coffee cTitle" id="cfIcon" aria-hidden="true"></i>
                    <h2 class="cTitle">매장</h2>
                    <h4 style="color: #96877D;" class="cTitle">2021년 03월 08일 월요일 PM. 08:00 4명</h4>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <div class="card" id="cardCart">
                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[94]_20150813222021797.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h5 class="card-text">카페 아메리카노</h5>
                            <button type="button" class="minus" id="pmBtn">
                                <i class="fa fa-minus" aria-hidden="true"></i>
                            </button>
                            <input type="number" class="cartNumBox" value="1" min="1" max="100" readonly>
                            <button type="button" class="plus"  id="pmBtn">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                </td>
            </tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tbody>
    </table>
    <script>
        $(".plus").click(function(){
            var num = $(".cartNumBox").val();
            var plusNum = Number(num)+1;

            if(plusNum >= 100){
                $(".cartNumBox").val(num);
            }else{
                $(".cartNumBox").val(plusNum);
            }
        });

        $(".minus").click(function(){
            var num = $(".cartNumBox").val();
            var minusNum = Number(num)-1;

            if(minusNum <= 0){
                $(".cartNumBox").val(num);
            }else{
                $(".cartNumBox").val(minusNum);
            }
        })
    </script>
        <div class="cartBtn">
        <button id="card">
            <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
        </button>
        <button id="cart">
            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
        </button>
    </div>
</div>

</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>