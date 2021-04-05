<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세번째 세션</title>
<!-- GSAP 라이브러리 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/ScrollTrigger.min.js"></script>

<!-- 세 번째 영역 전용 CSS-->
<link rel="stylesheet" href="${ contextPath }/resources/css/main/third-section.css" type="text/css">

<!-- 폰트 모음 CSS-->
<link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" type="text/css">
</head>
<body>
	<!-- 세번째 세션 -->
    <div id="sc3">
        <!-- 텍스트 섹션 1 -->
		<section id="section3">
			<div class="title titleGreathorned">
				<span class="[ heading heading--4 ]">COFFEE :)</span>
				<div class="[ heading heading--4 ]">
                    The absolute cure and the fuel for your life
                    attentively chosen by <div class="[ heading heading--4 ]" style="color: #810B0B">LAHOL</div></div>

			</div>
		</section>

		<!-- 이미지 섹션 1 -->
		<section class="cluster clusterGreat" id="section3">
			<div class="circle clusterPieces"></div>

			<div class="owlHorned clusterPieces">
                <img src="./resources/images/img_main/rose_with_coffee.png" />
			</div>

			<img
				class="dotsBlue clusterPieces"
				src="https://www.micelistudios.com/sandbox/scrolltrigger/imgs/dots_blue_494x434.svg"
			/>
		</section>

		<!-- 텍스트 섹션 2 -->
		<section id="section3">
			<div class="title titleBurrowing">
				<span class="[ heading heading--4 ]">All-In-One Service</span>
				<div class="[ heading heading--4 ]">
                    Dedicated to your Care !
				</div>
		</section>

		<!-- 이미지 섹션 2 -->
		<section class="cluster clusterBurrowing" id="section3">
			<img
				class="clusterPieces triangle"
				src="https://www.micelistudios.com/sandbox/scrolltrigger/imgs/triangle_448x446.svg"
			/>

			<div class="clusterPieces owlBurrowing">
                <img src="./resources/images/img_main/latte_in_a_cup.jpg" />
			</div>

			<img
				class="clusterPieces dotsWhite"
				src="https://www.micelistudios.com/sandbox/scrolltrigger/imgs/dots_white_310x588.svg"
			/>
		</section>

		<section class="spcr300" id="section3"></section>
    </section>
    </div>
    
    <script>

    gsap.set(".circle", { yPercent: -5});
    gsap.set(".dotsBlue", { yPercent: 10});
    gsap.set(".owlHorned", { yPercent: -20});
    gsap.set(".clusterGreat", { yPercent: 5});

    gsap.to(".circle", {
      yPercent: 5,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterGreat",
        scrub: 1
      }, 
    });

    gsap.to(".dotsBlue", {
      yPercent: -10,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterGreat",
        scrub: 1
      }, 
    });


    gsap.to(".owlHorned", {
      yPercent: 20,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterGreat",
        scrub: 1
      }, 
    });

    gsap.to(".caption", {
      yPercent: 100,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterGreat",
      // markers:true,
        end: "bottom center",
        scrub: 1
      }, 
    });

    gsap.to(".clusterGreat", {
      yPercent: -5,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterGreat",
        end: "bottom center",
        scrub: 1
      }, 
    });


    gsap.set(".triangle", { yPercent: 25, rotation:-90});
    gsap.set(".dotsWhite", { yPercent: 10});
    gsap.set(".owlBurrowing", { yPercent: -20});
    gsap.set(".clusterBurrowing", { yPercent: 5});

    gsap.to(".triangle", {
      yPercent: -5,
      rotation: 40,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterBurrowing",
        scrub: 1
      }, 
    });

    gsap.to(".dotsWhite", {
      yPercent: -10,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterBurrowing",
        scrub: 1
      }, 
    });


    gsap.to(".owlBurrowing", {
      yPercent: 20,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterBurrowing",
        scrub: 1
      }, 
    });

    gsap.to(".captionBurrowing", {
      yPercent: 200,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterBurrowing",
        end: "bottom center",
        scrub: 1
      }, 
    });

    gsap.to(".clusterBurrowing", {
      yPercent: -5,
      ease: "none",
      scrollTrigger: {
        trigger: ".clusterBurrowing",
        end: "bottom center",
        scrub: 1
      }, 
    });

    var tlSplitGreat = gsap.timeline({onComplete: () => {SplitGreat.revert()}}), 
        SplitGreat = new SplitText(".titleGreathorned", {type:"words,chars"}), 
        chars = SplitGreat.chars;


    tlSplitGreat.from(chars, {
      duration: 0.8,
      opacity:0,
      y:10,
      ease:"circ.out",
      stagger: 0.02,
    }, "+=0");



    function setupSplits() {
      
    var tlSplitBurrowing = gsap.timeline(), 
        SplitBurrowing = new SplitText(".titleBurrowing", {type:"words,chars"}), 
        chars = SplitBurrowing.chars; //an array of all the divs that wrap each character


    tlSplitBurrowing.from(chars, {
      duration: 0.8,
      opacity:0,
      y:10,
      ease:"circ.out",
      stagger: 0.02,
    scrollTrigger: {
        trigger: ".titleBurrowing",
        start: "top 75%",
       end: "bottom center",
        scrub:1
      }
    }, "+=0");


      
    };


    ScrollTrigger.addEventListener("refresh", setupSplits);

    setupSplits();    
    </script>
</body>
</html>