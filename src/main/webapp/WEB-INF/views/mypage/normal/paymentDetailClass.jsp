<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 구매 내역</title>
    <!-- menubar css -->
    <link rel="stylesheet" href="../common/menubar.css">
    <!-- side menubar css -->
    <link rel="stylesheet" href="../common/business/menu/menu.css">
    <!-- footer css -->
    <link rel="stylesheet" href="../common/footer.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    <style>
        body{
            margin: 0;
            padding: 0;
        }

        .mypage-container{
            width: 100%;
            height: auto; 
            padding-top: 10%;
        }


        #mp{
            display: flex;
            margin-top: 1%;
            margin-left: 5%;
            width: 80vw;
            height: auto;
            justify-content: center;
            text-align: center;
            border-radius: 30px;
            -webkit-box-shadow: 0px 14px 32px 0px rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0px 14px 32px 0px rgba(0, 0, 0, 0.15);
            box-shadow: 0px 14px 32px 0px rgba(0, 0, 0, 0.15);
        }

        .col-mp{
            float: left;
        }

        .side-item {
            cursor: pointer;
        }

        .content-div {
            display : flex;
            justify-content: center;
            align-content: center;
            width : 80%;
            margin : 30px auto;
            flex-direction: column;
        }

        .content-title {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 10%;
        }

        .content-info {
            display: flex;
            justify-content: center;
            background : rgba(243, 215, 152, 0.6);
            border-radius: 20px;
            width : 100%;
            height : 90%;
        }

        .info-div {
            padding-top: 20px;
            padding-bottom: 20px;
            width : 80%;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-content: center;
        }

        .info-div button {
            width : 7vw;
            height: 30px;
            outline: none;
            border : none;
            background: #4B654A;
            color : #fff;
        }

        .info-table {
            border-collapse: collapse;
            width : 100%;
        }

        .info-table td:nth-child(1) {
            width : 15%;
        }

        .info-table td:nth-child(2) {
            width : 60%;
            text-align: justify;
            padding-left : 10px;
        }

        .info-table .first-td {
            background: #5A452E;
            color : #fff;
            padding : 10px;
            margin : 10px;
        }

        .info-table .class-detail {
            width : 150px;
        }

    </style>
