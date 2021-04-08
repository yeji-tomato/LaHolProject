<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carousel</title>
</head>
<body>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Oswald:500" rel="stylesheet">
<script>!function(e){"undefined"==typeof module?this.charming=e:module.exports=e}(function(e,n){"use strict";n=n||{};var t=n.tagName||"span",o=null!=n.classPrefix?n.classPrefix:"char",r=1,a=function(e){for(var n=e.parentNode,a=e.nodeValue,c=a.length,l=-1;++l<c;){var d=document.createElement(t);o&&(d.className=o+r,r++),d.appendChild(document.createTextNode(a[l])),n.insertBefore(d,e)}n.removeChild(e)};return function c(e){for(var n=[].slice.call(e.childNodes),t=n.length,o=-1;++o<t;)c(n[o]);e.nodeType===Node.TEXT_NODE&&a(e)}(e),e});
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css'>
<link rel="stylesheet" href="${ contextPath }/resources/css/main/carousel.css" type="text/css">
<!-- <link rel="stylesheet" href="<c:url value="/resources/menubar.css"/>"> -->
<!-- 슬라이드바 -->
<section   style="height:650px;">
    <div class="swiper-container slideshow">

        <div class="swiper-wrapper">
    
            <div class="swiper-slide slide">
            <div class="slide-image" style="background-image: url(https://images.unsplash.com/photo-1473187983305-f615310e7daa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80)"  ></div>
            <span class="slide-title"id="spanTitle" >coffee</span>    
            </div>
            <script src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
            <script>
                new TypeIt("#spanTitle", {
                    strings: ["STORE"],
                    speed: 500,
                    loop: true
                    }).go();
            </script>
            </div>
        
           
            
        </div>
    
        
         
    
      </div>
    
</section>
      <script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js'></script>
      <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js'></script>
  
 
</body>
</html>