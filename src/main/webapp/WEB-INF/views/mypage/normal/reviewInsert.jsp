<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 등록</title>
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/reset.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <style>
        body {
            width : 500px;
            height: 600px;
            border : 1px solid #4B654A;
        }

        .review-title {
            width : 100%;
            display : flex;

            background: #4B654A;
        }

        .review-title-logo {
            width : 50%;
            height: 50px;
            display: flex;
            align-items: center;
        }

        .review-title-logo img {
            width : auto;
            height: 80%;
            margin-left: 15px;
        }

        .review-title .title-text {
            font-family: 'NEXON Lv1 Gothic OTF';
            margin-left: 10px;
            color : #fff;
        }

        .review-right-text {
            width : 50%;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-right: 20px;
        }

        .review-content {
            width : 100%;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .content-div {
            width: 100%;
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            margin : 20px;
            margin-left: 0px;
            margin-bottom: 5px;

            font-family: 'NEXON Lv1 Gothic OTF';
        }

        .content-text-div {
            justify-content: center;
        }

        .content-upload-img {
            flex-direction: column;
        }

        .content-subTitle {
            font-family: 'NEXON Lv1 Gothic OTF';
            font-size: 1.2em;
        }

        .content-upload-img .upload-div {
            width : 100%;
            text-align: center;
        }

        .content-upload-img .upload-div label {
            display: inline-block;
            cursor: pointer;
            margin : 10px;
            width : 100px;
            height : 30px;
            line-height: 30px;
            text-align: center;

            background : #4B654A;
            color : #fff;
        }

        .content-upload-img input[type="file"] {
            position : absolute;
            width : 1px;
            height: 1px;
            padding : 0;
            margin : -1px;
            overflow: hidden;
            border : 0;
            clip:rect(0,0,0,0);
        }

        .content-upload-img input[type="text"] {
            width : 200px;
            height: 30px;
            padding : 0;
            margin : 0;
            border : 1px solid #e7e7e7;
        }

        input[type="text"]:disabled {
            background: none;
        }

        .content-star {
            flex-direction: column;
        }

        .content-star .star-box {
            margin: auto;
        }

        .star{
            display:inline-block;
            width: 20px;height: 40px;
            cursor: pointer;
        }
        .star_left{
            background: url(${contextPath}/resources/img/mypage/star.png) no-repeat 0 0; 
            background-size: 40px; 
            margin-right: -3px;
        }
        .star_right{
            background: url(${contextPath}/resources/img/mypage/star.png) no-repeat -20px 0; 
            background-size: 40px; 
            margin-left: -3px;
        }
        .star.on{
            background-image: url(${contextPath}/resources/img/mypage/star-on.png);
        }

        .review-text {
            flex-direction: column;
        }

        #review-text {
            margin : 10px auto;
            width : 400px;
            height: 150px;

            outline: none;
            border: 1px solid #e7e7e7;

            transition: border 0.3s;
        }

        #review-text:focus {
            border : 1px solid #4B654A;
        }

        .btn-div {
            justify-content: center;
        }

        .btn-div .review-btn {
            width : 100px;
            height: 30px;
            margin : 5px;

            border: none;
            outline: none;
            background : #4B654A;
            color : #fff;

            font-family: 'NEXON Lv1 Gothic OTF';

            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-div .review-btn:last-child {
            background: #e7e7e7;
            color : #000000;
        }

        .btn-div .review-btn:hover {
            background: #7a917a;
        }
        
        .swal2-confirm,
        .swal2-cancel,
        .swal2-html-container,
        .swal2-title {
        	font-family: 'NEXON Lv1 Gothic OTF';
        }

    </style>
</head>
<body onbeforeunload="refreshAndClose();">
	<c:if test="${ !empty msg }">
		<script>
			Swal.fire({
				title : '${msg}',
				icon : 'success'
			}).then(function(){
				window.close();
			});
		</script>
		<c:remove var="msg"/>
	</c:if>
    <div class="review-title">
        <div class="review-title-logo">
            <img src="${ contextPath }/resources/img/common/logo-lahol2.png">
            <p class="title-text">LaHol</p>
        </div>
        <div class="review-right-text">
            <p class="title-text" id="right-text">후기 등록</p>
        </div>
    </div>
    <div class="review-content">
        <div class="content-text-div content-div">
            <p class="content-text">사용한 카페 / 클래스 / 제품 / 스토어에 대해</p>
            <p class="content-text">자유롭게 후기를 작성해 주세요.</p>
        </div>
        <form id="review_form" action="${ contextPath }/nMypage/reviewResister" method="POST" enctype="multipart/form-data">
            <div class="content-upload-img content-div">
                <p class="content-subTitle">사진 리뷰</p>
                <div class="upload-div">
                    <label for="review-img">사진 업로드</label>
                    <input type="text" id="upload-name" disabled>
                    <input type="file" id="review-img" name="review-img">
                    <input type="hidden" name="category" value="${ review.category }">
                    <input type="hidden" name="id" value="${ review.id }">
                    <input type="hidden" name="cl_pay_no" value="${ review.cl_pay_no }">
                    <input type="hidden" name="class_no" value="${ review.class_no }">
                    <input type="hidden" name="c_code" value="${ review.c_code }">
                    <input type="hidden" name="c_res" value="${ review.c_res }">
                    <input type="hidden" name="subscribe_code" value="${ review.subscribe_code }">
                    <input type="hidden" name="purchase_number" value="${ review.purchase_number }">
                    <input type="hidden" id="star_grade" name="star_grade">
                </div>
            </div>
            <div class="content-star content-div">
                <p class="content-subTitle">별점</p>
                <div class="star-box">
                    <span class="star star_left"></span>
                    <span class="star star_right"></span>
                
                    <span class="star star_left"></span>
                    <span class="star star_right"></span>
                
                    <span class="star star_left"></span>
                    <span class="star star_right"></span>
                
	                <span class="star star_left"></span>
	                <span class="star star_right"></span>
	                
	                <span class="star star_left"></span>
	                <span class="star star_right"></span>
                </div>
            </div>
            <div class="review-text content-div">
                <p class="content-subTitle">후기 <span id="counter">0</span>/250</p>
                <textarea id="review-text" name="content" style="resize: none;" placeholder="5자 이상 250자 이내로 작성하세요."></textarea>
            </div>
            <div class="btn-div content-div">
                <input type="button" class="review-btn" value="등록" onclick="onSubmit();">
                <input type="button" class="review-btn" value="취소" onclick="window.close();">
            </div>
        </form>
    </div>
    <script>
        $(".star").on('click',function(){
            var idx = $(this).index();
            
            $(".star").removeClass("on");
            
            for(var i=0; i<=idx; i++){
                    $(".star").eq(i).addClass("on");
            }
            var star = document.getElementsByClassName("on");
            $("#star_grade").val(star.length/2);
        });
        
        function refreshAndClose(){
       		window.opener.location.reload();
       		window.close();
        }
        
        $("#review-text").on('keyup', function(){
        	var inputLength = $(this).val().length;
        	$("#counter").html(inputLength);
        	
        	var remain = 250 - inputLength;
        	
        	if(remain >= 0) {
        		$("#counter").css("color", "black");
        	} else {
        		$("#counter").css("color", "red");
        	}
   		});
        
        $(function(){
	        $("[type=file]").change(function(){
	            loadImg(this);
	        });
	
	        function loadImg(element) {
	            if(element.files && element.files[0]) {
	                $("#upload-name").val(element.files[0].name);
	            }
	        }
	    });
        
        function onSubmit() {
        	var reviewImg = document.getElementById("review-img");
        	var star = document.getElementsByClassName("on");
        	var content = document.getElementById("review-text");
        	
        	if(star.length == 0) {
        		Swal.fire({
    				title : "별점을 선택해주세요.",
    				icon : 'warning'
    			});
        		return;
        	}
        	
        	if(content.value.length < 5) {
        		Swal.fire({
    				title : "후기를 5자 이상 작성해주세요.",
    				icon : 'warning'
    			});
        		content.focus();
        		return;
        	}
        	
        	if(content.value.length >= 250) {
        		Swal.fire({
    				title : "후기를 250자 이내로 작성해주세요.",
    				icon : 'warning'
    			});
        		content.focus();
        		return;
        	}
        	
        	if(!(reviewImg.files && reviewImg.files[0])) {
        		Swal.fire({
					title : '업로드 된 이미지가 없습니다.',
					text : "이미지 없이 등록 하시겠습니까?",
					icon : 'warning',
					showCancelButton : true,
					confirmButtonColor : '#4B654A',
					cancelButtonColor : '#d33',
					confirmButtonText : '등록',
					cancelButtonText : '취소'
				}).then(function(result) {
					if(result.isConfirmed) {
						$("#review_form").submit();
					} else {
						return;
					}
				});
        	}
        	
        	$("#review_form").submit();
        }
    </script>
</body>
</html>