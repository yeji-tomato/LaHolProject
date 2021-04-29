<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 home</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/home.css" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/sideMenu.css" type="text/css">
</head>
<body>
	
	<!-- 사업자 menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	<!-- 카페 사이드 메뉴 바 -->
    <div class="cafe-sidemenubar">
        <div id="side" class="col col-cf">
        <ul class="side-menu">
            <li class="side-item active" id="cafeHome">
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
                    <div class="side-icon">
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
            <li class="side-item" id="cafeCon">
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
    
    <div class="container">
        <div class="row row-cols-2" id="cf-row">
            <!-- 주문 -->
            <div class="col col-cf" id="order">
                <table class="order-cf" style="margin-top: 5%">
                <thead>
                    <tr>
                        <th colspan="4" id="order-status">주문 상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">제조 전</td>
                        <td class="nu" style="text-align: right;"></td>
                        <td style="text-align: right;">${ countBefore }&nbsp;&nbsp;
                        	건 &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">제조 중</td>
                        <td class="nu" style="text-align: right;"></td>
                        <td style="text-align: right;">${ countMiddle }&nbsp;&nbsp;
                        	건 &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">제조 완료</td>
                        <td class="nu" style="text-align: right;"></td>
                        <td style="text-align: right;">${ countAfter }&nbsp;&nbsp;
                        	건 &nbsp;</td>
                    </tr>
                </tbody>
                </table>
            </div>
            <div class="col col-cf" id="my-cafe">
            <c:choose>
            	<c:when test="${!empty ca}">
					<div class="wrapper" id="cafe-my-wrapper">
                        <div class="cafe-img">
                            <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ ca.mainPhoto }">
                        </div>
                        <div class="cafe-info">
                            <div class="cafe-text">
                                <h1>${ ca.caName }</h1>
                                <pre>${ ca.message }</pre>
                            </div>
                        <div class="cafe-btn" >
                            <button type="button" onclick='location.href="${ contextPath }/cafe/biz/confirm"' id="dtBtn" >자세히 보러가기 →</button>
                        </div>
                        </div>
                    </div>
				</c:when>
				<c:otherwise>
					<div class="wrapper" id="cafe-my-wrapper">
                        <div class="cafe-img">
                            <img src="https://i.pinimg.com/564x/e5/7e/5a/e57e5aecc658ba0b205a807d965f9e85.jpg">
                        </div>
                        <div class="cafe-info">
                            <div class="cafe-text">
                                <h1>CAFE</h1>
                                <p>등록된 카페가 아직 존재하지 않습니다! <br>
                                    	카페를 등록해주세요!</p>
                            </div>
                        <div class="cafe-btn" onclick="${ contextPath }/cafe/biz/write">
                            <button type="button" id="dtBtn">등록하러가기 →</button>
                        </div>
                        </div>
                    </div>
				</c:otherwise>
            </c:choose>	
             
            </div>
            <div class="col col-cf" id="answer">
                <div class="ans_table">
                    <table class="table">
                        <thead>
                            <tr>
                                <th colspan="6" id="answer-status">미답변 문의(Q&A)</th>
                                <th class="delete">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#810B0B" viewBox="0 0 24 24">
                                        <path fill="#810B0B" d="M15 3C15.5523 3 16 3.44772 16 4L18 4C18.5523 4 19 4.44772 19 5C19 5.55229 18.5523 6 18 6L6 6C5.44772 6 5 5.55228 5 5C5 4.44772 5.44772 4 6 4L8 4C8 3.44772 8.44772 3 9 3H15Z"/>
                                        <path fill="#810B0B" fill-rule="evenodd" d="M6 7H18V19C18 20.1046 17.1046 21 16 21H8C6.89543 21 6 20.1046 6 19V7ZM9.5 9C9.22386 9 9 9.22386 9 9.5V18.5C9 18.7761 9.22386 19 9.5 19C9.77614 19 10 18.7761 10 18.5V9.5C10 9.22386 9.77614 9 9.5 9ZM14.5 9C14.2239 9 14 9.22386 14 9.5V18.5C14 18.7761 14.2239 19 14.5 19C14.7761 19 15 18.7761 15 18.5V9.5C15 9.22386 14.7761 9 14.5 9Z" clip-rule="evenodd"/>
                                    </svg>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th><input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked></th>
                            <th>1</th>
                            <td>답변 대기</td>
                            <td>카페 프라푸치노는 다시 안나오나요?</td>
                            <td>dd****</td>
                            <td>2020-12-25</td>
                            <td>
                                <button id="detail" onclick="detail()">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 0 48 48" width="48">
                                        <path d="M0 0h48v48h-48z" fill="none"/>
                                        <path d="M24 8l-2.83 2.83 11.17 11.17h-24.34v4h24.34l-11.17 11.17 2.83 2.83 16-16z"/>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
    
</body>
</html>