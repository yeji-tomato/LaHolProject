<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 후기</title>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div class="review-content">
		<c:forEach var="cr" items="${ caReview }">
          <table id="reviewLeft">
            <thead>
              <tr>
                <td>
                <i class="far fa-user-circle"></i>
                  	<!-- 별점 -->
                  	<c:choose>
                  		<c:when test="${ cr.crevGra eq 0.5 }">
                  			<i class="fas fa-star-half-alt"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 1.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 1.5 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star-half-alt"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 2.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 2.5 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star-half-alt"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 3.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 3.5 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star-half-alt"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 4.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 4.5 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star-half-alt"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 5.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  		</c:when>
                  	</c:choose>
                    
                </td>
              </tr>
            </thead>
            <tbody>
              <tr>
              <fmt:formatDate var="date" value="${ cr.crevDate }" pattern="yyyy-MM-dd"/>
                <td>${ cr.id } &nbsp; | &nbsp; ${ date }
                <button data-bs-toggle="modal" data-bs-target="#userModal${ cr.crevNo }" id="userReport">
                      <!-- <i class="fas fa-bullhorn"></i> -->
                      <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                </button>
                </td>
                
              </tr>
              <tr>
                <td>
                  <img src="${ contextPath }/resources/muploadFiles/review/${ cr.crevIchName }" id="reviewImg">
                </td>
                <td>
                  <div id="rv-content">
                      <p id="rv-pre">
						${ cr.crevCon }
                      </p>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          </c:forEach>
          <!-- 버튼 -->
          <div class="floatLeft" id="btnFloat">
            <div>
            <c:if test="${ pi.currentPage > 1 }">
            <c:url var="before" value="/cafe/detail?caCode=${ param.caCode }">
              	<c:param name="page" value="${ pi.currentPage -1 }" />
           	 </c:url>
              <a class="rBtn" id="upBtn" href="${ before }">
              	<i class="fa fa-chevron-up" aria-hidden="true"></i>
              </a>
             </c:if>
            </div>
            <div>
            <c:if test="${ pi.currentPage < pi.maxPage }">
            <c:url var="after" value="/cafe/detail?caCode=${ param.caCode }">
                   <c:param name="page" value="${ pi.currentPage + 1 }" />
	        </c:url>
              <a class="rBtn" id="downBtn" href="${ after }" >
              	<i class="fa fa-chevron-down" aria-hidden="true"></i>
              </a>
             </c:if>
            </div>
          </div>
        </div>
        
       

        
<!-- 후기 신고 모달 -->
  <!-- 회원 신고 -->
  <!-- Modal -->
  <c:forEach var="cr" items="${ caReview }">
	<div class="modal fade" id="userModal${ cr.crevNo }" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<form action="${ contextPath }/cafe/userReport" id="userReportForm" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${ sessionScope.loginUser.id }" id="userId" name="reporterId">
 		<input type="hidden" value="${ param.caCode }" id="caNo" name="itemCode">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="userModalLabel" style="color: white;">
				<img src="${ contextPath }/resources/img/common/whiteLogo.png" class = "logoimg" name="">
				댓글신고
			</h5>
			<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" ></button>
			</div>
			<div class="modal-body">
			<h5 class="sorry-text">페이지 사용에 불편을 드려 죄송합니다. <br> 신고가 접수되면 3일내로 처리됩니다. </h5>
				<input type="hidden" id="reporteeId" value="${ cr.id }" name="reporteeId">
				<table class = "rp_reason_table">
					<tr>
						<td><i class="far fa-user-circle"></i>&nbsp;신고대상 : ${ cr.id }</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="imgName" value="${ cr.crevIchName }">
							<img src="${ contextPath }/resources/muploadFiles/review/${ cr.crevIchName }" style="width: 30vw; height: 40vh;" ><br>
						</td>
				   </tr>
				   <tr>
						<td>
						 	${ cr.crevCon }
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-top: 3%">신고사유</td>
					</tr>
					<tr>
						<td colspan="2">
							<select style="width: 100%;" name="reportType" id="userReason">
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
							<textarea class="ihateyou" id="userReportcontent" name="reportReason"></textarea>
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
				<button type="button" onclick="validate('${ ca.crevNo }')"  class="btn btn-danger">신고</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
		</div>
		</form>
		</div>
	</div>
	
    </c:forEach>
    
    <script>
    //신고 모달
    const loginId = $("#userId").val();
   
	     const userReport = document.getElementById("userReport");
	     userReport.addEventListener("click", function(){   	
	    	 if(loginId == ""){
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
    
    
    
    	function validate(crevNo){
    		
    		var userReason =  $("#userReason option:selected").val();
    		var userReportcontent = $("#userReportcontent").val();
    		var reporteeId = $("#reporteeId").val();
    		var caNo = $("#caNo").val();
    		var reporterId = $("#userId").val();
    		
    		// 신고사유, 신고내용 중 입력 되지 않은 값이 있을 시 alert 후 focus 처리 -> submit X
			if(userReason == '--신고사유선택--'){
				Swal.fire({
	    			  text: '신고사유를 선택해 주세요.',
	    			  imageUrl: 'https://ewenbell.com/10k/mcache/Daylesford%20Delicious/03_MG_9665.jpg',
	    			  imageWidth: 400,
	    			  imageHeight: 500,
	    			  imageAlt: 'Custom image',
	    			  confirmButtonColor: '#810B0B',
	    		}).then((result) => {
	    			$("#reason").focus();
					return false;
	    		});
			
			}
			
			
			if(userReportcontent == ''){
				Swal.fire({
	    			  text: '신고내용을 작성해 주세요.',
	    			  imageUrl: 'https://ewenbell.com/10k/mcache/Daylesford%20Delicious/03_MG_9665.jpg',
	    			  imageWidth: 400,
	    			  imageHeight: 500,
	    			  imageAlt: 'Custom image',
	    			  confirmButtonColor: '#810B0B',
	    		}).then((result) => {
	    			$("#reportcontent").focus();
					return false;
	    		});
			
			}else{
				Swal.fire({
	    			  text: '신고 처리가 완료 되었습니다!',
	    			  imageUrl: 'https://images.unsplash.com/photo-1591091276770-c430bd287ff1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
	    			  imageWidth: 400,
	    			  imageHeight: 200,
	    			  imageAlt: 'Custom image',
	    			  confirmButtonColor: '#e1d7ca',
	    		}).then((result) => {
	    			$("#userReportForm").submit();
	    			
	    		})
				
			}
    		
    		
    	}
    </script>
    
    
    
    
    
    
</body>
</html>