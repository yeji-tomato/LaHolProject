<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두 성향 테스트</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/main/mainct.css" type="text/css">
</head>
<body>
	<!-- 원두 성향 테스트 -->
    <section class="play">
        <div class="play-circle1">
            <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
                <path fill="#e3a259" d="M31.9,-59.2C34.6,-47.9,25.5,-27.7,27.1,-15.1C28.7,-2.4,41,2.6,49.8,13.8C58.6,25.1,63.8,42.4,57.9,51.4C52,60.4,35,60.9,22.8,53.5C10.6,46,3.1,30.5,-1.8,21.9C-6.6,13.2,-8.8,11.4,-18.1,10.3C-27.5,9.2,-44,9,-56,1.1C-68,-6.8,-75.4,-22.3,-71.1,-32.7C-66.8,-43.2,-50.7,-48.5,-36.8,-54.7C-23,-60.9,-11.5,-67.9,1.5,-70.3C14.6,-72.7,29.2,-70.4,31.9,-59.2Z" transform="translate(100 100)" />
            </svg>
        </div>

	
        <div class="play-circle3">
            <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
                <path fill="#E5BD62" d="M45.5,-57.9C53.1,-57.2,49.3,-36,53.4,-18.5C57.6,-1,69.8,12.9,66.5,21.1C63.2,29.4,44.3,32.2,30.6,32C17,31.8,8.5,28.7,-2.2,31.7C-12.9,34.8,-25.9,44.1,-40.2,44.5C-54.5,44.9,-70.2,36.4,-69.6,25.6C-68.9,14.8,-52,1.7,-40.3,-6.6C-28.7,-15,-22.5,-18.6,-16.6,-20C-10.8,-21.3,-5.4,-20.3,6.8,-29.7C19,-39,38,-58.7,45.5,-57.9Z" transform="translate(100 100)" />
            </svg>
        </div>


        <div class="blog-card">
        <input type="radio" name="select" id="tap-1" checked>
        <input type="radio" name="select" id="tap-2">
        <input type="checkbox" id="imgTap">
        <div class="sliders">
            <label for="tap-1" class="tap tap-1"></label>
            <label for="tap-2" class="tap tap-2"></label>
        </div>
    <div class="inner-part">
            <label for="imgTap" class="img">
            <img class="img-1" src="https://images.unsplash.com/photo-1538736652376-c48ae104db4a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80">
            </label>
            <div class="content content-1">
            <span>원두 테스트</span>
            <div class="title">당신에게 어울릴만한 원두가
                궁금하신가요?</div>
            <button>커피 성향테스트 하러가기 →</button>
            </div>
    </div>
    <div class="inner-part">
            <label for="imgTap" class="img">
            <img class="img-2" src="https://images.unsplash.com/photo-1590006192944-7d9e7e8efd84?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8bW9uZXklMjBjb2ZmZWV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60">
            </label>
            <div class="content content-2">
            <span>PLAY GROUND</span>
            <div class="title">게임을 통해서 할인을 받으세요!</div>
            <button>할인쿠폰 받으러 가기 →</button>
            </div>
    </div>
    </div>

    <div class="play-circle2">
	<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
	  <path fill="#935039" d="M43.9,24.6C33.9,42.6,-13,38.6,-26.5,18.5C-40,-1.6,-20,-37.7,3.5,-35.7C26.9,-33.7,53.9,6.5,43.9,24.6Z" transform="translate(100 100)" />
	</svg>
    </div>
    </section>
</body>
</html>