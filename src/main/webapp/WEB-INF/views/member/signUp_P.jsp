<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LaHol - Sign Up</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" type="text/css">
    <link href="${ contextPath }/resources/css/common/reset.css" rel="stylesheet" type="text/css">
    <!-- sweetalert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- kakaoMap -->
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7f32424a29ddd32cc9bc9bd1bac80acc"></script> -->
    <!-- kakaoMap Library -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7f32424a29ddd32cc9bc9bd1bac80acc&libraries=services"></script>
    <style>
        html {
            width: 100%;
            height: 100%;
        }

        body {
            margin: 0 auto;
            padding-bottom: 20px;
            background : #5A452E;
        }

        .contentWrapper {
            margin: 80px auto;
            width: 600px;
            min-height: 1800px;
            border: 3px solid #F3D798;
            border-radius: 10px;
            background : #fff;
        }

        .contentWrapper * {
            font-family: 'NEXON Lv1 Gothic OTF';
        }

        .logoDiv {
            padding: 20px;
            margin: 0 auto;
            text-align: center;
        }

        .logoDiv img {
            width: 20%;
        }
        
        input,
        button {
        	outline : none;
        }

        .titleDiv {
            text-align: center;
            margin : 0 auto 20px;
        }

        .titleDiv > h1 {
            font-size: 20px;
            color : #5A452E;
            font-weight: 400;
            position: relative;
        }

        .titleDiv > h1::before {
            width : 60px;
            height: 1px;
            background: #5A452E;
            position: absolute;
            top: 35px;
            left: 50%;
            margin-left: -30px;
            content: "";
        }

        .joinDiv {
            text-align: center;
        }

        .joinDiv .subTitle {
            text-align: left;
            font-size: 15px;
            font-weight: bold;
            /* color : #fff; */
            margin: 15px 5px 10px;
            /* margin-bottom: 10px; */
        }

        .joinDiv .subTitle2 {
            text-align: left;
            font-size: 15px;
            font-weight: bold;
            /* color : #fff; */
            margin: 15px 15px 10px;
            /* margin-bottom: 10px; */
        }

        #userId,
        #address,
        #cAddress {
            width: 430px;
        }

        #chkDuplicate,
        .searchAddress {
            width: 130px;
            height: 50px;
            vertical-align: middle;
            cursor: pointer;
            background: #4B654A;
            border: 1px solid #4B654A;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .joinDiv input {
            box-sizing: border-box;
            width: 572px;
            height: 50px;
            margin: 0 5px;
            vertical-align: middle;
            border: 1px solid #e7e7e7;
            transition: border 0.3s;
            cursor: pointer;

            padding: 10px;
            outline: none;
        }

        .joinDiv input:focus {
            border: 1px solid #5A452E;
        }

        .idDiv {
            margin: 0 auto 10px;
        }

        .chkSpan {
            float: left;
            margin-top: 5px;
            margin-left: 30px;
            font-size: 11px;
        }

        .plusInfoDiv {
            margin : 50px auto 10px;
        }

        .plusInfoDiv .birth,
        .partnerInfo-body .birth {
            width: 183px;
            height: 50px;
            vertical-align: middle;
            border: 1px solid #e7e7e7;
            transition: border 0.3s;
            cursor: pointer;

            outline: none;
        }

        .partnerInfo-body {
            margin-bottom: 10px;
        }

        #cNumber2 {
            margin : 0;
        }

        #submitBtn {
            width: 572px;
            height: 50px;
            background: #4B654A;
            border: 1px solid #4B654A;
            font-size: 16px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        #submitBtn:hover,
        #chkDuplicate:hover,
        .searchAddress:hover {
            background-color: #344633;
            border-color: #344633;
        }

        .partnerInfo-head {
            width: 100%;
            display: flex;
            margin : 9px;
        }

        .partnerInfo-head .p_title {
            display: flex;
            width : 142px;
            justify-content: center;
        }

        .partnerInfo-head .p_title h3 {
            margin: auto;
            color : #5A452E;
            font-weight: bold;
        }

        .partnerInfo-head .p_line {
            margin : 23px 5px;
            height: 2px;
            background : #5A452E;
            background-clip: padding-box;
            width : 210px;
        }
        
        .swal2-confirm,
        .swal2-cancel,
        .swal2-html-container,
        .swal2-title {
        	font-family: 'NEXON Lv1 Gothic OTF';
        }

    </style>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			Swal.fire('${msg}');
		</script>
		<c:remove var="msg"/>
	</c:if>
    <div class="contentWrapper">
        <div class="logoDiv">
            <a href="${ contextPath }"><img src="${ contextPath }/resources/img/common/logo-lahol2.png"></a>   <!-- 메인 화면으로 이동 연결 -->
        </div>
        <div class="titleDiv">
            <h1><b>LaHol</b> SIGN UP</h1>
        </div>
        <form id="joinForm" method="POST" action="${ contextPath }/member/psignUp">
            <div class="joinDiv">
            <input type="hidden" id="c_la" name="c_la">
            <input type="hidden" id="c_lo" name="c_lo">
                <div class="idDiv">
                    <h3 class="subTitle2">아이디</h3>
                    <input type="text" id="userId" name="id" maxlength="12" placeholder="아이디를 입력하세요">
                    <button type="button" id="chkDuplicate">중복확인</button><br>
                    <span class="chkSpan" id="chkId">※ 영소문자/숫자 6~12자리(특수문자 불가)</span>
                </div>
                <br clear="both">
                <div class="pwdDiv">
                    <h3 class="subTitle2">비밀번호</h3>
                    <input type="password" id="userPwd" name="pwd" placeholder="비밀번호를 입력하세요">
                    <h3 class="subTitle2">비밀번호 확인</h3>
                    <input type="password" id="userPwd2" name="pwd2" placeholder="비밀번호를 한번 더 입력하세요"><br>
                    <span class="chkSpan" id="chkPwd">※ 영대소문자/숫자/특수문자 포함 8자리 이상</span>
                </div>
                <div class="plusInfoDiv">
                    <h3 class="subTitle2">이름</h3>
                    <input type="text" id="userName" name="name" placeholder="이름을 입력하세요">
                    <h3 class="subTitle2">생년월일</h3>
                    <input type="text" class="birth" id="birthYear" name="birthYear" maxlength="4" placeholder="년(4자리)">
                    <select id="selectMonth" class="birth" name="birthMonth">
                        <option value="" selected>월</option>
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    <input type="text" class="birth" id="birthday" name="birthday" maxlength="2" placeholder="일">
                    <h3 class="subTitle2">이메일</h3>
                    <input type="email" id="email" name="email" placeholder="이메일을 입력하세요">
                    <h3 class="subTitle2">핸드폰</h3>
                    <input type="tel" id="phone" name="phone" maxlength="11" placeholder="핸드폰 번호(-제외)를 입력하세요">

                    <h3 class="subTitle2">우편번호</h3>
                    <input type="text" id="address" name="address" class="postcodify_postcode5" placeholder="우편번호 검색" readonly>
                    <button type="button" id="postcodify_search_button" class="searchAddress">검색</button><br>
                    <h3 class="subTitle2">도로명주소</h3>
                    <input type="text" id="address1" name="address1" class="postcodify_address" placeholder="우편번호 검색" readonly>
                    <h3 class="subTitle2">상세주소</h3>
                    <input type="text" name="address2" class="postcodify_details" placeholder="상세주소를 입력하세요">
                </div>
                <br>
                <!-- 사업자 소재지(카페) 입력 -->
                <div class="partnerInfo-head">
                    <div class="p_line"></div>
                    <div class="p_title">
                        <h3>카페</h3>
                    </div>
                    <div class="p_line"></div>
                </div>
                <div class="partnerInfo-body">
                    <h3 class="subTitle2">카페명(상호명)</h3>
                    <input type="text" id="cName" name="c_name" placeholder="카페명을 입력하세요">
                    <h3 class="subTitle2">사업자명</h3>
                    <input type="text" id="cOwner" name="c_owner" placeholder="사업자명을 입력하세요">
                    <h3 class="subTitle2">사업자 등록 번호</h3>
                    <input type="text" class="birth" id="cNumber1" name="cNumber1" maxlength="3">
                    <input type="text" class="birth" id="cNumber2" name="cNumber2" maxlength="2">
                    <input type="text" class="birth" id="cNumber3" name="cNumber3" maxlength="5">

                    <h3 class="subTitle2">우편번호</h3>
                    <input type="text" id="cAddress" name="cAddress" class="postcodify_postcode5" placeholder="우편번호 검색" readonly>
                    <button type="button" id="postcodify_search_button2" class="searchAddress">검색</button><br>
                    <h3 class="subTitle2">도로명주소</h3>
                    <input type="text" id="cAddress1" name="cAddress1" class="postcodify_address" placeholder="우편번호 검색" readonly>
                    <h3 class="subTitle2">상세주소</h3>
                    <input type="text" id="cAddress2" name="cAddress2" class="postcodify_details" placeholder="상세주소를 입력하세요">
                </div>
                <button type="button" id="submitBtn" onclick="onSubmit();">회원 가입</button>
            </div>
        </form>
    </div>
    <!-- jQuery와 Postcodify를 로딩한다 -->
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

    <!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
    <script>
    	$(function() { 
    		$("#postcodify_search_button").postcodifyPopUp({
    			container : ".plusInfoDiv"
    		});
    		$("#address").click(function(){
    			$("#postcodify_search_button").trigger('click');
    		});
    		$("#address1").click(function(){
    			$("#postcodify_search_button").trigger('click');
    		});
    	});
    </script>
    <script>
        $(function() {
            $("#postcodify_search_button2").postcodifyPopUp({
                container : ".partnerInfo-body"
            });
            $("#cAddress").click(function(){
    			$("#postcodify_search_button2").trigger('click');
    		});
    		$("#cAddress1").click(function(){
    			$("#postcodify_search_button2").trigger('click');
    		});
        });
    </script>
    <script>
	 // 위도(y, la), 경도(x, lo) 값 저장
	 	$(".joinDiv").on('mouseover', function(){
	 		if($("#cAddress1").val() != "") {
				var geocoder = new kakao.maps.services.Geocoder();
			  	var cAddress1 = document.getElementById("cAddress1").value;
			  	geocoder.addressSearch(cAddress1, function(result, status) {
			  		if(status == kakao.maps.services.Status.OK) {
			  			$("#c_la").val(result[0].y);
			  			$("#c_lo").val(result[0].x);
			  		}
			  	});
	 		}
	 	});
    </script>
    <script>
    	var isUsable = false;
    	$(function(){
   			var chkId = document.getElementById("chkId");
    		$("#chkDuplicate").on('click', function(){
    			var userId = document.getElementById("userId");
    			if (userId.value == "") {
    				Swal.fire({
    					title : '아이디를 입력해주세요.',
    					icon : 'warning'
    				});
                    userId.focus();
                    return;
                }
    			
    			if(!chk(/^[a-z][a-z\d]{5,11}$/, userId, "아이디를 다시 입력해주세요.")) {
    				chkId.innerHTML = "아이디 입력이 잘못 되었습니다.(영소문자/숫자 6~12자리, 특수문자 사용 불가)";
                    chkId.style.color = "red";
                    userId.focus();
                } else {
                	$.ajax({
                		url : "idCheck",
                		type : "post",
                		data : {userId : userId.value},
                		success : function(data) {
                			if(data == "fail") {
                				Swal.fire({
                					title : '사용할 수 없는 아이디 입니다.',
                					icon : 'warning'
                				});
                				chkId.innerHTML = "사용할 수 없는 아이디 입니다.";
                				chkId.style.color = "red";
                				userId.focus();
                			} else {
                				Swal.fire({
                					title : '사용 가능한 아이디 입니다.',
                					text : "사용 하시겠습니까?",
                					icon : 'warning',
                					showCancelButton : true,
                					confirmButtonColor : '#4B654A',
                					cancelButtonColor : '#d33',
                					confirmButtonText : '사용',
                					cancelButtonText : '취소'
                				}).then(function(result) {
                					if(result.isConfirmed) {
                						Swal.fire({
                							title : '아이디를 사용합니다.',
                							icon : 'success'
                						})
                						userId.setAttribute('readonly', true);
                						chkId.innerHTML = "사용 가능한 아이디 입니다.";
                						chkId.style.color = "green";
                						isUsable = true;
                					} else {
                						userId.removeAttribute('readonly');
                						isUsable = false;
                						userId.focus();
                					}
                				});
                			}
                		},
                		error : function(e) {
                			console.log(e);
                		}
                	});
                }
    		});
    	});
    	
        function onKeyDown() {
            if (event.keyCode == 13) {
                event.preventDefault();
                onSubmit();
            }
        }

        var userId = document.getElementById("userId");
        var chkId = document.getElementById("chkId");
        var userPwd = document.getElementById("userPwd");
        var userPwd2 = document.getElementById("userPwd2");
        var chkPwd = document.getElementById("chkPwd");
        var userName = document.getElementById("userName");
        var birthYear = document.getElementById("birthYear");
        var birthday = document.getElementById("birthday");
        var c_name = document.getElementById("cName");
        var c_owner = document.getElementById("cOwner");
        var cNumber1 = document.getElementById("cNumber1");
        var cNumber2 = document.getElementById("cNumber2");
        var cNumber3 = document.getElementById("cNumber3");
        
        function onSubmit() {

  	    	// 유효성 검사 시작
        	if (userId.value == "") {
            	Swal.fire({
					title : '아이디를 입력해주세요.',
					icon : 'warning'
				});
                userId.focus();
                return;
            }
            
            if(!isUsable) {
            	Swal.fire({
					title : '아이디를 중복확인을 해주세요!',
					icon : 'warning'
				});
                userId.focus();
                return;
            }

            if (userPwd.value == "") {
            	Swal.fire({
					title : '비밀번호를 입력해주세요.',
					icon : 'warning'
				});
                userPwd.focus();
                return;
            }

            if (userPwd2.value == "") {
            	Swal.fire({
					title : '비밀번호 확인란을 입력해주세요.',
					icon : 'warning'
				});
                userPwd2.focus();
                return;
            }

            if (userName.value == "") {
            	Swal.fire({
					title : '이름을 입력해주세요.',
					icon : 'warning'
				});
                userName.focus();
                return;
            }

            if(birthday.value > 31 || birthday.value < 1) {
            	Swal.fire({
					title : '생년월일을 다시 입력해주세요.',
					icon : 'warning'
				});
                birthday.value = "";
                birthday.focus();
                return;
            }
            
            if (c_name.value == "") {
            	Swal.fire({
					title : '카페명을 입력해주세요.',
					icon : 'warning'
				});
                c_name.focus();
                return;
            }
            
            if (c_owner.value == "") {
            	Swal.fire({
					title : '사업자명을 입력해주세요.',
					icon : 'warning'
				});
                c_owner.focus();
                return;
            }
            
            if (cNumber1.value == "") {
            	Swal.fire({
					title : '사업자번호를 입력해주세요.',
					icon : 'warning'
				});
            	cNumber1.focus();
                return;
            }
            
            if (cNumber2.value == "") {
            	Swal.fire({
					title : '사업자번호를 입력해주세요.',
					icon : 'warning'
				});
            	cNumber2.focus();
                return;
            }
            
            if (cNumber3.value == "") {
            	Swal.fire({
					title : '사업자번호를 입력해주세요.',
					icon : 'warning'
				});
            	cNumber3.focus();
                return;
            }
            
            if($("#address").val() == "") {
            	Swal.fire({
					title : '주소를 입력해주세요.',
					icon : 'warning'
				});
                return;
            }
            
            if($("#cAddress").val() == "") {
            	Swal.fire({
					title : '카페 주소를 입력해주세요.',
					icon : 'warning'
				});
                return;
            }

            if(!chk(/^[a-z][a-z\d]{5,11}$/, userId, "아이디를 다시 입력해주세요.")) { // 영소문자 시작, 6~12자리
                chkId.innerHTML = "아이디 입력이 잘못 되었습니다.(영소문자/숫자 6~12자리, 특수문자 사용 불가)";
                chkId.style.color = "red";
                return;
            }

            if(!chk(/(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$/, userPwd, "비밀번호를 다시 입력해주세요.")) { // 특수문자,숫자,영대소문자 포함 8자 이상
                return;
            }

            if(!chk(/^[가-힣]{2,}$/, userName, "이름을 한글로 두글자 이상 입력해주세요.")) {
                return;
            }

            if(!chk(/^[1-2][0-9]{3}$/, birthYear, "생년월일을 다시 입력해주세요.")) {
                return;
            }

            if(document.getElementById("selectMonth").value == "") {
                alert("월을 선택해주세요.");
                return;
            }

            if(!chk(/^[0-9]{1,}$/, birthday, "생년월일을 다시 입력해주세요.")) {
                return;
            }
            
            if(!chk(/^[가-힣]{2,}$/, c_owner, "사업자명을 한글로 두글자 이상 입력해주세요.")) {
                return;
            }

            $("#joinForm").submit();
        }

        // 정규 표현식, 검사할 함수
        function chk(reg, e, msg) {

            if (reg.test(e.value)) {
                return true;
            }
            Swal.fire({
				title : msg,
				icon : 'warning'
			});
            e.value = "";
            e.focus();
            return false;
        }

        userPwd2.addEventListener('keyup', function(){
            if(userPwd.value === userPwd2.value){
                chkPwd.innerHTML = "비밀번호가 일치합니다!";
                chkPwd.style.color = "green";
            } else {
                chkPwd.innerHTML = "비밀번호가 일치하지 않습니다.";
                chkPwd.style.color = "red";
            }
        });
    </script>
</body>
</html>