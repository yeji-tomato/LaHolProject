<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 등록 페이지</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/write.css" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/sideMenu.css" type="text/css">
</head>
<body>

	<!-- 사업자 menubar -->
	<jsp:include page="/WEB-INF/views/common/menubarBus.jsp"/>
	
	<!-- 카페 사이드 메뉴 바 -->
    <div class="write-container">
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
            <li class="side-item active" id="cafeWri">
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
    
    <div class="cf-container">
        <div id="cf" class="col-cf">
            <!-- 카페 등록 폼 -->
            <div class="cafe-write-form">
            <h2>카페 등록</h2>
            <hr>
            <form action="${ contextPath }/cafe/biz/insert" id="uploadForm" method="post" enctype="multipart/form-data">
                <input type="text" name="caId" value="${ loginUser.id }">
                <div class="container">
                    <div class="writeArea">
                        <!-- 카페명 -->
                        <div class="row" id="divRow">
                            <div class="col">
                                <h3 class="write-title">카페명</h3>
                                <input type="text" id="text" class="cateTit"  name="caName" placeholder="카페명으로 노출될 문구를 작성해주세요.(ex. 커피한잔)"/>
                            </div>
                            <div class="col writeSpan">
                                <!-- 운영시간 -->
                                <div  class="row">
                                    <h3 class="write-title">운영시간</h3>
                                <div class="col-2">
                                    시작시간
                                </div>
                                <div class="col-4">
                                    <input type="time" id="text" value="xxx" min="yyy" max="zzz" name="caStartTime">
                                </div>
                                <div class="col-2">
                                    종료시간
                                </div>
                                <div class="col-4">
                                    <input type="time" id="text" value="xxx" min="yyy" max="zzz" name="caEndTime">
                                </div>
                                </div>
                            </div>
                            </div>
                    </div>
                    <!-- 카페 사진 -->
                    <div class="row" id="divRow">
                        <h3 class="write-title">카페사진</h3>
                        <p style="color: #CDC2AF;">대표사진 한 장은 필수로 입력해야 합니다. 최대 4장까지 사진 입력이 가능합니다.</p>
                        <div class="col">
                            <div id="thumbnail1" class="thumbnail"></div>
                        </div>
                        <div class="col">
                            <div id="thumbnail2" class="thumbnail"></div>
                        </div>
                        <div class="col">
                            <div id="thumbnail3" class="thumbnail"></div>
                        </div>
                        <div class="col">
                            <div id="thumbnail4" class="thumbnail"></div>
                        </div>
                        
                        <div id="files">
                            <input type="file" id="imgfile1" name="imgfile1" onchange="preview(this, 1)">
                            <input type="file" id="imgfile2" name="imgfile2" onchange="preview(this, 2)">
                            <input type="file" id="imgfile3" name="imgfile3" onchange="preview(this, 3)">
                            <input type="file" id="imgfile4" name="imgfile4" onchange="preview(this, 4)">
                        </div>
                        </div>
                        <script>
                            // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
                            $(function () {
                                $("#files").hide();

                                $("#thumbnail1").click(function () {
                                    $("#imgfile1").click();
                                });
                                $("#thumbnail2").click(function () {
                                    $("#imgfile2").click();
                                });
                                $("#thumbnail3").click(function () {
                                    $("#imgfile3").click();
                                });
                                $("#thumbnail4").click(function () {
                                    $("#imgfile4").click();
                                });
                            });

                            function preview(value, num) {
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
                                        $("#thumbnail"+num).html("<img src='" + reader.result + "' width='260px' height='230px'>");
                                    }
                                }
                            }
                        </script>
                        <!-- 카페 주소 -->
                        <div class="row" id="divRow">
                            <h3 class="write-title">카페 주소</h3>
                            <div class="col-6">
                                <div class="row">
                                    <p style="color: #CDC2AF;">도로명 주소</p>
                                    <div class="col-8">
                                        <!-- <input type="text" id="text" class="cateTit" id="ad"  name="cafeAddress1"   id="sample5_address" class="postcodify address"/> -->
                                        <input type="text" id="sample5_address" class="cateTit ad" placeholder="주소" name="cafeAddress1" readonly >
                                    </div>
                                    <div class="col-4">
                                        <!-- <input type="button" id="cafeAddBtn" id="postcodify_search_button" onclick="sample5_execDaumPostcode()" value="주소 검색"> -->
                                        <input type="button" onclick="sample5_execDaumPostcode()" id="cafeAddBtn" value="주소 검색">
                                    </div>
                                    <div class="col-10">
                                        <p style="color: #CDC2AF; margin-top: 1%;">상세 주소</p>
                                        <input type="text" id="text" class="cateTit" id="ad"  name="cafeAddress2" placeholder="상세주소"/>
                                    </div>
                                </div>
                            </div>
                            <!-- 위도 -->
							<input type="hidden" id="la" name="caLa">
							<!-- 경도 -->
							<input type="hidden" id="lo" name="caLo">
                            <div class="col-4">
                                <div id="map"></div>
                            </div>
                        </div>
                        
                        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3400cb260ccc2b8ecfb54e177422380a&libraries=services&libraries=services"></script>
						<script>
						    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
						        mapOption = {
						            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
						            level: 5 // 지도의 확대 레벨
						        };
						
						    //지도를 미리 생성
						    var map = new daum.maps.Map(mapContainer, mapOption);
						    //주소-좌표 변환 객체를 생성
						    var geocoder = new daum.maps.services.Geocoder();
						    //마커를 미리 생성
						    var marker = new daum.maps.Marker({
						        position: new daum.maps.LatLng(37.537187, 127.005476),
						        map: map
						    });
						
						
						    function sample5_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                var addr = data.address; // 최종 주소 변수
						
						                // 주소 정보를 해당 필드에 넣는다.
						                document.getElementById("sample5_address").value = addr;
						                // 주소로 상세 정보를 검색
						                geocoder.addressSearch(data.address, function(results, status) {
						                    // 정상적으로 검색이 완료됐으면
						                    if (status === daum.maps.services.Status.OK) {
						
						                        var result = results[0]; //첫번째 결과의 값을 활용
						
						                        // 해당 주소에 대한 좌표를 받아서
						                        var coords = new daum.maps.LatLng(result.y, result.x);
						                     	// 위도 경도 input에 넣기
												var la = result.y;
												var lo = result.x;
												document.getElementById("la").value = la;
												document.getElementById("lo").value = lo;
												console.log(la);
						                        // 지도를 보여준다.
						                        mapContainer.style.display = "block";
						                        map.relayout();
						                        // 지도 중심을 변경한다.
						                        map.setCenter(coords);
						                        // 마커를 결과값으로 받은 위치로 옮긴다.
						                        marker.setPosition(coords)
						                    }
						                });
						            }
						        }).open();
						    }
						</script>
			
                        
                        <!-- 편의사항 -->
                        <div class="row" id="divRow">
                            <div class="col-3">
                                <h3 class="write-title">편의 사항</h3>
                                <!-- 와이파이 -->
                                <div class="row" id="divRow">
                                    <div class="col-2">
                                        <i class="fa fa-wifi" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-8">
                                        <select name="wifi" id="select">
                                        <option selected disabled>와이파이</option>
                                        <option value="와이파이 있음">와이파이 있음</option>
                                        <option value="와이파이 없음">와이파이 없음</option>
                                    </select>
                                    </div>
                                </div>
                                <!-- 화장실 -->
                                <div class="row" id="divRow">
                                    <div class="col-2">
                                        <i class="fa fa-male" aria-hidden="true"></i><i class="fa fa-female" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-8">
                                        <select name="toilet" id="select">
                                        <option selected disabled>화장실</option>
                                        <option value="남/녀 구분 화장실">남/녀 구분 화장실</option>
                                        <option value="공용 화장실">공용 화장실</option>
                                    </select>
                                    </div>
                                </div>
                                <!-- 주차장 -->
                                <div class="row" id="divRow">
                                    <div class="col-2">
                                        <i class="fa fa-car" aria-hidden="true"></i>
                                    </div>
                                    <div class="col-8">
                                        <select name="parking" id="select">
                                        <option selected disabled>주차장</option>
                                        <option value="주차장 있음">주차장 있음</option>
                                        <option value="주차장 없음">주차장 없음</option>
                                    </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-8">
                                <!-- 메세지 -->
                                <h3 class="write-title">메세지</h3>
                                <textarea id="ta" name="message"></textarea>
                                <div id="ta_cnt" style="float: right;">(0 / 100)</div>
                            <script>
                                $(document).ready(function() {
                                    $('#ta').on('keyup', function() {
                                        $('#ta_cnt').html("("+$(this).val().length+" / 100)");
                                
                                        if($(this).val().length > 100) {
                                            $(this).val($(this).val().substring(0, 100));
                                            $('#ta_cnt').html("(0 / 100)");
                                        }
                                    });
                                });
                            </script>
                            </div>
                        </div>
                        <div class="writeBtn">
                            <a class="btn btn-sm animated-button thar-three" id="writeBtn">
                                <i class="fa fa-long-arrow-right" aria-hidden="true"></i> 
                                &nbsp; 
                                <input type="submit" value="음료 입력" class="subBtn"/>
                            </a>
                        </div>
                        
                    </div>
           			</form>
                </div>
                <div>
            
            </div>
        </div>
        <script>
        	/* $(function(){
        		$("#writeBtn").on("click", function(){
        			
        			var form = new FormData(document.getElementById('uploadForm'));
        			
        			
           			$.ajax({
        				url : "${ contextPath }/cafe/biz/insert",
        				data : form,
        				type: "POST",
        				success : function(data){
        					alert("카페 등록이 성공적으로 되었습니다!");
        					location.href='${ contextPath }/bus/coffee';
        				},
        				error : function(e){
        					console.log(e);
        				}
        			});
        		});
        	}); */
        
        </script>
    </div>
    </div>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
    
</body>
</html>