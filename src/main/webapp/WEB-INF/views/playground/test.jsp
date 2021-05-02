<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<title>LAHOL</title>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="${ contextPath }/resources/css/playground/test.css" />
		<link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" />
	</head>
	<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
		<div class="tinder">
			<div class="tinder--status">
				<i class="fa fa-remove"></i>
				<i class="fa fa-heart"></i>
			</div>

			<div class="tinder--cards">
				<div class="tinder--card">
					<img src="${ contextPath }/resources/img/playground/Q1.jpg"/>
					<h3 class="q-number">Q1</h3>
					<p class="question">산미 높은 아메리카노</p>
				</div>
				<div class="tinder--card">
					<img src="${ contextPath }/resources/img/playground/Q2.jpg" />
					<h3 class="q-number">Q2</h3>
					<p class="question">우유 많이 넣은 라떼</p>
				</div>
				<div class="tinder--card">
					<img src="${ contextPath }/resources/img/playground/Q3.jpg" />
					<h3 class="q-number">Q3</h3>
					<p class="question">에스프레소</p>
				</div>
				<div class="tinder--card">
					<img src="${ contextPath }/resources/img/playground/Q4.jpg" />
					<h3 class="q-number">Q4</h3>
					<p class="question">아포가토</p>
				</div>
				<div class="tinder--card">
					<img src="${ contextPath }/resources/img/playground/Q5.jpg" />
					<h3 class="q-number">Q5</h3>
					<p class="question">흑당연유라떼</p>
				</div>
			</div>

			<div class="tinder--buttons">
				<button class="roundBtn" id="nope"><i class="fa fa-remove"></i></button>
				<button class="roundBtn" id="love"><i class="fa fa-heart"></i></button>
			</div>
		</div>
		<!-- partial -->
		<script src="https://hammerjs.github.io/dist/hammer.min.js"></script>
		<script>
		'use strict';

		var tinderContainer = document.querySelector('.tinder');
		var allCards = document.querySelectorAll('.tinder--card');
		var nope = document.getElementById('nope');
		var love = document.getElementById('love');

		function initCards(card, index) {
		  var newCards = document.querySelectorAll('.tinder--card:not(.removed)');

		  newCards.forEach(function (card, index) {
		    card.style.zIndex = allCards.length - index;
		    card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
		    card.style.opacity = (10 - index) / 10;
		  });
		  
		  tinderContainer.classList.add('loaded');
		}

		initCards();

		allCards.forEach(function (el) {
		  var hammertime = new Hammer(el);

		  hammertime.on('pan', function (event) {
		    el.classList.add('moving');
		  });

		  hammertime.on('pan', function (event) {
		    if (event.deltaX === 0) return;
		    if (event.center.x === 0 && event.center.y === 0) return;

		    tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
		    tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);

		    var xMulti = event.deltaX * 0.03;
		    var yMulti = event.deltaY / 80;
		    var rotate = xMulti * yMulti;

		    event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
		  });


		  hammertime.on('panend', function (event) {
		    el.classList.remove('moving');
		    tinderContainer.classList.remove('tinder_love');
		    tinderContainer.classList.remove('tinder_nope');

		    var moveOutWidth = document.body.clientWidth;
		    var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

		    event.target.classList.toggle('removed', !keep);

		    if (keep) {
		      event.target.style.transform = '';
		    } else {
		      var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
		      var toX = event.deltaX > 0 ? endX : -endX;
		      var endY = Math.abs(event.velocityY) * moveOutWidth;
		      var toY = event.deltaY > 0 ? endY : -endY;
		      var xMulti = event.deltaX * 0.03;
		      var yMulti = event.deltaY / 80;
		      var rotate = xMulti * yMulti;

		      event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
		      initCards();
		    }
		  });
		});

		function createButtonListener(love) {
		  return function (event) {
		    var cards = document.querySelectorAll('.tinder--card:not(.removed)');
		    var moveOutWidth = document.body.clientWidth * 1.5;

		    if (!cards.length) return false;

		    var card = cards[0];

		    card.classList.add('removed');
		    

		    if (love) {
		      card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
		    } else {
		      card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
		    }

		    initCards();

		    event.preventDefault();
		  };
		}

		var nopeListener = createButtonListener(false);
		var loveListener = createButtonListener(true);

		nope.addEventListener('click', nopeListener);
		love.addEventListener('click', loveListener);
		
		</script>
	</body>
</html>
