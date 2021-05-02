<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="${ contextPath }/resources/css/playground/testResult.css" />
		<link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" />
	</head>
	<body>
		<section id="whole-container">
			<!-- 𖤐왼쪽 영역 -->
			<section id="left-area">
				<div id="title-container">
					<span id="title"><span id="type"></span>타입을 위한 추천 원두</span>
				</div>
				<div id="product-container">
					<div id="product-list">
						<div class="product-box">
							<img class="product-img" src=''></img>
							<div class="product-name"></div>
						</div>
						<div class="product-box">
							<img class="product-img"></img>
							<div class="product-name"></div>
						</div>
						<div class="product-box">
							<img class="product-img"></img>
							<div class="product-name"></div>
						</div>
					</div>
				</div>
				<div id="desc-container">
					<span id="desc"></span>
				</div>
			</section>

			<!-- 𖤐오른쪽 영역 -->
			<section id="right-area">
				<div id="beanbag-container">
					<img id="beanbag"><img/>
				</div>
				<div id="retry-container">
					<a href="${ contextPath }" id="retry">
						<svg width="18" height="18" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M22.0209 12.4645H28.0209V6.46448" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M23.7782 23.7782C22.2398 25.3166 20.2798 26.3642 18.146 26.7886C16.0122 27.2131 13.8005 26.9952 11.7905 26.1627C9.78049 25.3301 8.06253 23.9202 6.85383 22.1113C5.64514 20.3023 5 18.1756 5 16C5 13.8244 5.64514 11.6977 6.85383 9.88873C8.06253 8.07979 9.78049 6.66989 11.7905 5.83733C13.8005 5.00477 16.0122 4.78693 18.146 5.21137C20.2798 5.6358 22.2398 6.68345 23.7782 8.22183L28.0208 12.4645" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
							</svg>
						홈으로
					</a>
				</div>
			</section>
		</section>
		<script>
		// 타입 별 정보
		var aType = {
		    typeName : 'A',
		    productList : [
		        { productName: 'Queen City', productImg: '${ contextPath }/resources/img/playground/creamy1.png'},
		        { productName: 'Gayo River', productImg: '${ contextPath }/resources/img/playground/creamy2.png'},
		        { productName: 'Peru Sabancaya', productImg: '${ contextPath }/resources/img/playground/creamy3.png'},
		    ],
		    typeDesc : '남미에서 주로 생산되며 산미가 강하지않고 부드러워 자꾸 찾게되는 프리미엄 크리미 원두입니다.',
		    beanImg : '${ contextPath }/resources/img/playground/beanA.png'
		};

		var bType = {
		    'typeName' : 'B',
		    'productList' : [
		        { 'productName': 'Bisto Blend', 'productImg': '${ contextPath }/resources/img/playground/dark1.png'},
		        { 'productName': 'French Roast', 'productImg': '${ contextPath }/resources/img/playground/dark2.png'},
		        { 'productName': 'Guatemala Fnv', 'productImg': '${ contextPath }/resources/img/playground/dark3.png'},
		    ],
		    'typeDesc' : '엄선한 원두를 원두이탈리안 로스트라고도 불리는 다크로스팅을 거쳐 풀 바디감과 풍부한 맛과 향이 특징입니다',
		    'beanImg' : '${ contextPath }/resources/img/playground/beanB.png'
		};

		var cType = {
		    'typeName' : 'C',
		    'productList' : [
		        { 'productName': 'Espresso', 'productImg': '${ contextPath }/resources/img/playground/sugary1.png'},
		        { 'productName': 'Caffe Del Sol', 'productImg': '${ contextPath }/resources/img/playground/sugary2.png'},
		        { 'productName': 'Caffe Luna', 'productImg': '${ contextPath }/resources/img/playground/sugary3.png'},
		    ],
		    'typeDesc' : '브라질 남부에서 주로 생산되는 밀크 초콜릿과 카라멜의 부드러운 향이 캐슈넛을 지탱해 주는 중독성이 강한 원두입니다',
		    'beanImg' : '${ contextPath }/resources/img/playground/beanC.png'
		};

		// 타입 리스트
		var typeList = [aType, bType, cType];


		// 랜덤으로 뽑기
		let random = Math.floor(Math.random() * typeList.length);
		var result = typeList[random];

		// 화면에 출력
		$(function() {
		$('#type').html(result.typeName);
		$('#desc').html(result.typeDesc);
		$('#beanbag').attr('src', result.beanImg);

		for(var i= 0; i < 3; i++) {
		$('.product-img').eq(i).attr('src', result.productList[i].productImg);
		$('.product-name').eq(i).html(result.productList[i].productName);
		}
		});
		</script>
	</body>
</html>