</head>
<body>
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
    <!-- 카페 사이드 메뉴 바 -->
    <div class="mypage-container">
        <div id="side" class="col-mp">
            <ul class="side-menu">
                <li class="side-item active" onclick="location.href='mypage.html'"> <!-- 관리자 일 때 메인 페이지 경로 수정 -->
                        <div class="side-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                <path   d="M18 12H19.9248C20.8933 12 21.2962 10.7609 20.513 10.1913L12.5881 4.42778C12.2375 4.17276 11.7625 4.17276 11.4118 4.42778L3.48699 10.1913C2.70374 10.7609 3.10668 12 4.07516 12H5.99998V19C5.99998 19.5523 6.44769 20 6.99998 20H9.99998V14H14V20H17C17.5523 20 18 19.5523 18 19V12Z"/>
                            </svg>
                        </div>
                        <p class="menu-text">HOME</p>
                </li>
                <li class="side-item" onclick="location.href='updateMember.html'">
                        <div class="side-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                <path  d="M17.864 3.60051C17.4735 3.20999 16.8403 3.20999 16.4498 3.60051L15.0356 5.01472 19.2782 9.25736 20.6924 7.84315C21.0829 7.45263 21.0829 6.81946 20.6924 6.42894L17.864 3.60051zM17.864 10.6716L13.6213 6.42894 4.72185 15.3284C4.53431 15.516 4.42896 15.7703 4.42896 16.0355L4.42896 18.864C4.42895 19.4163 4.87667 19.864 5.42896 19.864H8.25738C8.5226 19.864 8.77695 19.7586 8.96449 19.5711L17.864 10.6716z"/>
                            </svg>
                        </div>
                        <p class="menu-text">정보 수정</p>
                </li>
                <li class="side-item" onclick="location.href='paymentList.html'">
                        <div class="side-icon" id="cafeRes">
                            <svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" viewBox="0 0 24 24">
                                <path d="M12,19a1,1,0,1,0-1-1A1,1,0,0,0,12,19Zm5,0a1,1,0,1,0-1-1A1,1,0,0,0,17,19Zm0-4a1,1,0,1,0-1-1A1,1,0,0,0,17,15Zm-5,0a1,1,0,1,0-1-1A1,1,0,0,0,12,15ZM19,3H18V2a1,1,0,0,0-2,0V3H8V2A1,1,0,0,0,6,2V3H5A3,3,0,0,0,2,6V20a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V6A3,3,0,0,0,19,3Zm1,17a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V11H20ZM20,9H4V6A1,1,0,0,1,5,5H6V6A1,1,0,0,0,8,6V5h8V6a1,1,0,0,0,2,0V5h1a1,1,0,0,1,1,1ZM7,15a1,1,0,1,0-1-1A1,1,0,0,0,7,15Zm0,4a1,1,0,1,0-1-1A1,1,0,0,0,7,19Z"/>
                            </svg>
                        </div>
                        <p class="menu-text">구매 내역</p>
                </li>
                <li class="side-item" onclick="location.href='couponList.html'">
                        <div class="side-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M22,4H2A1,1,0,0,0,1,5V19a1,1,0,0,0,1,1H22a1,1,0,0,0,1-1V5A1,1,0,0,0,22,4ZM21,18H19V15a1,1,0,0,0-2,0v3H3V6H17V9a1,1,0,0,0,2,0V6h2ZM13.71,8.29a1,1,0,0,1,0,1.42l-6,6a1,1,0,0,1-1.42,0,1,1,0,0,1,0-1.42l6-6A1,1,0,0,1,13.71,8.29ZM7,9a1,1,0,1,1,1,1A1,1,0,0,1,7,9Zm6,6a1,1,0,1,1-1-1A1,1,0,0,1,13,15Z"/>
                            </svg>
                        </div>
                        <p class="menu-text">My 쿠폰</p>
                </li>
                <li class="side-item" onclick="location.href='interestList.html'">
                        <div class="side-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                <path  fill-rule="evenodd" d="M15 5H18C19.1046 5 20 5.89543 20 7V19C20 20.1046 19.1046 21 18 21H6C4.89543 21 4 20.1046 4 19V7C4 5.89543 4.89543 5 6 5H9C9 3.34315 10.3431 2 12 2C13.6569 2 15 3.34315 15 5ZM13 5C13 5.55228 12.5523 6 12 6C11.4477 6 11 5.55228 11 5C11 4.44772 11.4477 4 12 4C12.5523 4 13 4.44772 13 5ZM6 9C6 8.44772 6.44772 8 7 8H17C17.5523 8 18 8.44772 18 9C18 9.55228 17.5523 10 17 10H7C6.44772 10 6 9.55228 6 9ZM7 12C6.44772 12 6 12.4477 6 13C6 13.5523 6.44772 14 7 14H17C17.5523 14 18 13.5523 18 13C18 12.4477 17.5523 12 17 12H7ZM7 16C6.44772 16 6 16.4477 6 17C6 17.5523 6.44772 18 7 18H10C10.5523 18 11 17.5523 11 17C11 16.4477 10.5523 16 10 16H7Z" clip-rule="evenodd"/>
                            </svg>
                        </div>
                        <p class="menu-text">관심 목록</p>
                </li>
                <li class="side-item" onclick="location.href='deleteMember.html'">
                        <div class="side-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" viewBox="0 0 29 29">
                                <path d="M14.5,2A12.51408,12.51408,0,0,0,2,14.5,12.52131,12.52131,0,0,0,14.5,27a12.5,12.5,0,0,0,0-25Zm7.60309,19.71283a8.48005,8.48005,0,0,0-15.19873.00824A10.36659,10.36659,0,0,1,4,14.5a10.5,10.5,0,0,1,21,0A10.36807,10.36807,0,0,1,22.10309,21.71283ZM14.5,7A4.5,4.5,0,1,0,19,11.5,4.5,4.5,0,0,0,14.5,7Z"/>
                            </svg>
                        </div>
                        <p class="menu-text">회원 탈퇴</p>
                </li>
            </ul>
        </div>
        <script>
            $(function() {
                $(".side-item").removeClass("active");
                $(".side-item:nth-child(3)").addClass("active");

            $(".side-item").click(function(e) {
                    e.preventDefault();
                    $(".side-item").removeClass("active");
                    $(this).addClass("active");
                });
            });

        </script>
    </div>
    <div class="mp-container">
        <div id="mp" class="col-mp">
            <!-- 이부분에 내용 작성 -->
            <div class="content-div">
                <div class="content-title">
                    <h3>카페 예약 현황</h3>
                </div>
                <div class="content-info">
                    <div class="info-div">
                        <form>
                            <table class="info-table">
                                <tr>
                                    <td class="first-td">결제일</td>
                                    <td>2021.03.01(월) 15:20</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">클래스명</td>
                                    <td>KH커피</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">정원</td>
                                    <td></td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">강사명</td>
                                    <td>이윤재</td>
                                    <td><button class="class-detail">클래스 상세보기</button></td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">강의 일정</td>
                                    <td>2021.03.01(월) 18:00</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">장소</td>
                                    <td></td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td colspan="3">지도지도</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">상태</td>
                                    <td>예약완료/수강중/수강완료</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td colspan="2">
                                        <button type="button">확인</button>
                                        <button type="button">후기 등록</button>    <!-- 완료 상태일 때만 후기 등록 나타남 -->
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>