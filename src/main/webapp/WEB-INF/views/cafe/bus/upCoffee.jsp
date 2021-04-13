<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 수정</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/sideMenu.css" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/upCoffee.css" type="text/css">
</head>
<body>
	<!-- 사업자 menubar -->
	<jsp:include page="/WEB-INF/views/common/menubarBus.jsp"/>
	
    
    <!-- 카페 사이드 메뉴 바 -->
    <div class="cafe-sidemenubar">
        <div id="side" class="col-cf">
        <ul class="side-menu">
            <li class="side-item" id="cafeHome"> 
                    <div class="side-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path   d="M18 12H19.9248C20.8933 12 21.2962 10.7609 20.513 10.1913L12.5881 4.42778C12.2375 4.17276 11.7625 4.17276 11.4118 4.42778L3.48699 10.1913C2.70374 10.7609 3.10668 12 4.07516 12H5.99998V19C5.99998 19.5523 6.44769 20 6.99998 20H9.99998V14H14V20H17C17.5523 20 18 19.5523 18 19V12Z"/>
                        </svg>
                    </div>
                    <p class="menu-text">HOME</p>
            </li>
            <li class="side-item" id="cafeOrd">
                    <div class="side-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path  fill-rule="evenodd" d="M15 5H18C19.1046 5 20 5.89543 20 7V19C20 20.1046 19.1046 21 18 21H6C4.89543 21 4 20.1046 4 19V7C4 5.89543 4.89543 5 6 5H9C9 3.34315 10.3431 2 12 2C13.6569 2 15 3.34315 15 5ZM13 5C13 5.55228 12.5523 6 12 6C11.4477 6 11 5.55228 11 5C11 4.44772 11.4477 4 12 4C12.5523 4 13 4.44772 13 5ZM6 9C6 8.44772 6.44772 8 7 8H17C17.5523 8 18 8.44772 18 9C18 9.55228 17.5523 10 17 10H7C6.44772 10 6 9.55228 6 9ZM7 12C6.44772 12 6 12.4477 6 13C6 13.5523 6.44772 14 7 14H17C17.5523 14 18 13.5523 18 13C18 12.4477 17.5523 12 17 12H7ZM7 16C6.44772 16 6 16.4477 6 17C6 17.5523 6.44772 18 7 18H10C10.5523 18 11 17.5523 11 17C11 16.4477 10.5523 16 10 16H7Z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <p class="menu-text">주문 내역</p>
            </li>
            <li class="side-item" id="cafeRes">
                    <div class="side-icon" id="cafeRes">
                        <svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" viewBox="0 0 24 24">
                            <path d="M12,19a1,1,0,1,0-1-1A1,1,0,0,0,12,19Zm5,0a1,1,0,1,0-1-1A1,1,0,0,0,17,19Zm0-4a1,1,0,1,0-1-1A1,1,0,0,0,17,15Zm-5,0a1,1,0,1,0-1-1A1,1,0,0,0,12,15ZM19,3H18V2a1,1,0,0,0-2,0V3H8V2A1,1,0,0,0,6,2V3H5A3,3,0,0,0,2,6V20a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V6A3,3,0,0,0,19,3Zm1,17a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V11H20ZM20,9H4V6A1,1,0,0,1,5,5H6V6A1,1,0,0,0,8,6V5h8V6a1,1,0,0,0,2,0V5h1a1,1,0,0,1,1,1ZM7,15a1,1,0,1,0-1-1A1,1,0,0,0,7,15Zm0,4a1,1,0,1,0-1-1A1,1,0,0,0,7,19Z"/>
                        </svg>
                    </div>
                    <p class="menu-text">예약 내역</p>
            </li>
            <li class="side-item" id="cafeWri">
                    <div class="side-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path  d="M17.864 3.60051C17.4735 3.20999 16.8403 3.20999 16.4498 3.60051L15.0356 5.01472 19.2782 9.25736 20.6924 7.84315C21.0829 7.45263 21.0829 6.81946 20.6924 6.42894L17.864 3.60051zM17.864 10.6716L13.6213 6.42894 4.72185 15.3284C4.53431 15.516 4.42896 15.7703 4.42896 16.0355L4.42896 18.864C4.42895 19.4163 4.87667 19.864 5.42896 19.864H8.25738C8.5226 19.864 8.77695 19.7586 8.96449 19.5711L17.864 10.6716z"/>
                        </svg>
                    </div>
                    <p class="menu-text">카페 등록</p>
            </li>
            <li class="side-item active" id="cafeCon">
                    <div class="side-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                            <path  fill-rule="evenodd" d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22ZM15.5355 8.46447C15.9261 8.07394 16.5592 8.07394 16.9498 8.46447C17.3403 8.85499 17.3403 9.48816 16.9498 9.87868L11.2966 15.5318L11.2929 15.5355C11.1919 15.6365 11.0747 15.7114 10.9496 15.7602C10.7724 15.8292 10.5795 15.8459 10.3948 15.8101C10.2057 15.7735 10.0251 15.682 9.87868 15.5355L9.87489 15.5317L7.05028 12.7071C6.65975 12.3166 6.65975 11.6834 7.05028 11.2929C7.4408 10.9024 8.07397 10.9024 8.46449 11.2929L10.5858 13.4142L15.5355 8.46447Z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <p class="menu-text">카페 확인</p>
            </li>
        </ul>
        </div>
        <%@include file="./sideMenu.jsp" %>
        
        <div class="coffee-container">
        <div id="cf" class="col-cf">
                <div class="container" id="coffee-write-form">
                <div class="row">
                    <div class="col-8">
                        <h2>음료 등록</h2>
                    </div>
                    <div class="col-4" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                        <!-- Button trigger modal -->
                        <i class="fa fa-pencil-square-o" id="pencilIcon" aria-hidden="true"></i>
                    </div>
                    <hr>
                </div>
                <!-- 음료 상품 -->
                
                <div class="row row-cols-4">
                    <div class="col">
                    <c:forEach var="co" items="${ Coffeelist }">	
                	<c:choose>
                	<c:when test="${!empty co}">
                        <div class="card" style="width: 18rem;">
                            <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/02/[9200000001635]_20210225092236748.jpg" class="card-img-top" alt="음료사진">
                            <div class="card-body">
                                <h5 class="card-title">${ co.cfName }</h5>
                                <p class="card-text">
                                    <ul id="cardContent">
                                        <li>${ co.cfPrice }</li>
                                        <li>${ co.cfCount }</li>
                                    </ul>
                                </p>
                                <a href="#" class="btn" id="coffeeBtn" data-bs-toggle="modal" data-bs-target="#staticBackdropUpdate">자세히보기</a>
                            </div>
                        </div>
                        </c:when>
                		<c:otherwise>등록된 음료 정보가 존재하지 않습니다.</c:otherwise>
                		</c:choose>
                		</c:forEach>
                    </div>
                </div>
                
                </div>
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <form action="" method="post" enctype="multipart/form-data">
                    <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <i class="fa fa-coffee" id="coffee-icon" aria-hidden="true"></i>
                            <button type="button" id="close-icon" data-bs-dismiss="modal" aria-label="Close">
                                <i class="fa fa-times" aria-hidden="true"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="modalForm category">
                                <h5 class="coffee-title">카테고리</h5> 
                                <input type="radio" name="cfCategory" value="COFFEE" class="radioModal">COFFEE
                                <input type="radio" name="cfCategory" value="BEVERAGE" class="radioModal">BEVERAGE
                                <input type="radio" name="cfCategory" value="DESSERT" class="radioModal">DESSERT
                                <input type="radio" name="cfCategory" value="SET MENU" class="radioModal">SET MENU
                            </div>
                            <div class="modalForm img">
                                <h5 class="coffee-title">음료 대표 사진</h5> 
                                <div id="beverageImg" class="beverageImg"></div>
                                <div id="files">
                                    <input type="file" id="imgBev" name="imgBev" onchange="preview(this)">
                                </div>
                                <script>
                                    // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
                                    $(function () {
                                        $("#files").hide();

                                        $("#beverageImg").click(function () {
                                            $("#imgBev").click();
                                        });
                                    });

                                    function preview(value) {
                                        // value => input type="file"
                                        // num => 조건문으로 각 번호에 맞춰서 위의 미리보기 img에 적용시킬것

                                        // file이 존재하는지 조건문
                                        if (value.files && value.files[0]) {
                                            // 파일을 읽어들일 FileReader 객체 생성
                                            var reader = new FileReader(); 

                                            // 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
                                            reader.readAsDataURL(value.files[0]); 

                                            // 파일 읽기가 다 완료되었을 때 실행되는 메소드
                                            reader.onload = function (e) {
                                                $("#beverageImg").html("<img src='" + reader.result + "' width='260px' height='230px'>");
                                            }
                                        }
                                    }
                                </script>
                            </div>
                            <div class="modalForm BeverageName">
                                <h5 class="coffee-title">음료명</h5>
                                <input type="text" id="text"  name="coffeeName" placeholder="음료명으로 노출될 문구를 작성해주세요.(ex. 아메리카노)"/>
                            </div>
                            <div class="modalForm price">
                                <h5 class="coffee-title">판매가</h5>
                                <input type="number"  min='1000' max='10000' step='100' id="number">
                            </div>
                            <div class="modalForm BeverageCount">
                                <h5 class="coffee-title">재고수량</h5>
                                <button class="minus">
                                    <i class="fa fa-minus" aria-hidden="true"></i>
                                </button>
                                <input type="number" class="numBox" min="1" max="100" readonly>
                                <button class="plus">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                </button>
                                <script>
                                    $(".plus").click(function(){
                                        var num = $(".numBox").val();
                                        var plusNum = Number(num)+1;

                                        if(plusNum >= 100){
                                            $(".numBox").val(num);
                                        }else{
                                            $(".numBox").val(plusNum);
                                        }
                                    });

                                    $(".minus").click(function(){
                                        var num = $(".numBox").val();
                                        var minusNum = Number(num)-1;

                                        if(minusNum <= 0){
                                            $(".numBox").val(num);
                                        }else{
                                            $(".numBox").val(minusNum);
                                        }
                                    });
                                </script>
                            </div>
                        <!-- </form> -->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn" id="addBtn">수정</button>
                            <button type="button" class="btn" id="cancelBtn" data-bs-dismiss="modal">취소</button>
                        </div>
                    
                    </div>
                    </div>
                    </form>
                </div>

                <!-- 수정하기 모달 -->
                <!-- Modal -->
                <div class="modal fade" id="staticBackdropUpdate" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                    <form >
                    <div class="modal-content">
                        <div class="modal-header">
                            <i class="fa fa-coffee" id="coffee-icon" aria-hidden="true"></i>
                            <button type="button" id="close-icon" data-bs-dismiss="modal" aria-label="Close">
                                <i class="fa fa-times" aria-hidden="true"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                           	
                            <div class="modalForm category">
                                <h5 class="coffee-title">카테고리</h5> 
                                <input type="radio" name="category" value="COFFEE" class="radioModal" checked>COFFEE
                                <input type="radio" name="category" value="BEVERAGE" class="radioModal">BEVERAGE
                                <input type="radio" name="category" value="DESSERT" class="radioModal">DESSERT
                                <input type="radio" name="category" value="SET MENU" class="radioModal">SET MENU
                            </div>
                            <div class="modalForm img">
                                <h5 class="coffee-title">음료 대표 사진</h5> 
                                <div id="beverageImg" class="beverageImg"></div>
                                <div id="files">
                                    <input type="file" id="imgBev" name="imgBev" onchange="preview(this)">
                                </div>
                                <script>
                                    // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
                                    $(function () {
                                        $("#files").hide();
                                    });

                                    function preview(value) {
                                        // value => input type="file"
                                        // num => 조건문으로 각 번호에 맞춰서 위의 미리보기 img에 적용시킬것

                                        // file이 존재하는지 조건문
                                        if (value.files && value.files[0]) {
                                            // 파일을 읽어들일 FileReader 객체 생성
                                            var reader = new FileReader(); 

                                            // 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
                                            reader.readAsDataURL(value.files[0]); 

                                            // 파일 읽기가 다 완료되었을 때 실행되는 메소드
                                            reader.onload = function (e) {
                                                $("#beverageImg").html("<img src='" + reader.result + "' width='260px' height='230px'>");
                                            }
                                        }
                                    }
                                </script>
                            </div>
                            <div class="modalForm BeverageName">
                                <h5 class="coffee-title">음료명</h5>
                                <input type="text" id="text"  name="coffeeName" value="콜드 브루 플로트" placeholder="음료명으로 노출될 문구를 작성해주세요.(ex. 아메리카노)"/>
                            </div>
                            <div class="modalForm price">
                                <h5 class="coffee-title">판매가</h5>
                                <input type="number"  min='1000' max='10000' step='100' id="number" value="4500">
                            </div>
                            <div class="modalForm BeverageCount">
                                <h5 class="coffee-title">재고수량</h5>
                                <button class="minus">
                                    <i class="fa fa-minus" aria-hidden="true"></i>
                                </button>
                                <input type="number" class="numBox" min="1" max="100" readonly value="10">
                                <button class="plus">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                </button>
                                <script>
                                    $(".plus").click(function(){
                                        var num = $(".numBox").val();
                                        var plusNum = Number(num)+1;

                                        if(plusNum >= 100){
                                            $(".numBox").val(num);
                                        }else{
                                            $(".numBox").val(plusNum);
                                        }
                                    });

                                    $(".minus").click(function(){
                                        var num = $(".numBox").val();
                                        var minusNum = Number(num)-1;

                                        if(minusNum <= 0){
                                            $(".numBox").val(num);
                                        }else{
                                            $(".numBox").val(minusNum);
                                        }
                                    });
                                </script>
                            </div>
                        
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn" id="addBtn">추가</button>
                            <button type="button" class="btn" id="cancelBtn" data-bs-dismiss="modal">취소</button>
                        </div>
                        </div>
                    	</form>
                    </div>
                    </div>
                </div>
            </div>
        </div>    

        
        
        <!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>