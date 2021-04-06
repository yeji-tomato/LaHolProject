<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 세부 페이지</title>
<!-- detail css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/detail.css">
<!--  매장 또는 포장 -->
<!-- choose css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/choose.css">
<!-- 아이콘 css -->
<script src="https://kit.fontawesome.com/2ada8d19a4.js" crossorigin="anonymous"></script>
</head>
<body>

	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubarBG.jsp"/>

	<div class="container" id="detailContainer">
        <div class="row">
            <!--왼쪽-->
            <div class="col">
            <!-- <img src="../resources/images/class/classp7.jpg" style="width: 400px; height: 500px;"> -->
            <!-- carousel -->
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner" id="caroselLeft">
                <div class="carousel-item active" data-bs-interval="10000">
                  <img src="https://i.pinimg.com/564x/f2/ca/54/f2ca546edb3cd09e21cb3c64578f3232.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                  <img src="https://i.pinimg.com/564x/b6/a3/e0/b6a3e0fadac5e060c60e82683162c76d.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://i.pinimg.com/564x/18/9a/64/189a64011192664392d7705825e2aa1a.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://i.pinimg.com/564x/a1/ab/b6/a1abb6390ea859b66dd4041c3d2ec510.jpg" class="d-block w-100" alt="...">
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
            <div class="col-5">
              <div class="cf-info">
                <div class="cafeTB">
                  <table class="cf-table">
                    <thead>
                      <tr>
                        <td>
                          <p class="cf-title">LaHol 카페
                          <button class="bullhornBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <i class="fa fa-bullhorn" aria-hidden="true"></i>
                          </button>
                          </p>
                        </td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <i class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;
                          AM. 10:00 - PM. 11:00 
                        </td>
                      </tr>
                      <tr>
                        <td>
                        <i class="fa fa-map-marker" aria-hidden="true"></i> &nbsp;
                        경기도 용인시 호이동 둘리마을</td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fa fa-wifi" aria-hidden="true"></i> &nbsp;
                          무선 인터넷
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fa fa-male" aria-hidden="true"></i><i class="fa fa-female" aria-hidden="true"></i> &nbsp;
                          남/녀 화장실 구분
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fa fa-car" aria-hidden="true"></i> &nbsp;
                          주차 가능
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fa fa-envelope-o" aria-hidden="true"></i> &nbsp;
                          신메뉴 나왔습니다!
                          얼른 오세요!!!!
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                  <div class="btnDiv">
                    <!-- <button class="btnCafe" id="menuBtn" onclick="menuClick">
                      MENU
                    </button> -->
                    <input class="modal-ck" type="checkbox" id="modal-ck" name="modal-ck"/>
                    <label for="modal-ck" id="menuBtn">MENU</label> 	
                    <button class="btnCafe" id="heartBtn">
                      <i class="fa fa-heart" aria-hidden="true"></i>
                    0
                    </button>
                    <!-- 매장 또는 포장 Modal -->
                    <div class="modalChoose">		
                      <div class="modal-wrap" id="ForHere">	
                        <p id="here-text">매장</p>	          		
                        <i class="fa fa-coffee" id="htIcon" aria-hidden="true"></i>
                      </div>	
                      <div class="modal-wrap" id="ToGo">	
                        <p id="here-text">포장</p>	          		
                        <i class="fa fa-shopping-bag" id="htIcon" aria-hidden="true"></i>
                      </div>	          		
                    </div>	
                    </div>     
              </div>
        </div>
    </div>

    <!-- 매장 또는 포장 버튼 이동 -->
    <script>
      const here = document.getElementById("ForHere");
      here.addEventListener("click", function(){
        location.href='${ contextPath }/cafe/here';
      });

      const togo = document.getElementById("ToGo");
      togo.addEventListener("click", function(){
        location.href='${ contextPath }/cafe/togo';
      });
    </script>

              <!-- Modal -->
              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel" style="color: white;">
                      <img src="${ contextPath }/resources/img/common/whiteLogo.png" class="logoimg">
                      신고
                  </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                  <h5  class="sorry-text">페이지 사용에 불편을 드려 죄송합니다. <br> 신고가 접수되면 3일내로 처리됩니다. </h5>
                    <table class="rp_reason_table">
                      
                      <tr>
                        <td>신고 카페</td>
                        <td aria-readonly="true">Pro-Yonginler</td>
                      </tr>
                      <tr>
                        <td>신고사유</td>
                        <td>
                          <select>
                            <option>
                              --신고사유선택--
                            </option>
                            <option>
                              허위매장
                            </option>
                            <option>
                              예약 및 주문 제조 불일치
                            </option>
                            <option>
                              주문 시 부적절한 언어 사용
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
                          <textarea class="evidence"></textarea>
                        </td>
                      </tr>
                    </table>
                    <p>
                      <br>
                      <p class="alert-text">
                      허위신고일 경우, 신고자의 활동이 제한될 수 있으니 신중하게 신고해주세요. 
                      </p>
                    </p>
                    
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-danger">신고</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                  </table>
                </div>
                </div>
              </div>




  </div>



    <div>
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
                <img src="../../../resources/images/cafe/map.png" style="width: 100%;">
              
        </div>
        <!-- 후기 -->
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div class="review-content">
          <table id="reviewLeft">
            <thead>
              <tr>
                <td>
                  <i class="fa fa-user-circle" aria-hidden="true"></i>
                  <!-- 별점 -->
                      <i class="fa fa-star" aria-hidden="true"></i>
                      <i class="fa fa-star" aria-hidden="true"></i>
                      <i class="fa fa-star" aria-hidden="true"></i>
                      <i class="fa fa-star-half-o" aria-hidden="true"></i>
                      <i class="fa fa-star-o" aria-hidden="true"></i>
                    <button id="userReport" data-bs-toggle="modal" data-bs-target="#userModal">
                      <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                    </button>
                </td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>id1234 &nbsp; | &nbsp; 2021-04-02</td>
              </tr>
              <tr>
                <td>
                  <img src="https://i.pinimg.com/564x/dd/02/91/dd0291455ce1bb9a98f0bf8d98c2e8b5.jpg" id="reviewImg">
                </td>
                <td style="padding-left: 3%;">
                  <div id="rv-content">
                      <p id="rv-pre">
    넘흐 좋네여!!!!!!
    포근하고 안락한 분위기!
    맛있는 브랜치!
    향긋한 커피 냄새와 고소한 아메카노까지~
    잘 놀다가 갑니다!
    주문해서 딱 도착한 시간에 나올 수 있어서 
    너무 편리했어욤!
    바쁘다 바빠 현대 사회!
                      </p>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- 버튼 -->
          <div class="floatLeft" id="btnFloat">
            <div>
              <button class="rBtn" id="upBtn"><i class="fa fa-chevron-up" aria-hidden="true"></i></button>
            </div>
            <div>
              <button class="rBtn" id="downBtn"><i class="fa fa-chevron-down" aria-hidden="true"></i></button>
            </div>
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



        <!-- 회원 신고 -->
         <!-- Modal -->
	<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="userModalLabel" style="color: white;">
				<img src="${ contextPath }/resources/img/common/whiteLogo.png" class = "logoimg">
				댓글신고
			</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<h5 class="sorry-text">페이지 사용에 불편을 드려 죄송합니다. <br> 신고가 접수되면 3일내로 처리됩니다. </h5>
				<table class = "rp_reason_table">
					<tr>
						<td>신고 댓글 내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" class = "evidence" readonly>
						</td>
					</tr>
					<tr>
						<td>신고대상</td>
						<td aria-readonly="true">dayoonbabo123</td>
					</tr>
					<tr>
						<td>신고사유</td>
						<td>
							<select>
								<option>
									--신고사유선택--
								</option>
								<option>
									욕설/비방
								</option>
								<option>
									음란/부적절 언어사용
								</option>
								<option>
									허위사실 유포
								</option>
								<option>
									광고/도배
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
							<textarea class = "ihateyou"></textarea>
						</td>
					</tr>
				</table>
				<p>
					<br>
					<p class="alert-text">
					허위신고일 경우, 신고자의 활동이 제한될 수 있으니 신중하게 신고해주세요. 
					</p>
				</p>
				
				</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-danger">신고</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</table>
		</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>