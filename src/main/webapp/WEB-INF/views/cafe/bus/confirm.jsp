<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 확인</title>
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/confirm.css" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/sideMenu.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>

	<!-- 사업자 menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	<c:forEach var="ca" items="${ Cafelist }">
    
    <!-- 카페 사이드 메뉴 바 -->
    <div class="cafe-sidemenubar">
    <c:choose>
    <c:when test="${ ca.caStatus eq 'Y' }">
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
        </c:when>
        <c:otherwise>
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
        </c:otherwise>
        </c:choose>
        <%@include file="./sideMenu.jsp" %>
    <div class="res-container" style="height: 100vh">
        <div id="pd" class="col-cf">
            <div class="con_table">
                <h2>카페 확인</h2>
                    <table class="table" id="confirm-table">
                        <thead>
                        <tr> 
                            <td scope="col">#</td>
                            <td scope="col">카페명</td>
                            <td scope="col">위치</td>
                            <td scope="col">운영시간</td>
                            <td scope="col">상세설명</td>
                            <td scope="col">커피메뉴</td>
                            <td scope="col">삭제하기</td>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                        <tr>
                                <td>${ ca.caCode }</td>
                                <td>${ ca.caName }</td>
                                <c:forTokens var="addr" items="${ ca.caAddress }" delims="," varStatus="status">
	                            <c:if test="${ status.index eq 0 }">
	                            	<c:set var="addr1" value="${ addr }"/>
	                            </c:if>
	                            <c:if test="${ status.index eq 1 }">
	                            	<c:set var="addr2" value="${ addr }"/>
	                            </c:if>
	                            <c:if test="${ status.index eq 2 }">
	                            	<c:set var="addr3" value="${ addr }"/>
	                            </c:if>
	                            </c:forTokens>
                                <td>${ addr2 } ${ addr3 }</td>
                                <td>${ ca.caStartTime } - ${ ca.caEndTime }</td>
                                <td class="grad" id="updateDetail" onclick="location.href='${ contextPath }/cafe/biz/caDetail?caCode=${ ca.caCode }'">
                                    <button id="detailBtn" class="btn-icon">
                                        <i class="fa fa-sign-in" aria-hidden="true"></i>
                                    </button>
                                </td>
                                <td class="grad" id="coffeeMenu" onclick="location.href='${ contextPath }/cafe/biz/Coffee?caCode=${ ca.caCode }'">
                                    <button id="coffeeBtn" class="btn-icon">
                                        <i class="fa fa-coffee" aria-hidden="true"></i>
                                    </button>
                                </td>
                                <td class="grad">
                                    <button id="deleteBtn" class="btn-icon" onclick="deleteBoard()">
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                    </button>
                                </td>
                            </tr>
                            <script>
                            function deleteBoard(){
                        		Swal.fire({
                        		  title: '카페를 삭제하시겠습니까???',
                        		  text: "삭제하시면 다시 복구시킬 수 없습니다.",
                        		  icon: 'warning',
                        		  showCancelButton: true,
                        		  confirmButtonColor: '#3085d6',
                        		  cancelButtonColor: '#d33',
                        		  confirmButtonText: '삭제',
                        		  cancelButtonText: '취소'
                        		}).then((result) => {
                      			  if (result.value) {
                    	              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
                    	              
                    	              $.ajax({
                    	            	  url:"${ contextPath }/cafe/biz/delete",
                    	            	  type: "get",
                    	            	  data : {
                    	            		  caCode : '${ca.caCode}'
                    	            	  },
                    	            	  success : function(data){
                    	            		 
                    	    				  location.href='${ contextPath }/cafe/biz/write';
                    	            	  },
                    	            	  error : function(e){
                    	    					console.log(e);
                    	    				}
                    	              });
                    			  };
                    		});
                        	}  
                            </script>
                       
                    </tbody>
                </table>
              <div class="container">
				  <div class="row">
				    <div class="col">
				      <!-- carousel -->
			            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
			              <div class="carousel-inner" id="caroselLeft">
			                <div class="carousel-item active" data-bs-interval="10000">
			                  <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ ca.mainPhoto }" class="d-block w-100" alt="..." height="300vh">
			                </div>
			                <div class="carousel-item" data-bs-interval="2000">
			                  <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ ca.photo1 }" class="d-block w-100" alt="..." height="300vh">
			                </div>
			                <div class="carousel-item">
			                  <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ ca.photo2 }" class="d-block w-100" alt="..." height="300vh">
			                </div>
			                <div class="carousel-item">
			                  <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ ca.photo3 }" class="d-block w-100" alt="..." height="300vh">
			                </div>
			              </div>
			              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			                <span class="visually-hidden">Previous</span>
			              </button>
			              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			                <span class="carousel-control-next-icon" aria-hidden="true"></span>
			                <span class="visually-hidden">Next</span>
			              </button>
			            </div>
				    </div>
				    <div class="col">
				    <input type="hidden" id="la" value="${ ca.caLa }">
     				<input type="hidden" id="lo" value="${ ca.caLo }">
				    <div id="map" style="width:100%;height:42vh;"></div>
				    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3400cb260ccc2b8ecfb54e177422380a&libraries=services&libraries=services"></script>
					<script>
					var mapla = parseFloat(document.getElementById('la').value);
					var maplo = parseFloat(document.getElementById('lo').value);
					var mapContainer = document.getElementById('map'), // 지도의 중심좌표
				    mapOption = { 
				        center: new kakao.maps.LatLng(mapla, maplo), // 지도의 중심좌표
				        level: 5 // 지도의 확대 레벨
				    }; 
				
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
					// 지도에 마커를 표시합니다 
					var marker = new kakao.maps.Marker({
					    map: map, 
					    position: new kakao.maps.LatLng(mapla, maplo)
					});
				
					// 커스텀 오버레이에 표시할 컨텐츠 입니다
					// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
					// 별도의 이벤트 메소드를 제공하지 않습니다 
					var content = '<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            '            ${ cafeInfo.caName }' + 
					            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
					            '        </div>' + 
					            '        <div class="body">' + 
					            '            <div class="img">' +
					            '                <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ ca.mainPhoto }" width="73" height="70">' +
					            '           </div>' + 
					            '            <div class="desc">' + 
					            '                <div class="ellipsis">${ addr2 }</div>' + 
					            '                <div class="jibun ellipsis">${ addr3 }</div>' + 
					            '            </div>' + 
					            '        </div>' + 
					            '    </div>' +    
					            '</div>';
				
					// 마커 위에 커스텀오버레이를 표시합니다
					// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					var overlay = new kakao.maps.CustomOverlay({
					    content: content,
					    map: map,
					    position: marker.getPosition()       
					});
				
					// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
					kakao.maps.event.addListener(marker, 'click', function() {
					    overlay.setMap(map);
					});
				
					// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
					function closeOverlay() {
					    overlay.setMap(null);     
					}
					</script>
				    </div>
				  </div>
				  </div>
				</div>
        </div>
    </div>
    <script>
        $(function() {
        $(".grad").click(function(e) {
            e.preventDefault();
            $(".grad").removeClass("active");
            $(this).addClass("active");
        });
    });  
   
    </script>
    </div>
    </div>
     </c:forEach>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>