<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="color: white;">
            <img src="${ contextPath }/resources/img/common/whiteLogo.png" class="logoimg">
            신고
        </h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" ></button>
        </div>
        <div class="modal-body">
        <h5  class="sorry-text">페이지 사용에 불편을 드려 죄송합니다. <br> 신고가 접수되면 3일내로 처리됩니다. </h5>
           <input type="hidden" id="caNo" value="${ cafeInfo.caCode }">
           <input type="hidden" id="id" value="${ loginUser.id }">
          <table class="rp_reason_table">
            
            <tr>
              <td>신고 카페</td>
              <td aria-readonly="true">${ cafeInfo.caName }</td>
            </tr>
            <tr>
              <td>신고사유</td>
              <td>
                <select id="reason" name = "reasonSelect">
                  <option>
                    --신고사유선택--
                  </option>
                  <option value="허위매장">
                    	허위매장
                  </option>
                  <option value="예약 및 주문 제조 불일치">
                    	예약 및 주문 제조 불일치
                  </option>
                  <option value="주문 시 부적절한 언어 사용">
                    	주문 시 부적절한 언어 사용
                  </option>
                  <option value="기타">
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
                <textarea class="evidence" id="reportcontent"></textarea>
                <div id="ta_cnt" style="float: right;">(0 / 100)</div>
              	 <script>
                     $(document).ready(function() {
                         $('#reportcontent').on('keyup', function() {
                             $('#ta_cnt').html("("+$(this).val().length+" / 100)");
                     
                             if($(this).val().length > 100) {
                                 $(this).val($(this).val().substring(0, 100));
                                 $('#ta_cnt').html("(0 / 100)");
                             }
                         });
                     });
                 </script>
              </td>
            </tr>
          </table>

            <br>
            <p class="alert-text">
            허위신고일 경우, 신고자의 활동이 제한될 수 있으니 신중하게 신고해주세요. 
            </p>

         
          </div>
          <div class="modal-footer">
          <button class="btn btn-danger"  id="report2">신고</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          </div>
      </div>
      
      </div>
      <script>
      $(document).on('click', '#report2', function(){
    	 
    	 var caNo = $("#caNo").val();
    	 var reporterId = $("#id").val();
    	 var reason =  $("#reason option:selected").val();
    	 var reportcontent = $("#reportcontent").val();
    	 
    	 
    	// 신고사유, 신고내용 중 입력 되지 않은 값이 있을 시 alert 후 focus 처리 -> submit X
			if(reason == '--신고사유선택--'){
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
			
			
			if(reportcontent == ''){
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
			
			} else{
			
			/* return true; */

			$.ajax({
				url:"${ contextPath }/cafe/report",
				type : "post",
				data : {
					reportType : reason,
					reportReason : reportcontent,
					itemCode : caNo,
					reporterId : reporterId
				},
				success : function(data){
					Swal.fire({
		    			  text: '신고 처리가 완료 되었습니다!',
		    			  imageUrl: 'https://images.unsplash.com/photo-1591091276770-c430bd287ff1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
		    			  imageWidth: 400,
		    			  imageHeight: 200,
		    			  imageAlt: 'Custom image',
		    			  confirmButtonColor: '#e1d7ca',
		    		}).then((result) => {
		    			location.href='${ contextPath }/cafe/detail?caCode=${ cafeInfo.caCode }';
		    		})
				},
				error : function(e){
					console.log(e);
				}
			});
			
			}
			
			
      });
			
      </script>
    </div>
</body>
</html>