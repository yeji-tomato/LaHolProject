<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>LaHol - SIGN UP</title>
    <style>
        html {
            height: 100%;
        }

        body {
            height: 100%;
            padding: 0px;
            margin: 0 auto;
            line-height: 1;
            background: rgba(90, 69, 49, 1);

        }

        .bg {
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0;
            position: absolute;

            transition: all 0.5s;
        }

        #bg1 {
            background: url("${ contextPath }/resources/img/member/bg1.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: -2;
        }

        #cover {
            width: 100%;
            height: 100%;
            background: rgba(90, 69, 49, 0.6);
            position: absolute;
            z-index: -1;
        }

        #cover_1 {
            width: 100%;
            height: 100%;
            background: rgba(90, 69, 49, 0.9);
            position: absolute;
            z-index: -3;
        }

        .wrapper {
            width: 100%;
            height: 100%;
            margin: auto;
        }

        .login_wrapper {
            padding: 246px 0;
            margin: auto;
            min-width: 1200px;
            min-height: 416px;
        }

        .login_area {
            text-align: center;
            margin: 0 auto;
            width: 540px;
            min-height: 416px;
            background: #fff;
            border: 1px solid #5A452E;
        }

        .login_logo {
            width: 390px;
            height: 130px;
            margin: auto;
        }

        .login_logo img {
            padding: 20px;
            width: 110px;
            height: 80px;
        }

        .login_header span {
            display: inline-block;
            position: relative;
            padding-top: 4px;
            height: 56px;
            line-height: 56px;
        }

        .login_area span {
            display: inline-block;
            padding-top: 4px;
            position: relative;
        }

        .login_header span::before,
        .login_area span::before {
            position: absolute;
            left: 50%;
            top: 0;
            margin-left: -20px;
            width: 40px;
            height: 1px;
            background: #dadada;
            content: "";
        }

        .login_header span {
            font-family: 'NEXON Lv1 Gothic OTF';
        }

        .login_header span b {
            color: #5A452E;
        }

        .selectDiv {
            display: flex;
            width : 100%;
            justify-content: center;
            margin-bottom: 5px;
        }

        .selectDiv .n-signUp,
        .selectDiv .p-signUp {
            display : flex;
            border : 1px solid #4B654A;
            background: #4B654A;
            color : #fff;
            font-weight: bold;
            font-size : 13px;
            width : 30%;
            height: 150px;
            justify-content: center;
            flex-direction: column;
            margin : 20px;
            padding-top : 15px;
            cursor: pointer;

            transition : all 0.5s;
        }

        .selectDiv .n-signUp img,
        .selectDiv .p-signUp img {
            width : 40%;
            margin : 0 auto;
        }

        .n-signUp p {
            margin-top : 15px;
        }

        .sign-div:hover {
            /* background : #4B654A;
            border : 1px solid #4B654A; */
            transform : translate(-5px, -5px);

            transition : all 0.5s;
        }

        .sign-div:hover svg {
            fill : #4B654A;

            transition: all 0.5s;
        }

        .sign-div svg {
            fill : #F3D798;
        }

        #goMain {
            display: block;
            margin: 12px auto 12px;
            width: 68px;
            height: 22px;
            background: #4B654A;
            border: 1px solid #fff;
            font-size: 12px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }


        @keyframes main_shake {

            10%,
            90% {
                transform: translate3d(0, -1px, 0);
            }

            30%,
            70% {
                transform: translate3d(0, 2px, 0);
            }

            50% {
                transform: translate3d(0, -3px, 0);
            }
        }

        #goMain:hover {
            background-color: #344633;
            border-color: #344633;
            animation: main_shake 0.5s;
        }

        @media only screen and (max-height : 958px) {
            .bg, #cover_1, #cover {
                height : 958px;
            }
        }
    </style>
</head>

