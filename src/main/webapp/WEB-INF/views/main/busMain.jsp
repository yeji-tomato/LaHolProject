<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 메인페이지</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common/busMain.css" type="text/css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css'>
</head>
<body>
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	
	<div class="swiper-container">
      <!-- Additional required wrapper-->
      <div class="swiper-wrapper">
        <!-- Slides-->
        <div class="swiper-slide">
          <div class="card" id="storeBg">
            <div class="card__body">
              <h1 class="card-title">STORE</h1>
              <div class="card-meta">
                <div class="card-meta__line"></div>
              </div>
              <div class="card-tags"> 
                <a href="${ contextPath }/store/list2"  class="card-tags__item">HOME</a>  
                <a href="${ contextPath }/store/create" class="card-tags__item">CREATE</a>
                <a href="${contextPath}/pMypage/orderView" class="card-tags__item">DELIVERY</a>
                <a href="${contextPath}/pMypage/storeView" target="_blank" class="card-tags__item">STATISTICS</a>
                <a href="#" target="_blank" class="card-tags__item">Awesome</a>
              </div>
            </div><img src="https://images.unsplash.com/photo-1517231925375-bf2cb42917a5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1051&q=80" alt="" class="card__image">
          </div>
        </div>
        <div class="swiper-slide">
          <div class="card">
            <div class="card__body">
              <h1 class="card-title">CAFE</h1>
              <div class="card-meta">
                <div class="card-meta__line"></div>
              </div>
              <div class="card-tags">
                <a href="${ contextPath }/cafe/biz/home"  class="card-tags__item">HOME</a>
                <a href="${ contextPath }/cafe/biz/order" class="card-tags__item">ORDER</a>
                <a href="${ contextPath }/cafe/biz/res" class="card-tags__item">RESERVATION</a>
                <a href="${ contextPath }/cafe/biz/write" class="card-tags__item">WRITE</a>
                <a href="${ contextPath }/cafe/biz/confirm"  class="card-tags__item">CONFIRM</a>
              </div>
            </div><img src="https://images.unsplash.com/photo-1606444190488-46cf0d72c691?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" alt="" class="card__image">
          </div>
        </div>
        <div class="swiper-slide">
          <div class="card">
            <div class="card__body">
              <h1 class="card-title">CLASS</h1>
              <div class="card-meta">
                <div class="card-meta__line"></div>
              </div>
              <div class="card-tags">
                <a href="${ contextPath }/coffeeclass/busmain" target="_blank" class="card-tags__item">HOME</a>
                <a href="${ contextPath }/pMypage/classView" target="_blank" class="card-tags__item">MY CLASS</a>
                <a href="${ contextPath }/coffeeclass/createclass" target="_blank" class="card-tags__item">CREATE CLASS</a>
                <a href="${ contextPath }/coffeeclass" target="_blank" class="card-tags__item">OTHER CLASSES</a>
              </div>
            </div><img src="https://images.unsplash.com/photo-1522726336270-3a0053210f06?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80" alt="" class="card__image">
          </div>
        </div>
      </div>
    </div>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- partial -->
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js'></script>
<script>
"use strict";
$(document).ready(function() {
    new Swiper(".swiper-container", {
        initialSlide: 1,
        spaceBetween: 100,
        speed: 600,
        loop: !1,
        effect: "coverflow",
        coverflow: {
            rotate: 0,
            stretch: 500,
            depth: 300,
            modifier: 1,
            slideShadows: !1
        },
        slidesPerView: 1,
        slideToClickedSlide: !0,
        pagination: ".swiper-pagination",
        nextButton: ".swiper-button-next",
        prevButton: ".swiper-button-prev",
        breakpoints: {
            320: {
                slidesPerView: 1,
                spaceBetween: 0
            }
        }
    })
}), $(document).ready(function() {
    var e = $(".share-block__share-icon"),
        i = "share-block__share-icon--is-active",
        s = ".share-block__facebook-icon",
        o = ".share-block__twitter-icon",
        t = "share-block__facebook-icon--is-visible",
        n = "share-block__twitter-icon--is-visible",
        c = $(".like-block__like-icon"),
        l = "like-block__like-icon--is-visible";
    e.click(function() {
        $(this).toggleClass(i), $(this).siblings(s).toggleClass(t), $(this).siblings(o).toggleClass(n)
    }), c.click(function() {
        $(this).toggleClass(l)
    })
}), $(document).ready(function() {
    var e = $(".menu__icon"),
        i = "open",
        s = $(".card__body"),
        o = "card__body--faded",
        t = "menu__item--is-visible";
    e.click(function() {
        $(this).toggleClass(i), s.toggleClass(o), $(this).siblings().each(function(e) {
            var i = this;
            setTimeout(function() {
                $(i).toggleClass(t)
            }, 75 * e)
        })
    })
});
</script>
</body>
</html>