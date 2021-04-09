<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Error Page</title>
		<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
	</head>

	<style>
		@font-face {
			font-family: "NEXON Lv1 Gothic OTF";
			src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff")
				format("woff");
			font-weight: normal;
			font-style: normal;
		}

		body {
			background-color: #fff;
		}

		#whole-container {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}

		.text {
			font-family: "NEXON Lv1 Gothic OTF";
		}

		#errorMsg {
			font-size: 6vh;
			color: #4b654a;
		}

		a {
			background: linear-gradient(
				to bottom,
				var(--mainColor) 0%,
				var(--mainColor) 100%
			);
			background-position: 0 100%;
			background-repeat: repeat-x;
			background-size: 3px 3px;
			color: #000;
			text-decoration: none;
		}

		a:hover {
			background-image: url("data:image/svg+xml;charset=utf8,%3Csvg id='squiggle-link' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:ev='http://www.w3.org/2001/xml-events' viewBox='0 0 20 4'%3E%3Cstyle type='text/css'%3E.squiggle{animation:shift .3s linear infinite;}@keyframes shift {from {transform:translateX(0);}to {transform:translateX(-20px);}}%3C/style%3E%3Cpath fill='none' stroke='%23ff9800' stroke-width='2' class='squiggle' d='M0,3.5 c 5,0,5,-3,10,-3 s 5,3,10,3 c 5,0,5,-3,10,-3 s 5,3,10,3'/%3E%3C/svg%3E");
			background-position: 0 100%;
			background-size: auto 6px;
			background-repeat: repeat-x;
			text-decoration: none;
		}

		a {
			margin: 3vw;
			font-size: 5vh;
			color: #c7c7c7;
		}
	</style>
	<body>
		<section id="whole-container">
			<lottie-player
				src="https://assets8.lottiefiles.com/packages/lf20_MMzJtI.json"
				background="transparent"
				speed="1"
				style="width: 70vw; height: 70vh"
				loop
				autoplay
			></lottie-player>
			<div class="text" id="errorMsg">에러메세지를 이 곳에 띄우세요 ^ㅁ^</div>
			<hr />
			<div id="button-container">
				<a href="#" class="text" id="goBack">GO BACK</a>
				<a href="{ contextPath }" class="text" id="goHome">HOME</a>
			</div>
		</section>
	</body>
</html>