<body>
    <div id="cover_1"></div>
    <div class="bg" id="bg1"></div>
    <div id="cover"></div>
    <div class="wrapper">
        <div class="login_wrapper">
            <div class="login_area">
                <div class="login_header">
                    <div class="login_logo">
                        <img src="${ contextPath }/resources/img/common/logo-lahol2.png">
                    </div>
                    <span>
                        <b>LaHol</b> SIGN IN
                    </span>

                </div>
                <div class="selectDiv">
                    <div class="n-signUp sign-div" id="n-signUp">
                        <svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 2" viewBox="0 0 64 64">
                            <path d="M60 46H47.1093l.31-3h3.179a6.9843 6.9843 0 0 0 6.961-6.2671l.7373-7.0005A7.0036 7.0036 0 0 0 51.335 22H49.592l.4031-3.897A1.0011 1.0011 0 0 0 49 17H15a1.0011 1.0011 0 0 0-.9951 1.103L16.8907 46H4a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1H7.6049l2.16 2.0249A10.96 10.96 0 0 0 17.2881 57H46.7119a10.96 10.96 0 0 0 7.5235-2.9751L56.3951 52H60a1 1 0 0 0 1-1V47A1 1 0 0 0 60 46zM49.0748 27h2.26a2 2 0 0 1 1.99 2.2095l-.7373 7A1.9962 1.9962 0 0 1 50.5986 38H47.9368zm2.26-3a5.0034 5.0034 0 0 1 4.9736 5.5229l-.7373 7.0005A4.9891 4.9891 0 0 1 50.5986 41H47.6265l.1034-1h2.8687a3.9915 3.9915 0 0 0 3.9776-3.5815l.7373-7A3.9967 3.9967 0 0 0 51.335 25H49.2816l.1035-1zM16.1084 19H47.8916L45.0977 46H18.9023zm36.76 33.5659A8.97 8.97 0 0 1 46.7119 55H17.2881a8.97 8.97 0 0 1-6.1563-2.4341L10.5283 52H53.4717zM59 50H5V48H59zM32.3242 11.4287A3.2754 3.2754 0 0 0 31 14a1 1 0 0 0 2 0c0-.46.1953-.6567.6758-1.0977A3.275 3.275 0 0 0 35 10.3315 3.2752 3.2752 0 0 0 33.6758 7.76C33.1953 7.3188 33 7.1216 33 6.6626c0-.457.1953-.6538.6748-1.0933A3.27 3.27 0 0 0 35 3a1 1 0 0 0-2 0c0 .4575-.1953.6543-.6758 1.0942A3.2708 3.2708 0 0 0 31 6.6626a3.2754 3.2754 0 0 0 1.3242 2.5713c.48.4414.6758.6387.6758 1.0976S32.8047 10.9878 32.3242 11.4287zM41 15a1 1 0 0 0 1-1c0-.46.1953-.6567.6758-1.0977A3.2742 3.2742 0 0 0 44 10.3315a3.0851 3.0851 0 0 0-1.1-2.3627A1 1 0 1 0 41.52 9.415a1.144 1.144 0 0 1 .48.9165c0 .459-.1953.6563-.6758 1.0972A3.2754 3.2754 0 0 0 40 14 1 1 0 0 0 41 15zM23 15a1 1 0 0 0 1-1c0-.46.1953-.6567.6758-1.0977A3.2742 3.2742 0 0 0 26 10.3315a3.0851 3.0851 0 0 0-1.1-2.3627A1 1 0 1 0 23.52 9.415a1.144 1.144 0 0 1 .48.9165c0 .459-.1953.6563-.6758 1.0972A3.2754 3.2754 0 0 0 22 14 1 1 0 0 0 23 15z"/>
                        </svg>
                        <p class="sign-p">일반회원 가입</p>
                    </div>
                    <div class="p-signUp sign-div" id="p-signUp">
                        <svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" viewBox="0 0 32 32">
                            <path d="M21,5H20a1,1,0,0,0-1,1V7a1,1,0,0,0,1,1h1a1,1,0,0,0,1-1V6A1,1,0,0,0,21,5Zm0,2.5V7H20V6h1V7h0ZM28,10a1,1,0,0,0,1-1V4.08a1,1,0,0,0-1-1H27A.24.24,0,0,0,27,3V1a1,1,0,0,0-1-1H6A1,1,0,0,0,5,1V3a.24.24,0,0,0,0,.08H4a1,1,0,0,0-1,1V9a1,1,0,0,0,1,1H5V28.35L3.08,31.22A.5.5,0,0,0,3.5,32h25a.5.5,0,0,0,.42-.78L27,28.35V10ZM24,1h2V3h0v.08h0V3H24ZM22,1h1V3H22ZM18,1h3V3H18ZM16,1h1V3H16ZM12,1h3V3H12ZM10,1h1V3H10ZM6,1H9V3H6ZM27.57,31H4.43l1.34-2H26.23ZM12,13h1v1a1,1,0,0,0,1,1h4a1,1,0,0,0,1-1V13h1a1,1,0,0,0,1-1V10h5V28H22V26.5a.5.5,0,0,0-.5-.5h-3A2.54,2.54,0,0,0,19,25h.55a1.5,1.5,0,0,0,0-3H19v-.5a.5.5,0,0,0-.5-.5h-5a.5.5,0,0,0-.5.5v3a2.53,2.53,0,0,0,.51,1.5h-3a.5.5,0,0,0-.5.5V28H6V10h5v2A1,1,0,0,0,12,13Zm8-1v0H12V10h8v2Zm-6,2V13h4v1h0v0Zm7,13v1H11V27Zm-7-2.5V22h4v2.5A1.5,1.5,0,0,1,16.5,26h-1A1.5,1.5,0,0,1,14,24.5Zm5-.5V23h.5a.5.5,0,0,1,0,1ZM4,9V4.08H28V9h0V9ZM24.5,5A1.5,1.5,0,1,0,26,6.5,1.5,1.5,0,0,0,24.5,5Zm0,2a.5.5,0,1,1,.5-.5A.5.5,0,0,1,24.5,7Zm-7,12a.5.5,0,1,0-.5-.5A.5.5,0,0,0,17.5,19ZM17,5H16a1,1,0,0,0-1,1V7a1,1,0,0,0,1,1h1a1,1,0,0,0,1-1V6A1,1,0,0,0,17,5Zm0,2.5V7H16V6h1V7h0ZM13,5H6A1,1,0,0,0,5,6V7A1,1,0,0,0,6,8h7a1,1,0,0,0,1-1V6A1,1,0,0,0,13,5Zm0,2.5V7H6V6h7V7h0ZM14.5,20a.5.5,0,1,0-.5-.5A.5.5,0,0,0,14.5,20ZM16,15.5a.5.5,0,1,0,.5-.5A.5.5,0,0,0,16,15.5ZM15.5,18a.5.5,0,1,0-.5-.5A.5.5,0,0,0,15.5,18ZM17,20.5a.5.5,0,1,0-.5.5A.5.5,0,0,0,17,20.5Zm-3-5a.5.5,0,1,0,.5-.5A.5.5,0,0,0,14,15.5Z"/>
                        </svg>
                        <p class="sign-p">사업자 회원 가입</p>
                    </div>
                </div>
                <span></span>
                <div class="returnMain">
                    <button type="button" id="goMain" onclick="${ contextPath }">메인으로</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(".n-signUp").on({'mouseenter' : function(){
            $(this).css({"background": "#F3D798", "border" : "1px solid #F3D798"});
            $(".n-signUp p").css("color", "#000000");
        }, 'mouseleave' : function(){
            $(this).css({"background": "#4B654A", "border" : "1px solid #4B654A"});
            $(".n-signUp p").css("color", "#fff");
        }, 'click' : function(){
            location.href="${contextPath}/member/nsignUpView";
        }});

        $(".p-signUp").on({'mouseenter' : function(){
            $(this).css({"background": "#F3D798", "border" : "1px solid #F3D798"});
            $(".p-signUp p").css("color", "#000000");
        }, 'mouseleave' : function(){
            $(this).css({"background": "#4B654A", "border" : "1px solid #4B654A"});
            $(".p-signUp p").css("color", "#fff");
        }, 'click' : function(){
            location.href="${contextPath}/member/psignUpView";
        }});

    </script>
</body>
</html>