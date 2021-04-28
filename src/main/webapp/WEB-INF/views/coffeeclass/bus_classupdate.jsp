<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>  
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FixClassInfo</title>
    <link rel="stylesheet"
	href="${ contextPath }/resources/css/coffeeclass/editclass.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <!--부트스트랩 css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <!--부트스트랩 js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <!--아이콘-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
</head>
<body>

   	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
    <div class="banner">
        <h1 style="padding-top: 18vh;">클래스 수정 페이지</h1>
    </div>
    <div>
        
        <!--입력란-->
		<div id="tbColor" style="margin:0; background-color:#f0d7af;">

			<div id="updateform" style="" >
				<div class="content-header">
                </pre>
				</div>
				<form action = "${ contextPath }/coffeeclass/updateclass/update" id="wrtieForm" method="post" enctype="multipart/form-data">
				<table id="clTable" style="white;">
					<!-- classNo hidden으로 가지고 가기 -->
					<input type="hidden" name="classNo" value="${coffeeclass.classNo}"/> 
				
					<tr id="clTr">
						<td>클래스명</td>
						<td class="answer"><input type="text" class="classdes" name="className" value ="${ coffeeclass.className }" required></td>
					</tr>
					<tr>
						<td>사업자번호</td>
						<td class="answer"><input type="text" class="classdes" name = "busNo" value = "${ coffeeclass.busNo }" required></td>
					</tr>
					<tr>
						<td>강사명</td>
						<td class="answer"><input type="text" class="classdes" name="trName" value = "${ coffeeclass.trName }" required></td>
					</tr>
					<tr>
						<td>강사사진</td>
						<td class="answer"><input type="file" class="classdes" name="imgfile1" value = "${ coffeeclass.trPhoto }"required>
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
							class="classdes" name="trIntro">${ coffeeclass.trIntro }</textarea></td>
					</tr>
					<tr>
						<td>주최카페</td>
						<td class="answer">
								<input type="text" id="linkedcafe" value="${ mycafe.caName }" readonly>
						</td>
					</tr>

					<tr>
						<td>클래스 한 줄 소개</td>
						<td class="answer"><input type="text" class="classdes" name="clShortDes" value="${ coffeeclass.clShortDes }"></td>
					</tr>

					<tr>
						<td>클래스 상세 소개</td>
						<td class="answer"><input type="textarea"
							style="line-height: 200px;" class="classdes" name="classDes" value="${ coffeeclass.classDes }"></td>
					</tr>

					<tr>
						<td>클래스 커리큘럼</td>
						<td class="answer"><input type="textarea" style="height: 200px;"
							class="classdes" name="classCurri" value="${ coffeeclass.classCurri }"></td>
					</tr>

					<tr>
					<tr>
						<td>클래스 대표 이미지</td>
						<td class="answer"><input type="file" class="classdes" name="imgfile2" value="${ coffeeclass.clThumbnail }"></td>
					</tr>
					<tr>
						<td>클래스 기타이미지</td>
						<td class="answer"><input type="file" class="classdes" name="imgfile3" value="${ coffeeclass.clPhoto }"></td>
					</tr>


					<tr>
						<td>강의 날짜</td>
						<td class="answer" style="text-align: left;"><input
							type="date" class="classdate end classdes" name="classDate" value="${ coffeeclass.classDate }"></td>
					</tr>
					<tr>
					<td>강의 시간</td>
						<td class="answer">
						<input type="text" placeholder="하루 최대 3타임 운영가능" class="classdes" name="classTime" value = "${ coffeeclass.classTime }"> 
						<input type="text" placeholder="예시 ) 10:00 - 12:00" class="classdes" name="classTime2" value = "${ coffeeclass.classTime2 }">
						<input type="text" placeholder="예시 ) 19:00 - 21:00" class="classdes" name="classTime3" value = "${ coffeeclass.classTime3 }">
						</td>
					</tr>
			        <tr>    
			            <tr>
			            <td>강의장소</td>
			            </tr>
			            <tr  class="address">
			                <td>주소</td>
			                <td><input type="text" class="classdes" name="classLoca1" value = "${ clAddresses[0] }"></td> 			           
			            </tr>
			            <tr  class="address">
			                <td>상세주소</td>
			                <td><input type="text" class="classdes" name="classLoca2" value = "${ clAddresses[1] }"></td> 
			            </tr>
			        </tr>  
					

					<!-- <tr>
            <h4>우편번호</h4>
            <td class = "answer"><input type="text" class = "classdes">
			<span class="input_area">
			<input type="text" name="post" class="postcodify_postcode5" id="postcode" readonly>
			</span>
			&nbsp; <button id="postcodify_search_button" type="button">검색</button>
			<h4>도로명주소</h4>
			<span class="input_area">
			<input type="text" name="address1" class="postcodify_address" readonly>
			</span>
			<h4>상세주소</h4>
			<span class="input_area">
			<input type="text" name="address2" class="postcodify_details">
			</span>
            </tr> -->

					<tr>
						<td>수강생 정원</td>
						<td class="answer">
						<input type="number" min="1" max="4" name="studentMax" class="classdes" value="${ coffeeclass.studentMax }">
						</td>
					</tr>

					<tr>
						<td>희망 수강료</td>
						<td class="answer"><input type="text" class="classdes" name="clPrice" value="${ coffeeclass.clPrice }"></td>
						<td>원</td>
					</tr>

					<tr>
						<td>수업 난이도</td>
						<td class="answer" style="text-align: left;">
						<select name="classLvl">
								<option>난이도 선택</option>
								<option value = "상" <c:if test="${ coffeeclass.classLvl eq '상' }"> selected </c:if>> 상</option>
								<option value = "중" <c:if test="${ coffeeclass.classLvl eq '중' }"> selected </c:if>> 중</option>
								<option value = "하" <c:if test="${ coffeeclass.classLvl eq '하' }"> selected </c:if>> 하</option>
						</select></td>
					</tr>

					<tr>
						<td>소요시간</td>
						<td class="answer"><input type="text" class="classdes" name="clRuntime" value="${ coffeeclass.clRuntime }"></td>
						<td>분</td>
					</tr>
					<tr>
						<td>클래스 개설자ID</td>
							<td class="answer" > 
								<!-- 밸류 바꾸기 : value = "${ loginUser.id }"   -->
								<input type="text" class="classdes" name="clWriter" value="partner02" value = "${ coffeeclass.clWriter }" style="border: 0px; background-color:transparent;" readonly></td> 
					</tr>
				</table>				
			<div id="files">
				<input type="hidden" name="imgfile1" value="${ coffeeclass.clThumbnail }">
                <input type="hidden" name="imgfile2" value="${ coffeeclass.trPhoto }">
                <input type="hidden" name="imgfile3" value="${ coffeeclass.clPhoto }">
			</div>
			
			<div class="btnarea">
				<button type="submit" class="btn" id="register">수정하기</button>
				&nbsp;
				<button type="button" class="btn" id="cancel" onclick="history.back()">등록취소</button>
			</div>
				</form>
			</div>


		</div>
	</div>

	<script>
		
	</script>

	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>

	<!--주소 API-->
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>
	</script>

<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>