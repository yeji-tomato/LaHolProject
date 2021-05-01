<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="${ contextPath }/resources/css/playground/intro.css" />
		<link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" />
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
		<section id="whole-container">
			<div class="card-container" id="bean-container" onclick="location.href='${ contextPath }/playground/test'">
				<div class="overlay">
					<div class="items"></div>
					<div class="items head">
						<p>원두 테스트</p>
						<br>
						<hr />
						
					</div>
					<div class="items price">
					<br>
						<p>></p>
					</div>
				</div>
			</div>
			<div class="card-container" id="game-container" onclick="location.href='${ contextPath }/playground/game'">
				<div class="overlay">
					<div class="items"></div>
					<div class="items head">
						<p>게임 플레이</p>
						<br>
						<hr />
						
					</div>
					<div class="items price">
					<br>
						<p>></p>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>
