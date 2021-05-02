<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<title></title>
		<link rel="stylesheet" href="./style.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="${ contextPath }/resources/css/playground/tasteTest.css" />
		<link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" />
	</head>
	<body style="background-color: #f6ebdb">
		<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
		<div class="fullpage centered">
			<div class="container">
				<div class="centered">
					<h1 id="title-text">
						<span class="title-letter">원</span>
						<span class="title-letter">두</span>
						<span class="title-letter">취</span>
						<span class="title-letter">향</span>
						&nbsp; &nbsp; &nbsp;
						<span class="title-letter">알</span>
						<span class="title-letter">아</span>
						<span class="title-letter">보</span>
						<span class="title-letter">기</span>
					</h1>
					<div onclick="showPage(2); setupQuestion();" id="startBtn">
						<a id="getStarted">
							<span>시</span>
							<span>작</span>
							<span>하</span>
							<span>기</span>
						</a>
					</div>
				</div>
			</div>
			<div class="container hidden">
				<h1 id="personality-type"></h1>
				<p id="personality-part-1"></p>
				<p id="personality-part-2"></p>
				<p id="personality-recommended"></p>
				<br />
				<div class="centered">
					<div onclick="showPage(0); setupQuestion();">
						<p>RETRY</p>
					</div>
				</div>
			</div>
			<div class="container hidden">
				<div id="progress-bar">
					<div id="progress">1/5</div>
				</div>
				<h2 id="question"></h2>
				<div class="option" id="option0" onclick="select(this)">
					<input type="radio" name="answer" value="0" onchange="next()" />
					<div class="content centered"></div>
					<br />
				</div>
				<div class="option" id="option1" onclick="select(this)">
					<input type="radio" name="answer" value="1" onchange="next()" />
					<div class="content centered"></div>
					<br />
				</div>
				<div class="option" id="option2" onclick="select(this)">
					<input type="radio" name="answer" value="2" onchange="next()" />
					<div class="content centered"></div>
					<br />
				</div>
				<div class="option" id="option3" onclick="select(this)">
					<input type="radio" name="answer" value="3" onchange="next()" />
					<div class="content centered"></div>
					<br />
				</div>
			</div>
		</div>
		<script>
		// constant to store all the questions and answers
		const questions = {
		  question0: {
		    question: "나는 하루에 커피를 ( )잔 마신다",
		    option0: {
		      type: "string",
		      content:
		        "1잔",
		      personality: "Adventurous"
		    },
		    option1: {
		      type: "string",
		      content:
		        "2잔",
		      personality: "Intellectual"
		    },
		    option2: {
		      type: "string",
		      content:
		        "3잔",
		      personality: "Immersed"
		    },
		    option3: {
		      type: "string",
		      content:
		        "4잔 이상",
		      personality: "Dreamy"
		    }
		  },
		  question1: {
		    question: "가장 좋아하는 허브는?",
		    option0: {
		      type: "string",
		      content: "로즈마리",
		      personality: "Adventurous"
		    },
		    option1: {
		      type: "string",
		      content: "바질",
		      personality: "Intellectual"
		    },
		    option2: {
		      type: "string",
		      content: "진저",
		      personality: "Immersed"
		    },
		    option3: {
		      type: "string",
		      content: "페퍼민트",
		      personality: "Dreamy"
		    }
		  },
		  question2: {
		    question: "가장 좋아하는 샐러드 드레싱은?",
		    option0: {
		      type: "string",
		      content: "발사믹",
		      personality: "Adventurous"
		    },
		    option1: {
		      type: "string",
		      content: "랜치",
		      personality: "Dreamy"
		    },
		    option2: {
		      type: "string",
		      content: "시저",
		      personality: "Intellectual"
		    },
		    option3: {
		      type: "string",
		      content: "레몬 오일",
		      personality: "Immersed"
		    }
		  },
		  question3: {
		    question:
		      "가장 좋아하는 초콜릿 종류는?",
		    option0: {
		      type: "string",
		      content:
		        "밀크",
		      personality: "Immersed"
		    },
		    option1: {
		      type: "string",
		      content:
		        "화이트",
		      personality: "Intellectual"
		    },
		    option2: {
		      type: "string",
		      content: "다크",
		      personality: "Dreamy"
		    },
		    option3: {
		      type: "string",
		      content:
		        "민트",
		      personality: "Adventurous"
		    }
		  },
		  question4: {
		    question:
		      "즐겨마시는 커피 타입은?",
		    option0: {
		      type: "string",
		      content: "아메리카노",
		      personality: "Adventurous"
		    },
		    option1: {
		      type: "string",
		      content: "카푸치노",
		      personality: "Intellectual"
		    },
		    option2: {
		      type: "string",
		      content: "카페라떼",
		      personality: "Dreamy"
		    },
		    option3: {
		      type: "string",
		      content: "더블 에스프레소",
		      personality: "Immersed"
		    }
		  }
		};

		// constant to store the description for each type of traveller
		const result = {
		  Adventurous: [
		    "If you imagine yourself bungee jumping in New Zealand, running with the bulls in Pamplona, dancing until 6 in the morning in Berlin, heliskiing from the top of a mountain in Banff or boating down the Amazon, all signs point to you being an adventure traveler.",
		    "National Geographic has a list of the top adventure tour operators and outfitters worldwide that may be worth a look. Of course, you don't need to be a part of a tour to have an adventure, but if you're not sure what adventure travel means or if you just want an idea of what kind of companies operate tours and which ones to use, it's a great place to start.",
		    "Recommended destinations for adventure travelers: New Zealand, Brazil, Bolivia, Nepal/Tibet, Tanzania, India."
		  ],
		  Immersed: [
		    "If your travel dreams are populated by the perfect sunset on a secluded beach in the Seychelles, gondola rides in Venice, and catching falling Sakura flowers, this is probably you.",
		    "Travel can be an amazing way to inspire creativity and connect with your inner muse! Check out Travel and Leisure's list of the 50 most dreamy places for a general idea of what's out there in the way of romantic destinations. The notion of taking off to far-flung places is a dream come through in itself, so grab your passports, and get out and see the world.",
		    "Recommended spots for dreamy travelers: Santorini, Venice, Paris, Buenos Aires, Goa, Bali, Phuket, Fiji, Tahiti."
		  ],
		  Intellectual: [
		    "If travel is just another way you broaden your internal encyclopedia with art, culture, and history, and your dream itinerary includes days filled with museums, archeological sites, groundbreaking architecture and traditional experiences, you may be an intellectual traveler.",
		    "Lucky for you, destinations all over the world cater to the student inside of all of us. The world's full of lessons, and travel is the way to learn them.",
		    "Recommended regions for intellectual travelers: Europe, India, Japan, Machu Picchu, Istanbul, Cairo."
		  ],
		  Dreamy: [
		    "If your travel dreams are populated by the perfect sunset on a secluded beach in the Seychelles, gondola rides in Venice, and catching falling Sakura flowers, this is probably you.",
		    "Travel can be an amazing way to inspire creativity and connect with your inner muse! Check out Travel and Leisure's list of the 50 most dreamy places for a general idea of what's out there in the way of romantic destinations. The notion of taking off to far-flung places is a dream come through in itself, so grab your passports, and get out and see the world.",
		    "Recommended spots for dreamy travelers: Santorini, Venice, Paris, Buenos Aires, Goa, Bali, Phuket, Fiji, Tahiti."
		  ]
		};

		// for keeping track of the score
		var score = {
		  Adventurous: 0,
		  Immersed: 0,
		  Intellectual: 0,
		  Dreamy: 0
		};

		// for keep track of the current question
		var currentQn = 0;

		// for setting up each of the questions
		function setupQuestion() {
		  // find out the current percentage of completion and updates the css
		  var progress = 20 + currentQn * 20;
		  var progressbar = document.getElementById("progress");
		  progressbar.style.width = progress + "%";
		  progressbar.innerText = currentQn + 1 + "/5";

		  // get the current questions content
		  var qn = questions["question" + currentQn];
		  var qnText = document.getElementById("question");
		  qnText.innerText = qn.question;

		  // updates each of the options for the current question
		  for (var i = 0; i < 4; i++) {
		    var option = document.getElementById("option" + i);
		    var content = option.getElementsByClassName("content")[0];
		    var qnOption = qn["option" + i];
		    if (qnOption.type == "image") {
		      var htmlStr = "<img src='" + qnOption.content + "'>";
		      content.innerHTML = htmlStr;
		    } else {
		      var htmlStr = "<p style='font-size: 5vh; color:#4B654A;'>" + qnOption.content + "</p>";
		      content.innerHTML = htmlStr;
		    }
		  }
		}

		// to unselect all of the options
		function resetOptions() {
		  var btn = document.getElementsByTagName("input");
		  btn[0].checked = false;
		  btn[1].checked = false;
		  btn[2].checked = false;
		  btn[3].checked = false;
		}

		// to select the option that is clicked
		function select(element) {
		  var btn = element.getElementsByTagName("input")[0];
		  btn.checked = true;
		  next();
		}

		// get the next questions, or display result if all questions were answered
		function next() {
		  // get the current select option
		  var ans = $("input[name=answer]:checked").val();
		  var qn = questions["question" + currentQn];
		  // get the personality type for the option selected
		  var personality = qn["option" + ans].personality;
		  // increase the score of the personality by one
		  score[personality]++;
		  // increase the question count by 1
		  currentQn = currentQn + 1;
		  // unselect all options
		  resetOptions();
		  // check if quiz is completed
		  if (currentQn < 5) {
		    // if quiz not completed, setup the next question
		    setupQuestion();
		  } else {
		    // else quiz is completed
		    // assume that the highest score is the adventurous personality
		    // and go through each of the personality type, and update the highest score and personality
			location.href = "${ contextPath }/playground/testResult";
		  }
		}

		// bring the particular page into view.
		// page 0: start page
		// page 1: result page
		// page 2: quiz
		function showPage(num) {
		  var pages = document.getElementsByClassName("container");
		  pages[0].style.display = "none";
		  pages[1].style.display = "none";
		  pages[2].style.display = "none";
		  pages[num].style.display = "block";
		}
		</script>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</body>
</html>