<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 구매 내역</title>
    <!-- menubar css -->
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/menubar.css">
    <!-- side menubar css -->
    <link rel="stylesheet" href="${ contextPath }/resources/css/mypage/sideMenu.css">
    <!-- footer css -->
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/footer.css">
    
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

		.mp-container {
        	height : 900px;
        }
        
        #mp{
            display: flex;
            margin-top: 1%;
            margin-left: 5%;
            width: 80vw;
            height: 800px;
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
        
        #map {
        	border : 1px solid #4B654A;
        }

    </style>
</head>
<body>
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<!-- kakaoMap Library -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7f32424a29ddd32cc9bc9bd1bac80acc&libraries=services"></script>
    <!-- 카페 사이드 메뉴 바 -->
    <div class="mypage-container">
        <div id="side" class="col-mp">
            <ul class="side-menu">
                <li class="side-item active" onclick="location.href='${contextPath}/nMypage/homeView'"> 
                        <div class="side-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                <path   d="M18 12H19.9248C20.8933 12 21.2962 10.7609 20.513 10.1913L12.5881 4.42778C12.2375 4.17276 11.7625 4.17276 11.4118 4.42778L3.48699 10.1913C2.70374 10.7609 3.10668 12 4.07516 12H5.99998V19C5.99998 19.5523 6.44769 20 6.99998 20H9.99998V14H14V20H17C17.5523 20 18 19.5523 18 19V12Z"/>
                            </svg>
                        </div>
                        <p class="menu-text">HOME</p>
                </li>
                <li class="side-item" onclick="location.href='${contextPath}/nMypage/updateView'">
                        <div class="side-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                                <path  d="M17.864 3.60051C17.4735 3.20999 16.8403 3.20999 16.4498 3.60051L15.0356 5.01472 19.2782 9.25736 20.6924 7.84315C21.0829 7.45263 21.0829 6.81946 20.6924 6.42894L17.864 3.60051zM17.864 10.6716L13.6213 6.42894 4.72185 15.3284C4.53431 15.516 4.42896 15.7703 4.42896 16.0355L4.42896 18.864C4.42895 19.4163 4.87667 19.864 5.42896 19.864H8.25738C8.5226 19.864 8.77695 19.7586 8.96449 19.5711L17.864 10.6716z"/>
                            </svg>
                        </div>
                        <p class="menu-text">정보 수정</p>
                </li>
                <li class="side-item" onclick="location.href='${contextPath}/nMypage/paymentView'">
                        <div class="side-icon" id="cafeRes">
                            <svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" viewBox="0 0 24 24">
                                <path d="M12,19a1,1,0,1,0-1-1A1,1,0,0,0,12,19Zm5,0a1,1,0,1,0-1-1A1,1,0,0,0,17,19Zm0-4a1,1,0,1,0-1-1A1,1,0,0,0,17,15Zm-5,0a1,1,0,1,0-1-1A1,1,0,0,0,12,15ZM19,3H18V2a1,1,0,0,0-2,0V3H8V2A1,1,0,0,0,6,2V3H5A3,3,0,0,0,2,6V20a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V6A3,3,0,0,0,19,3Zm1,17a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V11H20ZM20,9H4V6A1,1,0,0,1,5,5H6V6A1,1,0,0,0,8,6V5h8V6a1,1,0,0,0,2,0V5h1a1,1,0,0,1,1,1ZM7,15a1,1,0,1,0-1-1A1,1,0,0,0,7,15Zm0,4a1,1,0,1,0-1-1A1,1,0,0,0,7,19Z"/>
                            </svg>
                        </div>
                        <p class="menu-text">구매 내역</p>
                </li>
                <li class="side-item" onclick="location.href='${contextPath}/nMypage/couponView'">
                        <div class="side-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M22,4H2A1,1,0,0,0,1,5V19a1,1,0,0,0,1,1H22a1,1,0,0,0,1-1V5A1,1,0,0,0,22,4ZM21,18H19V15a1,1,0,0,0-2,0v3H3V6H17V9a1,1,0,0,0,2,0V6h2ZM13.71,8.29a1,1,0,0,1,0,1.42l-6,6a1,1,0,0,1-1.42,0,1,1,0,0,1,0-1.42l6-6A1,1,0,0,1,13.71,8.29ZM7,9a1,1,0,1,1,1,1A1,1,0,0,1,7,9Zm6,6a1,1,0,1,1-1-1A1,1,0,0,1,13,15Z"/>
                            </svg>
                        </div>
                        <p class="menu-text">My 쿠폰</p>
                </li>
                <li class="side-item" onclick="location.href='${contextPath}/nMypage/deleteView'">
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
                    <h3>클래스 예약 현황</h3>
                </div>
                <div class="content-info">
                    <div class="info-div">
                        <form>
                            <table class="info-table">
                                <tr>
                                    <td class="first-td">결제일</td>
                                    <td>${ detail.pay_date }</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">클래스명</td>
                                    <td>${ detail.cl_name }</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">정원</td>
                                    <td>${ detail.cl_max }</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">강사명</td>
                                    <td>${ detail.tr_name }</td>
                                    <td><button type="button" class="class-detail" onclick="detailClassView('${detail.class_no}');">클래스 상세보기</button></td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">강의 일정</td>
                                    <td>${ detail.cl_date }, ${ detail.cl_time }</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">장소</td>
                                    <td>${ detail.c_name }, ${ fn:replace(detail.c_address, ',', ' ') }</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td colspan="3"><div id="map" style="width:100%; height:250px; margin:10px 0;"></div></td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td class="first-td">상태</td>
                                    <td id="status">수강 대기</td>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <td colspan="3">
                                        <button type="button" onclick="location.href='${ contextPath }/nMypage/paymentView'">확인</button>
                                        <button id="reviewBtn" type="button" style="display:none;"
                                        onclick="window.open('${ contextPath }/nMypage/reviewInsert?category=CLRV&cl_pay_no=${ detail.cl_pay_no }&class_no=${ detail.class_no }', 'popup', 'width=503px, height=603px')">후기 등록</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:set var="cl_date" value="${ fn:split(detail.cl_date, '-') }"/>
    <script>
    	$(function(){
    		var date = new Date();
    		var cl_date = new Date(${ cl_date[0] }, ${ cl_date[1] - 1}, ${ cl_date[2]});
    		var status = document.getElementById("status");
    		if(cl_date <= date) {
    			status.innerHTML = "수강 완료";
    			$("#reviewBtn").css({"display":"inline-block"});
    		} else {
    			status.innerHTML = "수강 대기";
    			$("#reviewBtn").css({"display":"none"});
    		}
    	});
    	
    	var mapContainer = document.getElementById('map'),
    		mapOption = {
    			center : new kakao.maps.LatLng(33.450701, 126.570667),
    			level : 3
    	};
    	
    	var map = new kakao.maps.Map(mapContainer, mapOption);
    	var coords = new kakao.maps.LatLng(${ detail.c_la }, ${ detail.c_lo });
    	
    	var marker = new kakao.maps.Marker({
    		map : map,
    		position : coords
    	});
    	
    	var infowindow = new kakao.maps.InfoWindow({
    		content : '<div style="width:150px; text-align:center; padding:6px 0;">${ detail.c_name }</div>'
    	});
    	infowindow.open(map, marker);
    	
    	map.setCenter(coords);
    	
    	function detailClassView(class_no) {
    		console.log(class_no);
    		location.href="${ contextPath }/coffeeclass/classdetail?classNo=" + class_no;
    	}
    </script>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>