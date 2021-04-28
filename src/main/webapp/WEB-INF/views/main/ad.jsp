<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고부분</title>
<!-- 광고 flickity CDN -->
<!-- CSS -->
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<!-- JavaScript -->
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<link rel="stylesheet" href="${ contextPath }/resources/css/main/ad.css" type="text/css">
</head>
<body>
	<!-- 광고 부분 -->
    <section class="box">
            <div class="cir">
                <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
                    <path fill="#CDC2AF" d="M67.3,-21C76.6,6.9,66.4,42.1,42.4,59.8C18.5,77.5,-19.1,77.8,-43.5,60C-67.8,42.3,-79,6.5,-69.5,-21.6C-60.1,-49.6,-30,-69.9,-0.5,-69.7C29,-69.6,57.9,-48.9,67.3,-21Z" transform="translate(100 100)" />
                </svg>
            </div>
            <div class="ad center">
                <h1 class="titlearea" id="titletext">LaHol</h1>
                <div id="underline"></div>
                <p class="textarea" id="typetext"></p>
            </div>

            <div class="adSlider">
                <div class="carousel" data-flickity='{ "autoPlay": true }'>
                    <!-- <div class="carousel-cell" style="background-image:url(https://images.unsplash.com/photo-1516007359037-f8f56dd361ff?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80)"></div>
                    <div class="carousel-cell" style="background-image:url(https://images.unsplash.com/photo-1598378002013-e374463ca9a1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80)"></div>
                    <div class="carousel-cell" style="background-image:url(https://images.unsplash.com/photo-1508766917616-d22f3f1eea14?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80)"></div> -->
                </div>
            </div>

        <!-- http://typeitjs.com -->
	<script src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
        <script>
            new TypeIt("#typetext", {
                strings: ["Latte is Horse"],
                speed: 100,
                loop: true
                }).go();
            
            $(function() {
            	$.ajax({
            		url : '${ contextPath }/pMypage/selectAd',
            		dataType : "json",
            		success : function(data) {
            			console.log(data);
            			
            			var adDiv = $("<div class='carousel' data-flickity='{ autoPlay: true }'>");
            			
            			var adSlider = $(".adSlider");
            			adDiv.html("");
            			adSlider.html("");
            			if(data != null) {
            				
            				for(var i in data){
	            				var imgDiv = $("<div class='carousel-cell' style='background-image:url(" + data[i].image + ")'>");
	            				// imgDiv.css('background', 'url(' + data[i].image + ')');
	            				
	            				adDiv.append(imgDiv);
            				}
            				adSlider.append(adDiv);
            				
            			} else {
            				var imgDiv = $("<div class='carousel-cell' style='background-image:url(https://bit.ly/3vq9x6w)'>");
            				adDiv.append(imgDiv);
            				adSlider.append(adDiv);
            			}
            			$(".carousel").flickity({
                    		cellAlign : 'left',
                    		contain : true,
                    		autoPlay : true
                    	});
            		},
            		error : function(e) {
            			alert("code : " + e.status + "\n" + "message : "
								+ e.responseText);
            		}
            	});
            	
            });
        </script>
    </section>
</body>
</html>