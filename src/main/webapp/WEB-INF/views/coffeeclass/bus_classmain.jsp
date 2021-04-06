<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Businsess_Classmain</title>
    <link rel="stylesheet" href="classmain.css"> 
    <!--icon--> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
    <!-- 부트스트랩 js -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <!-- 아이콘 cdn -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--부트스트랩 css-->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> -->

    <style>
    @font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }   

    *{
        font-family: 'NEXON Lv1 Gothic OTF';
    }

    .titletext{
        text-align: center;
    }

    #filterbtn {
        background-color: transparent;
        line-height: 25px;
        width : 100px;
        border:0px;
    }
    #filterbtn i:hover {
    position :relative;
    left : 20%;
    transition: all 0.25s linear 0.2s;
    }

    .create-btn {
	box-shadow: 0px 6px 0px -10px #1c1b18;
	background-color:#eae0c2;
	border-radius:25px;
	border:0.5px blanchedalmond;
	cursor:pointer;
	color:rgb(12, 39, 7);
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:14px 49px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
    }
    .create-btn:hover {
        border : rgb(124, 79, 11) solid;
        color: rgb(12, 39, 7);

    }
    .create-btn:active {
        position:relative;
        top:1px;
    }

            /* 네비부분 */
            nav{
            background-color: transparent;
            position: fixed;
            z-index: 99;
            width: 100%;
            padding: 30px 10px;
        }

        .menuWrapper {
            display: flex;
            margin : 0;
            padding : 0;
            z-index: 10;
            border-bottom: 1.5px solid white;
            height: 80px;
            align-items: flex-start;
        }

        .menuWrapper > * {
            display: flex;
            text-align: center;
            box-sizing: border-box;
        }

        .menuWrapper .mainMenu {
            width : 43vw;
            min-width : 600px;
            max-width : 50vw;
        }

        .mainMenu ul,
        .loginArea .loginMenu ul {
            padding: 0;
            margin : 0;
            display: flex;
            align-items: flex-start;
            vertical-align: middle;
        }
        .mainMenu ul li {
            align-self: flex-start;
            list-style: none;
            text-align: center;
            padding : 38px;
            line-height: 1px;
        }

        .mainMenu a {
            text-decoration: none;
            color : white;
            transition: all 0.5s linear;
        }

        .mainMenu a:hover {
            /* color : #F3D798; */
            color : #4B654A;
            transition: all 0.5s linear;
        }

        .logoArea {
            width : 10%;
            min-width: 130px;
            height: 100%;
            text-align: center;
            margin : 0;
            display: flex;
            align-items: center;
        }

        .logoArea img {
            width : 80px;
            height: 60px;
            margin : auto;
            display: block;
        }

        .loginArea {
            width : 45vw;
        }

        .loginArea .infoArea {
            width : 60%;
            /* min-width: 400px; */
        }

        .loginArea .loginMenu {
            width: 40%;
            min-width: 200px;
            float: right;
            text-align: right;
        }

        .loginArea .loginMenu ul {
            display: flex;
            justify-content: flex-end;
        }

        .loginArea .loginMenu ul li {
            list-style-type: none;
            text-align: center;
            padding : 38px 15px;
            line-height: 1px;
        }

        .loginArea .loginMenu ul li a {
            text-decoration: none;
            color : white;
            transition: all 0.5s linear;
        }

        .loginArea .loginMenu a:hover {
            /* color : #F3D798; */
            color : #4B654A;
            transition: all 0.5s linear;
        }

        nav.active{
            background: #CDC2AF;
        }




    </style>
</head>
<body>

    <!-- menubar -->
    <nav style=" background-color: #CDC2AF;" id="nav">
        <div class="menuWrapper">
            <div class="mainMenu">
                <ul>
                    <li><a href="#">STORE</a></li>
                    <li><a href="">CLASS</a></li>
                    <li><a href="#">CAFE</a></li>
                    <li><a href="#">PLAY GROUND</a></li>
                </ul>
            </div>
            <div class="logoArea">
                <img src="../resources/images/img_common/logo-lahol2.png">
            </div>
            <div class="loginArea">
                <div class="infoArea">
    
                </div>
                <div class="loginMenu">
                    <ul>
                        <li><a href="#">SIGN IN</a></li>
                        <li><a href="#">SIGN UP</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <script>
            $(window).on("scroll", function() {
            if($(window).scrollTop() > 50) {
                $("nav").addClass("active");
            } else {
                $("nav").removeClass("active");
            }
        });
        </script>
    </nav>
    <!--메인 위-->
    <div class="row">
        <div class="col-2">
            <!--페이지 타이틀-->
            <text class = "titletext">
            <h1>Lahol's <br> COFFEE CLASS</h1>
            <p>Be a barista yourself, a break in your day</p>
            </text> 

            <!--필터-->
            <div class="filter">
                <select class = "place">
                    <option value="">지역</option>
                    <option value="">서울/경기</option>
                    <option value="">강원</option>
                    <option value="">대구</option>
                    <option value="">제주</option>
                </select>
                <input type="date" value="날짜">
                <select class= "hour">
                    <option value="">시간</option>
                    <option value="">오전</option>
                    <option value="afternoon">오후</option>
                    <option value="evening">저녁</option>
                </select>
                <button id="filterbtn"><i class="fa fa-arrow-right" aria-hidden="true">Go</i></button>
            </div>

            <div style="margin-top: 80px; text-align: center;">
            <a href="bus_create.html" class="create-btn">클래스 개설하기</a>
            </div>

            <!--오른편 사진-->
        </div>
        <div class="col-2">
            <img src="../resources/images/class/classbanner.jpg">
        </div>
    </div>

    <!--검색-->
    <div class ="search_box" >
        <input type="text" class="input" placeholder="감성 한 스푼 넣은 홈카페 주인이 되고싶다면?" style="width: 750px;">
        <button style="background-color: transparent; border:0;">
            <i class="fa fa-search" id="submitbtn" aria-hidden="true"
            aria-label="submit search"></i>
        </button>


    <!--메인 하단/상품 진열-->

    <div class="classes">
        <h2>마이 클래스</h2>
        <div class="row">
            <div class="col-5">
                <img src="../resources/images/class/classp11.jpg" onclick="location.href='bus_classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp2.jpg" onclick="location.href='bus_classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp4.jpg" onclick="location.href='bus_classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                <i class="fa fa-star-half"></i>
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp7.jpg" onclick="location.href='bus_classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="small-container classes">
        <h2>진행중인 클래스</h2>
        <div class="row">
            <div class="col-5">
                <img src="../resources/images/class/classp11.jpg" onclick="location.href='classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp2.jpg" onclick="location.href='classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp4.jpg" onclick="location.href='classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp7.jpg" onclick="location.href='classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp9.jpg" onclick="location.href='classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="classes">
        <h2>진행예정 / 종료된 클래스</h2>
        <div class="row">
            <div class="col-5">
                <img src="../resources/images/class/classp11.jpg" onclick="location.href='classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp2.jpg" onclick="location.href='classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp4.jpg" onclick="location.href='classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                <i class="fa fa-star-half"></i>
                </div>
            </div>
            <div class="col-5">
                <img src="../resources/images/class/classp7.jpg" onclick="location.href='classdetail.html'">
                <h4>클래스이름</h4>
                <p>가격</p>
                <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half"></i>
                </div>
            </div>
        </div>
    </div>

</body>
</html>