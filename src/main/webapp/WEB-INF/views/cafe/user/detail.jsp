<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
</head>
<body>

	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<div class="container" id="detailContainer">
        <div class="row">
            <!--왼쪽-->
            <div class="col">
            <!-- <img src="../resources/images/class/classp7.jpg" style="width: 400px; height: 500px;"> -->
            <!-- carousel -->
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner" id="caroselLeft">
                <div class="carousel-item active" data-bs-interval="10000">
                  <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.mainPhoto }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                  <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.photo1 }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.photo2 }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.photo3 }" class="d-block w-100" alt="...">
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
                <input type="hidden" value="${ loginUser.id }" id="userId">
                  <table class="cf-table">
                    <thead>
                      <tr>
                        <td>
                          <p class="cf-title">${ cafeInfo.caName }
                          <button class="bullhornBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" id="bullBtn">
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
                          ${ cafeInfo.caStartTime } - ${ cafeInfo.caEndTime }
                        </td>
                      </tr>
                      <tr>
                      <c:forTokens var="addr" items="${ cafeInfo.caAddress }" delims="," varStatus="status">
                          <c:if test="${ status.index eq 0 }">
                          	<c:set var="addr1" value="${ addr }"/>
                          </c:if>
                          <c:if test="${ status.index eq 1 }">
                          	<c:set var="addr2" value="${ addr }"/>
                          </c:if>
                          <c:if test="${ status.index eq 2 }">
                          	<c:set var="addr3" value="${ addr }"/>
                          </c:if>
                          </c:forTokens>
                        <td>
                        <i class="fa fa-map-marker" aria-hidden="true"></i> &nbsp;
                        ${ addr2 } ${ addr3 }</td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fa fa-wifi" aria-hidden="true"></i> &nbsp;
                          	${ cafeInfo.wifi }
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fa fa-male" aria-hidden="true"></i><i class="fa fa-female" aria-hidden="true"></i> &nbsp;
                          	${ cafeInfo.toilet }
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fa fa-car" aria-hidden="true"></i> &nbsp;
                          	${ cafeInfo.parking }
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <i class="fa fa-envelope-o" aria-hidden="true"></i> 카페 소개 &nbsp;
	                       <pre style="font-family: 'NEXON Lv1 Gothic OTF Bold';">${ cafeInfo.message }</pre>
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
                    <label for="modal-ck" id="menuBtn" onclick="menuBtn">MENU</label> 	
                    
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script>
		const id = document.getElementById("userId").value;

	    const here = document.getElementById("ForHere");
	    here.addEventListener("click", function(){
	    	console.log(id);
	    	if(id != ""){
	      	location.href='${ contextPath }/cafe/here?caCode=${ cafeInfo.caCode }';
	    	}else{
	    		Swal.fire({
	    			  text: '로그인이 필요한 서비스입니다.로그인을해주세요',
	    			  imageUrl: 'https://user-images.githubusercontent.com/59958929/115962683-89f1e000-a557-11eb-9a02-289523c91e1c.png',
	    			  imageWidth: 400,
	    			  imageHeight: 200,
	    			  imageAlt: 'Custom image',
	    			  confirmButtonColor: '#4B654A',
	    		}).then((result) => {
	    			location.href='${ contextPath }/member/loginView';
	    		})
	    		
	    	}
	    });

	
	    const togo = document.getElementById("ToGo");
	    togo.addEventListener("click", function(){
	    	if(id != ""){
	    		location.href='${ contextPath }/cafe/togo?caCode=${ cafeInfo.caCode }';
		    	}else{
		    		Swal.fire({
		    			text: '로그인이 필요한 서비스입니다.로그인을해주세요',
		    			  imageUrl: 'https://user-images.githubusercontent.com/59958929/115962683-89f1e000-a557-11eb-9a02-289523c91e1c.png',
		    			  imageWidth: 400,
		    			  imageHeight: 200,
		    			  imageAlt: 'Custom image',
		    			  confirmButtonColor: '#4B654A',
		    		}).then((result) => {
		    			location.href='${ contextPath }/member/loginView';
		    		})
		    		
		    	}
	    });
	    
	    
	    //신고 모달
	     const bullBtn = document.getElementById("bullBtn");
	     bullBtn.addEventListener("click", function(){
    	if(id == ""){
	    		Swal.fire({
	    			  text: '로그인이 필요한 서비스입니다.로그인을해주세요',
	    			  imageUrl: 'https://user-images.githubusercontent.com/59958929/115962683-89f1e000-a557-11eb-9a02-289523c91e1c.png',
	    			  imageWidth: 400,
	    			  imageHeight: 200,
	    			  imageAlt: 'Custom image',
	    			  confirmButtonColor: '#4B654A',
	    		}).then((result) => {
	    			location.href='${ contextPath }/member/loginView';
	    		})
	    		
	    	}
	    });
    </script>

	
	<!-- Cafe Modal -->
	<jsp:include page="/WEB-INF/views/cafe/user/cafeReport.jsp"/>

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
            <button class="nav-link" id="qa-tab" data-bs-toggle="tab" data-bs-target="#qa" type="button" role="tab" aria-controls="qa" aria-selected="false">Q & A</button>
        </li>
        </ul>
        <div class="tab-content" id="myTabContent">
       
          <!-- 상세 정보 -->
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <%@include file="./cafeMap.jsp" %>
        </div>
        <!-- 후기 -->
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
          <%@include file="./caReview.jsp" %>
        </div>
        <!-- Q&A -->
        <div class="tab-pane fade" id="qa" role="tabpanel" aria-labelledby="qa-tab">
          <%@include file="./qna.jsp" %>
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
	</div>
	
	 <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
	
</body>
</html>