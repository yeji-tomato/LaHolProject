<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 등록</title>
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/reset.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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

    </style>
</head>
<body>
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
            <p class="content-text">사용한 카페 / 클래스 / 물품 / 원두에 대해</p>
            <p class="content-text">자유롭게 후기를 작성해 주세요.</p>
        </div>
        <form>
            <div class="content-upload-img content-div">
                <p class="content-subTitle">사진 리뷰</p>
                <div class="upload-div">
                    <label for="review-img">사진 업로드</label>
                    <input type="text" id="upload-name" disabled>
                    <input type="file" id="review-img" name="review-img">
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
                <p class="content-subTitle">후기</p>
                <textarea id="review-text" style="resize: none;"></textarea>
            </div>
            <div class="btn-div content-div">
                <input type="submit" class="review-btn" value="등록">
                <input type="button" class="review-btn" value="취소">
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
        });
    </script>
</body>
</html>