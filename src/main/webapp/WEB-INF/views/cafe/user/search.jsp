<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 검색 페이지</title>
<!-- search css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/search.css">
</head>
<body>
	
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<section class="searchCafe">
            <div class="headSearch">
                <!-- <div id="parallelogram"></div> -->
                <div class="cafe-title">
                    <span id="spanTitle"></span>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
            <script>
                new TypeIt("#spanTitle", {
                    strings: ["CAFE"],
                    speed: 500,
                    loop: true
                    }).go();
            </script>
            <!-- 서치 -->
            <main>
                <div class="search-container">
                    <div class="search-box">
                        <div class="search-icon"><i class="fa fa-search search-icon"></i></div>
                        <form action="" class="search-form">
                            <input type="text" placeholder="Search" id="search" autocomplete="off">
                        </form>
                        <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
                            xml:space="preserve">
                        <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
                        <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
                        </svg>
                        <div class="go-icon"><i class="fa fa-arrow-right"></i></div>
                    </div>
                </div>
            </main>
            <script>
            $(document).ready(function(){
                    $("#search").focus(function() {
                    $(".search-box").addClass("border-searching");
                    $(".search-icon").addClass("si-rotate");
                    });
                    $("#search").blur(function() {
                    $(".search-box").removeClass("border-searching");
                    $(".search-icon").removeClass("si-rotate");
                    });
                    $("#search").keyup(function() {
                        if($(this).val().length > 0) {
                        $(".go-icon").addClass("go-in");
                        }
                        else {
                        $(".go-icon").removeClass("go-in");
                        }
                    });
                    $(".go-icon").click(function(){
                    $(".search-form").submit();
                    });
                });
            </script>
    </section>
    <hr style="margin-top: 5%;">
    <!-- 정렬 방식 -->
    <section class="content-cafe-sc">
        <h1 style="color: gray; margin-left: 7%;">경기도 용인시</h1>
        <div class="container" id="ct-cf">
            <div class="row" id="rowP">
            <div class="col">
                <div class="card" id="cardShape">
                    <img src="https://i.pinimg.com/236x/30/24/e3/3024e301ca4b56581f771a47cdd7b6ad.jpg" class="card-img-top" alt="...">
                    <div class="card-body" id="card-body">
                        <h3 class="card-text">LaHol cafe1</h3>
                        <p style="color: #96877D">경기도 용인시 기흥구</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card" id="cardShape">
                    <img src="https://i.pinimg.com/564x/90/7d/2d/907d2d977d74946eac5833c8ba24aded.jpg" class="card-img-top" alt="...">
                    <div class="card-body" id="card-body">
                        <h3 class="card-text">LaHol cafe2</h3>
                        <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card" id="cardShape">
                    <img src="https://i.pinimg.com/564x/06/f3/e5/06f3e5fcdccade436982e460b356bfeb.jpg" class="card-img-top" alt="...">
                    <div class="card-body" id="card-body">
                        <h3 class="card-text">LaHol cafe2</h3>
                        <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card" id="cardShape">
                    <img src="https://i.pinimg.com/564x/67/06/44/670644f324b16048540e0c144e391183.jpg" class="card-img-top" alt="...">
                    <div class="card-body" id="card-body">
                        <h3 class="card-text">LaHol cafe2</h3>
                        <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card" id="cardShape">
                    <img src="https://i.pinimg.com/564x/1b/20/89/1b20894e6fbfaacc5f351d8440fe71ad.jpg" class="card-img-top" alt="...">
                    <div class="card-body" id="card-body">
                        <h3 class="card-text">LaHol cafe2</h3>
                        <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                    </div>
                </div>
            </div>
            </div>

            <div class="row" id="rowP">
                <div class="col">
                    <div class="card" id="cardShape">
                        <img src="https://i.pinimg.com/236x/30/24/e3/3024e301ca4b56581f771a47cdd7b6ad.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h3 class="card-text">LaHol cafe1</h3>
                            <p style="color: #96877D">경기도 용인시 기흥구</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" id="cardShape">
                        <img src="https://i.pinimg.com/564x/90/7d/2d/907d2d977d74946eac5833c8ba24aded.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h3 class="card-text">LaHol cafe2</h3>
                            <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" id="cardShape">
                        <img src="https://i.pinimg.com/564x/06/f3/e5/06f3e5fcdccade436982e460b356bfeb.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h3 class="card-text">LaHol cafe2</h3>
                            <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" id="cardShape">
                        <img src="https://i.pinimg.com/564x/67/06/44/670644f324b16048540e0c144e391183.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h3 class="card-text">LaHol cafe2</h3>
                            <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" id="cardShape">
                        <img src="https://i.pinimg.com/564x/1b/20/89/1b20894e6fbfaacc5f351d8440fe71ad.jpg" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h3 class="card-text">LaHol cafe2</h3>
                            <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                        </div>
                    </div>
                </div>
                </div>

            
                <div class="row" id="rowP">
                    <div class="col">
                        <div class="card" id="cardShape">
                            <img src="https://i.pinimg.com/236x/30/24/e3/3024e301ca4b56581f771a47cdd7b6ad.jpg" class="card-img-top" alt="...">
                            <div class="card-body" id="card-body">
                                <h3 class="card-text">LaHol cafe1</h3>
                                <p style="color: #96877D">경기도 용인시 기흥구</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" id="cardShape">
                            <img src="https://i.pinimg.com/564x/90/7d/2d/907d2d977d74946eac5833c8ba24aded.jpg" class="card-img-top" alt="...">
                            <div class="card-body" id="card-body">
                                <h3 class="card-text">LaHol cafe2</h3>
                                <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" id="cardShape">
                            <img src="https://i.pinimg.com/564x/06/f3/e5/06f3e5fcdccade436982e460b356bfeb.jpg" class="card-img-top" alt="...">
                            <div class="card-body" id="card-body">
                                <h3 class="card-text">LaHol cafe2</h3>
                                <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" id="cardShape">
                            <img src="https://i.pinimg.com/564x/67/06/44/670644f324b16048540e0c144e391183.jpg" class="card-img-top" alt="...">
                            <div class="card-body" id="card-body">
                                <h3 class="card-text">LaHol cafe2</h3>
                                <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" id="cardShape">
                            <img src="https://i.pinimg.com/564x/1b/20/89/1b20894e6fbfaacc5f351d8440fe71ad.jpg" class="card-img-top" alt="...">
                            <div class="card-body" id="card-body">
                                <h3 class="card-text">LaHol cafe2</h3>
                                <p style="color: #96877D">경기도 용인시 기흥구 주소주소주소</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <script>
                        const detail = document.getElementById("cardShape");
                        detail.addEventListener("click", function(){
                            location.href='${ contextPath }/cafe/detail';
                        });
                    </script>
        </div>
        <!-- 페이징 바 -->
        <div aria-label="Page navigation" class="cafe-order-page">
            <ul class="pagination">
                <li class="page-item">
                <a class="page-link" id="page-color" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
                </li>
                <li class="page-item" id="page-hover"><a class="page-link" id="page-color" href="#">1</a></li>
                <li class="page-item"><a class="page-link" id="page-color" href="#">2</a></li>
                <li class="page-item"><a class="page-link" id="page-color" href="#">3</a></li>
                <li class="page-item">
                <a class="page-link" id="page-color" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                </li>
            </ul>
            </div>

    </section>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>