<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
<!-- res css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/res.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/sideMenu.css" type="text/css">
<!-- calendar CDN -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.min.js"></script>
</head>
<body>

	<!-- 사업자 menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>


	<!-- 카페 사이드 메뉴 바 -->
    <div class="cafe-sidemenubar">
        <div id="side" class="col-cf">
        <ul class="side-menu" >
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
            <li class="side-item active" id="cafeRes">
                    <div class="side-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" viewBox="0 0 24 24">
                            <path d="M12,19a1,1,0,1,0-1-1A1,1,0,0,0,12,19Zm5,0a1,1,0,1,0-1-1A1,1,0,0,0,17,19Zm0-4a1,1,0,1,0-1-1A1,1,0,0,0,17,15Zm-5,0a1,1,0,1,0-1-1A1,1,0,0,0,12,15ZM19,3H18V2a1,1,0,0,0-2,0V3H8V2A1,1,0,0,0,6,2V3H5A3,3,0,0,0,2,6V20a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V6A3,3,0,0,0,19,3Zm1,17a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V11H20ZM20,9H4V6A1,1,0,0,1,5,5H6V6A1,1,0,0,0,8,6V5h8V6a1,1,0,0,0,2,0V5h1a1,1,0,0,1,1,1ZM7,15a1,1,0,1,0-1-1A1,1,0,0,0,7,15Zm0,4a1,1,0,1,0-1-1A1,1,0,0,0,7,19Z"/>
                        </svg>
                    </div>
                    <p class="menu-text">예약 내역</p>
            </li>
            <li class="side-item" id="cafeCon" onclick="location.href='${ contextPath }/cafe/biz/confirm'">
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
    </div>
    
   
    <div class="res-container">
        <div id="pd" class="col-cf">
            <!-- 캘린더 -->
            <div id="cf-calendar">
                <div id='calendar' style="padding: 2%;"></div>
            </div>
        </div>
  		
    </div>    
    
    
    
    <script>
    
    
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        
        // 오늘 날짜 구하기
        var date = new Date();
        var year = date.getFullYear();
        var month = ("0" + (1 + date.getMonth())).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        
        
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialDate: year + "-" + month + "-" + day,
        navLinks: true, // can click day/week names to navigate views
        nowIndicator: true,
        weekNumbers: true,
        weekNumberCalculation: 'ISO',
        editable: true,
        selectable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        
        events: [
        	<c:forEach items="${cafeReslist}" var="res">
        	
        	<fmt:formatDate  var="date" value="${res.caResDate}" pattern="yyyy-MM-dd"/>
			<c:set var="hereTogo" value="${ res.caResType }" />
			<c:set var="hereTime" value="${ res.caResHereTime }" />
			<c:set var="hereTimesplit" value="${fn:split(hereTime, '-')}" />
			<c:set var="ht1" value="${fn:trim(hereTimesplit[0])}" />
			<c:set var="ht2" value="${fn:trim(hereTimesplit[1])}" />
			
			<c:if test="${ hereTogo eq '매장' }">
            {
            title: '[${ hereTogo }]${ res.userId }(${res.caResPer}명)',
            start: '${ date }T${ht1}',
            end : '${ date }T${ht2}'
            },
            </c:if>
            <c:if test="${ hereTogo eq '포장' }">
            {
            title: '[${ hereTogo }]${ res.userId }님의 예약',
            start: '${ date }T${res.caResGoTime}'
            },
            </c:if>
        </c:forEach>
        ]
        
        });

        calendar.render();
        
    });
    </script>
   
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>