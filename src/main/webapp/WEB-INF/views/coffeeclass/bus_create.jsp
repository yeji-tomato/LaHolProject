<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CreateClass</title>  
<!-- css연결 -->
<link rel="stylesheet"
	href="${ contextPath }/resources/css/coffeeclass/editclass.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" 
	crossorigin="anonymous">
<!--부트스트랩 css-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<!--부트스트랩 js-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<!--아이콘-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

</head>
<body>
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />


	<!-- Form -->
	<div class="banner">
		<h1 style="padding-top: 18vh;">라홀의 가족이 되시는 것을 환영합니다</h1>
	</div>
	<div>

		<!--입력란-->
		<div id="tbColor" style="margin:0; background-color:#f0d7af;">
		

			<div id="createform" style="" >
				<div class="content-header">
					<h2 class="intro" style="padding-top : 5vh;">라홀 예비 클래스 강사님, 안녕하세요 !</h2>
					<p class="intro" id="intro-sub" style="text-align: center;">
			                    고객님들이 수강하기 전 고민과 걱정을 덜어들이기 위해 다양한 정보 기입을 부탁드리고 있습니다. <br>
			                    질문지를 빠짐없이 입력해주세요. 작성된 폼은 ‘등록예정 클래스'에 등록되지만 정식 승인은 1-2일이 소요됩니다. 
                	</p>
				</div>
				<form action = "${ contextPath }/coffeeclass/createclass/insert" id="wrtieForm" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${ sessionScope.loginUser.id }" name="clWriter">
				<table id="clTable" style="white;">
					<tr id="clTr">
						<td>클래스명</td>
						<td class="answer"><input type="text" class="classdes" name="className" maxlength="30" placeholder="글자 수 30자 제한" required></td>
					</tr>
					<tr>
						<td>사업자번호</td>
						<td class="answer"><input type="text" class="classdes" name = "busNo" maxlength="10" placeholder="-없이 10자리 입력해주세요" required></td>						
					</tr>
					<tr>
						<td>강사명(사업자명)</td>
						<td class="answer"><input type="text" class="classdes" name="trName" required></td>
					</tr>
					<tr>
						<td>강사사진</td>
						<td class="answer"><input type="file" class="classdes" name = "imgfile1" required>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><p style="font-size: 11px; float: left;">*얼굴 공개를 원하시지
								않을 경우 일반클래스 사진 올려주시면 됩니다.</p></td>
					</tr>
					<tr>
						<td>강사소개</td>
						<td class="answer"><textarea style="height: 200px; resize: none;"
							class="classdes" name="trIntro"></textarea></td>
					</tr>

					<tr>
						<td>주최카페</td>
						<td class="answer" style="text-align: left;">
						<input type="text" id="linkedcafe" value="${ mycafe.caName }" name="cafeName" readonly>
						<input type="hidden" id="linkedcafeNo" value="${ mycafe.caCode }" name="cafeNo">
						</td>
					</tr>
					
					<tr>
						<td>카테고리</td>
						<td class="answer" style="text-align: left;">
						<select name="category" style="width : 380px;" id="cate" required>
							 <option selected disabled="disabled">클래스 카테고리 선택</option>
							 <option value="coffee">로스팅/원두</option>
				             <option value="art">라테아트/디자인</option>
				             <option value="dessert">디저트</option>
				             <option value="certi">자격증</option>
				             <option value="etc">기타</option>
						</select></td>
					</tr>


					<tr>
						<td>클래스 한 줄 소개</td>
						<td class="answer"><input type="text" class="classdes" name="clShortDes" required></td>
					</tr>

					<tr>
						<td>클래스 상세 소개</td>
						<td class="answer"><textarea
							style="height: 200px; resize: none;" class="classdes" name="classDes" id="classDes" required></textarea></td>
					</tr>

					<tr>
						<td>클래스 커리큘럼</td>
						<td class="answer"><textarea style="height: 200px; resize: none;"
							class="classdes" name="classCurri" placeholder="예시 : 세션1(20분) : 커피와 함께하는 커피의 역사  &#13;&#10; -휴식10분- &#13;&#10; 세션2(1시간): 현대 커피브랜드의 가치" required></textarea></td>
					</tr>

					<tr>
						<td>클래스 대표 이미지</td>
						<td class="answer"><input type="file" class="classdes" name="imgfile2"></td>
					</tr>
					<tr>
						<td>클래스 기타이미지</td>
						<td class="answer"><input type="file" class="classdes" name="imgfile3"></td>
					</tr>
					
					
					<tr>
						
						<td>강의 날짜</td>
						<td class="answer" style="text-align: left;">
						<input type="date" class="classdate end classdes" name="classDate" style="width : 380px;" required></td>
					</tr>
					
					<tr>
						<td>강의 시간</td>
						<td class="answer">
						<input type="text" placeholder="하루 최대 3타임 운영가능" class="classdes" name="classTime" required> 
						<input type="text" placeholder="예시 ) 10:00 - 12:00" class="classdes" name="classTime2">
						<input type="text" placeholder="예시 ) 19:00 - 21:00" class="classdes" name="classTime3">
						</td>
					</tr>
					
					<!-- 커피클래스 주소 / 카카오맵 API -->
					<tr>
					<td>강의 장소</td>
					<td>
			    	<input type="text" id="sample5_address" name="classLoca1" placeholder="주소" style="width : 594px;" readonly>
					<input type="button" id="mapbtn" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
					</td>
					</tr>
					
					<tr>
					<td></td>
					<td>
					<input type="text" class="classdes" name="classLoca2" placeholder="상세주소">
					<div style="width:680px;height:300px; margin : 5px;">
					<div id="map" style="width:680px;height:300px;display:none"></div>
					<p style="padding-top : 130px;">지도 미리보기 KAKAOMAP</p>
					</div>
					</td>
					</tr>
					
					
					<tr>
						<td>수강생 정원</td>
						<td class="answer"><input type="number" min="1" max="4" name="studentMax"
							class="classdes" placeholder="거리두기 방침으로 인해 최대인원이 4명으로 제한됩니다"></td>
					</tr>

					<tr>
						<td>희망 수강료</td>
						<td class="answer"><input type="text" class="classdes" name="clPrice" required></td>
						<td>원</td>
					</tr>

					<tr>
						<td>수업 난이도</td>
						<td class="answer" style="text-align: left;" class="classdes">
						<select name="classLvl" style="width : 380px;" class="classdes" required>
								<option>난이도 선택</option>
								<option value = "상">상</option>
								<option value = "중">중</option>
								<option value = "하">하</option>
						</select></td>
					</tr>

					<tr>
						<td>소요시간</td>
						<td class="answer"><input type="text"
							placeholder="분 단위로 입력해주세요" class="classdes" name="clRuntime" required></td>
						<td>분</td>
				</table>
				
					<div class="btnarea">
						<button type="submit" class="submit btn" id="register" style="margin-bottom : 30px;"
						>승인요청</button>
						&nbsp;
						<button type="button" class="btn" id="cancel" style="margin-bottom : 30px;"
							onclick="history.back()">등록취소</button>
					</div>
				</form>
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
			

		</div>
	</div>
	
	
	
	 <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
	
	<!-- script -->
	<!-- 텍스트에리아 입력 줄바꿈 적용 -->
	<script>$('#classDes').val().replace(/\n/g, "<br>")</script>

	
	
	
</body>
</html>