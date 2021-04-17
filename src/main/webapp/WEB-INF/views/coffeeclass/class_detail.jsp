<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>  
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClassDetail</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!-- css추가 -->
    <link rel="stylesheet" href="${ contextPath }/resources/css/coffeeclass/classdetail.css">
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    
    
    
</head>
<body>
   	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
   
    <div class="container" style="margin-top: 20vh;">
        <div class="row">
            <!--왼쪽-->
            <div class="col">
            <!-- <img src="../resources/images/class/classp7.jpg" style="width: 400px; height: 500px;"> -->
            <!-- carousel -->
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner" id="caroselLeft">
                <div class="carousel-item active" data-bs-interval="10000">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clThumbnail }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clPhoto }" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.trPhoto }" alt="...">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>


            </div>
            <!--오른쪽-->
            <div class="col">
              <div class="cl-info">
                  <table class="cl-table">
                    <thead>
                      <tr>
                        <td colspan="3">
                          <pre class="cl-title">${ coffeeclass.className }</pre>
                        </td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>주최카페</td> <!-- cafeNo를 통해 이름 불러오기 -->
                        <td colspan="2">${ coffeeclass.cafeNo }</td>
                      </tr>
                      <tr>
                        <td>연계 카페명</td> <!-- cafeNo를 통해 이름 불러오기 -->
                        <td> ${ coffeeclass.cafeNo }</td>
                        <!--마우스 오버시 등장하는 정보-->              
                        <div class="help-tip" style="float:right;">
                    
                          <div class="info">
                          <p>카페이름 : ${ coffeeclass.cafeNo } </p> <!-- cafeNo를 통해 이름 불러오기 -->
                          <p>카페 위치 :  ${ coffeeclass.cafeNo }   </p> <!-- cafeNo를 통해  -->
                          <a href = "${ ContextPath }/cafe/user/here">☕카페보러가기</a>
                          </div>
                      
                          </div>
                       </td>
                      </tr>
                      <tr>
                        <td>
                          <ul>
                            <li>난이도</li>
                            <li>소요시간</li>
                          </ul>
                        </td>
                        <td>
                          <ul style="border-left: 2px solid black;">
                            <li>난이도</li>
                            <li>소요시간</li>
                          </ul>
                        </td>
                        <td>
                          <ul style="border-left: 2px solid black;">
                            <li>${ coffeeclass.classLvl }</li>
                            <li>${ coffeeclass.clRuntime }</li>
                          </ul>
                        </td>
                      </tr>
                      <tr>
                        <td>날짜</td>
                        <td colspan="2">
                          <select style="width: 80%;">
                            <option value="" class = "selectdate" disabled ="disabled" selected>날짜</option> 
                            <option value="" class = "selectdate">"${ coffeeclass.classDate }"</option>
                          </select>          
                        </td>
                      </tr>
                      <tr>
                        <td>시간</td>
                        <td colspan="2">
                          <select style="width: 80%;">
                            <option value="" class = "selecttime" disabled="disabled" selected>시간</option>
                          	<c:forEach var="time" items="#{ classTimes }">
                           		<option class = "selecttime" name="classTime" value="${ time }">${ time }</option>
                        	</c:forEach>
                        </select>          
                        </td>
                      </tr>
                      <tr>
                        <td>결제금액</td>
                        <td colspan="2">
                          65,000원
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="btnDiv" id = "classupdate">
                    <form action="${ contextPath }/coffeeclass/register" method="POST">
                    	<input type="hidden" name="userId" value="${ sessionScope.loginUser.id }">
                    	<input type="hidden" name="classNo" value="${ coffeeclass.classNo }">
	                    <button type="submit" class="btn" id = "register-btn">
	                    	  수강신청
	                      <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
	                    </button>
                    </form>
                    <button type="button" class="btn" id = "cart-btn">
                      	  장바구니
                      <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    </button>
                    
                     <!--클래스 신고-->                    
                    <button style="border:transparent; background-color:transparent;">
                      <div class="report" style="margin-bottom: 3vh;">
                        <i class="fa fa-bullhorn" aria-hidden="true" id="reportclass" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
                      </div>
                    </button>
                   
                    </div> 
                    
                    <div class="btnDiv">
	                    <button type="button" class= "btn" id = "register-btn"
	                     onclick="location.href='${ contextPath }/coffeeclass/updateclass?classNo=${ coffeeclass.classNo }'">
	                      	클래스 정보수정
	                      <i class="fa fa-wrench" aria-hidden="true"></i>
	                    </button>                     
	                    <button type="button" class="btn btn-primary" id="cart-btn" data-bs-toggle="modal" data-bs-target="#deleteModal"
	                     >
	                                             클래스 삭제
	                    <i class="fa fa-trash" aria-hidden="true"></i> 
	                    </button>
                    </div>     
                   
              </div>
        </div>
    </div>
  </div>
  
  	<!-- 클래스 삭제 Modal -->
	  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #4B654A;">
				<h5 class="modal-title" id="deleteModalLabel" style="color: white;">
					<img src="${ contextPath }/resources/img/common/logo-lahol2.png" class = "logoimg"
					style="width : 30px; height: 30px;">
					경고
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				
				<h5 class="sorry-text"> 삭제 유의사항 </h5> 
	            <h6>클래스 삭제 시 업로드하신 클래스의 내용과 함께 댓글과 질의응답 </h6>
	            	<h6 style="color:red"> 모두 삭제되며 복구가 어렵습니다. </h6>
	                <h6> * 클래스가 종료되어 삭제를 하시는 경우라면 
	               	 클래스가 종료시 일반사용자들에게 더 이상 노출이 되지 않으며 사업자 본인만 클래스 내용들을 확인할 수 있음을 알려드립니다. 
	                </h6>
	
						<br>
						<p class="alert-text">
						정말 삭제하시겠습니까? 
						</p>
					</p>
					
					</div>
					<div class="modal-footer" style="background-color: #4B654A;">
					<button type="button" class="btn btn-danger" onclick="location.href='${ contextPath }/coffeeclass/deleteClass?classNo=${ coffeeclass.classNo }'"
					>삭제</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</table>
			</div>
			</div>
		</div>
 
  
 	 <!-- 신고Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #4B654A;">
				<h5 class="modal-title" id="exampleModalLabel" style="color: white;">
					<img src="${ contextPath }/resources/img/common/logo-lahol2.png" style="width : 30px; height: 30px;">
					클래스신고
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<h5  style="text-align: center; padding: 5vh;">페이지 사용에 불편을 드려 죄송합니다. <br> 신고가 접수되면 3일내로 처리됩니다. </h5>
					<form action = "${ contextPath }/coffeeclass/classreport" method="post">
					<td><input name ="classNo" type="hidden" value="${ coffeeclass.classNo }"></td>
					<table style="width: 100%;">					
						<tr>
							<td>신고 클래스</td>
							<td aria-readonly="true">${ coffeeclass.className }</td>
						</tr>
						<tr>
							<td>신고사유</td>
							<td>
								<select name="rpReason">
									<option disabled="disabled" selected>
										--신고사유선택--
									</option>
									<option>
										강사의 부적절한 언어 및 행위
									</option>
									<option>
										강사 허위자격(실력의심)
									</option>
									<option>
										강의 중 상품강매
									</option>
									<option>
										기타
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>사유 상세 설명</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="rpDeets" style="width: 100%; line-height: 15vh;"></textarea>
							</td>
						</tr>
					</table>
						<br>
						<p class="alert-text" style="color:rgb(170, 42, 42); font-size: 12px;">
						허위신고일 경우, 신고자의 활동이 제한될 수 있으니 신중하게 신고해주세요. 
						</p>					
					<div class="modal-footer"  style="background-color: #4B654A;">
					<button type="submit" class="btn btn-danger">신고</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
					</form>
					</div>
			</div>
			</div>
		</div>
  
  

    <!-- <div> -->
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">
              상세정보
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button" role="tab" aria-controls="review" aria-selected="false">
              후기
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="qa-tab" data-bs-toggle="tab" data-bs-target="#qa" type="button" role="tab" aria-controls="qa" aria-selected="false">Q&A</button>
        </li>
        </ul>
        <div class="tab-content" id="myTabContent">
        
        
          <!-- 상세 정보 -->
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <!-- Product description section 1-->
                <div class="row align-items-center py-md-3">
                    <!--사진-->
                    <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2"><img class="d-block rounded-3" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clThumbnail }" alt="Image"></div>
                    <!--설명-->
                    <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
                    <h2 class="h3 mb-4 pb-2">클래스 소개</h2>
                    <h6 class="fs-base mb-3">${ coffeeclass.clShortDes }</h6>
                    <p class="fs-sm text-muted pb-2">${ coffeeclass.classDes }</p>
                    </div>
                </div>
              <!-- Product description section 2-->
              <div class="row align-items-center py-4 py-lg-5">
                <div class="col-lg-5 col-md-6 offset-lg-1"><img class="d-block rounded-3" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.clPhoto} " alt="Map"></div>
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4">
                <h2 class="h3 mb-4 pb-2">클래스 커리큘럼</h2>
                <p class="fs-sm text-muted pb-md-2"> ${ coffeeclass.classCurri }</p>
                </div>
              </div>
              <!-- Product description section 1-->
              <div class="row align-items-center py-md-3">
                <!--사진-->
                <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2"><img class="d-block rounded-3" src="${ contextPath }/resources/nuploadFiles/classImg/${ coffeeclass.trPhoto}" alt="Image"></div>
                <!--설명-->
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
                <h2 class="h3 mb-4 pb-2">강사 소개</h2>
                <h6 class="fs-base mb-3">${ coffeeclass.trName }</h6>
                <p class="fs-sm text-muted pb-2">${ coffeeclass.trIntro }</p>
                </div>
            </div>
              
        </div>
        
        
         <!-- 후기 -->
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab" style="background-color: blueviolet;">
          <div style="background-color: blueviolet; padding-top: 3vh;">
          <div class="clcomment">
            <table>
              <tr>
                <td>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </td>
                <td>
                  작성일자|
                </td>
                <td>
                  2020.04.20
                </td>
                <td>
                  <button class = "iconbtn">
                  <img src = "../../LaHolFront/resources/images/class/report.png"  class="iconbtn">
                </button>
              </td>
              </tr>
              <tr>
                <td>구매자아이디</td>
              </tr>
              <tr>
                <td>내용</td>
              </tr>
            </table>
          </div>
          <div class="clcomment">
            <table>
                <tbody>
              <tr>
                <td>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </td>
                <td>
                  작성일자|
                <td>
                <td>
                  2020.04.20
                <td>
                  <button class = "iconbtn btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" >
                  <img src = "../../LaHolFront/resources/images/class/report.png"  class="iconbtn">
                </button>
              </td>
              </tr>
              <tr>
                <td>dayoon1004</td>
              </tr>
              <tr>
                <td>아 진짜 별로에요 묻는거 대답 하나도 못하시고.. </td>
              </tr>
            </tbody>
            </table>
        </div>
      </div>
     </div>
        
        
        <!-- Q&A -->
        <div class="tab-pane fade" id="qa" role="tabpanel" aria-labelledby="qa-tab">
          <div class="qa-content">
            <div class="writeBtn">
              <button id="wBtn">Write</button>
            </div>
            <div class="accordionMenu">
              <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                      <table class="qaTable">
                        <tr>
                          <td>1</td>
                          <td>답변완료</td>
                          <td colspan="5">주차장은 최대 몇 대 가능한가요?</td>
                          <td>dd****</td>
                          <td>2020-12-25</td>
                        </tr>
                      </table>
                    </button>
                  </h2>
                  <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                      <div class="qaAnswer">
                        <div>
                          <h1 style="color: #810B0B;">Q</h1>
                          주차장은 최대 몇 대 가능한가요?
                        </div>
                        <hr>
                        <div>
                          <p>
                            <h1 style="color: #4B654A;">A</h1>
                            안녕하세요 고객님.
                            00 카페입니다.
      
                            주차장은 총 10대 가능합니다.
      
                            방문 시에 참고 부탁드립니다.
      
                            감사합니다.
                            좋은 하루 보내세요.
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="flush-headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                      <table class="qaTable">
                        <tr>
                          <td>2</td>
                          <td>답변완료</td>
                          <td colspan="5">주차장은 최대 몇 대 가능한가요?</td>
                          <td>dd****</td>
                          <td>2020-12-25</td>
                        </tr>
                      </table>
                    </button>
                  </h2>
                  <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                      <div class="qaAnswer">
                        <div>
                          <h1 style="color: #810B0B;">Q</h1>
                          주차장은 최대 몇 대 가능한가요?
                        </div>
                        <hr>
                        <div>
                          <p>
                            <h1 style="color: #4B654A;">A</h1>
                            안녕하세요 고객님.
                            00 카페입니다.
      
                            주차장은 총 10대 가능합니다.
      
                            방문 시에 참고 부탁드립니다.
      
                            감사합니다.
                            좋은 하루 보내세요.
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="flush-headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                      <table class="qaTable">
                        <tr>
                          <td>3</td>
                          <td>답변완료</td>
                          <td colspan="5">주차장은 최대 몇 대 가능한가요?</td>
                          <td>dd****</td>
                          <td>2020-12-25</td>
                        </tr>
                      </table>
                    </button>
                  </h2>
                  <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                      <div class="qaAnswer">
                        <div>
                          <h1 style="color: #810B0B;">Q</h1>
                          주차장은 최대 몇 대 가능한가요?
                        </div>
                        <hr>
                        <div>
                          <p>
                            <h1 style="color: #4B654A;">A</h1>
                            안녕하세요 고객님.
                            00 카페입니다.
      
                            주차장은 총 10대 가능합니다.
      
                            방문 시에 참고 부탁드립니다.
      
                            감사합니다.
                            좋은 하루 보내세요.
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
          </div>
          </div>
        </div>
        </div>
        
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
      
</body>
</html>