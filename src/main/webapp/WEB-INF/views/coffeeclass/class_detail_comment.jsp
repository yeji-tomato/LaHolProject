<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Class_Comments&QNA</title>
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
	<style>
	/* 아코디언 */
.accordionMenu{
    padding-top: 5%;
}
.accordion-button:not(.collapsed) {
    color: #060b11;
    background-color: #e1d7ca;
}

@media (min-width: 1920px){
	.review-content{
		height: 70vh;
	}
	
	.modal-wrap{
		max-height : 40vh
	}
}

@media (max-width: 1280px){
	#ForHere, #ToGo{
		height : 40vh
	}
	
}

@media (min-width: 1920px){
	#ForHere, #ToGo{
		height : 45vh
	}
	
}
	
	</style>

</head>
<body>


      <!-- 후기 -->
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div style="padding-top: 3vh;">
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
                  <button class = "iconbtn" style="background-color: transparent; border: 0px;" data-bs-toggle="modal" data-bs-target="#commentModal" >
                  <img src = "${ contextPath }/resources/img/coffeeclass/report.png" class="reportbtn">
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
                  <button class = "iconbtn" style="background-color: transparent; border: 0px;" data-bs-toggle="modal" data-bs-target="#commentModal" >
                  <img src = "${ contextPath }/resources/img/coffeeclass/report.png" class="reportbtn">
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
              <button id="askBtn" aria-hidden="true" id="Question" data-bs-toggle="modal" data-bs-target="#askModal">문의하기</button>
            </div>
            
            <table class="table table-hover" id="qnatable">
				<thead>
				    <tr>
				      <th scope="col" style="width : 200px;">답변상태</th>
				      <th scope="col" colspan="2" style="text-align:center;">질문내용</th>
				      <th scope="col" style="width : 200px;">작성자</th>
				      <th scope="col" style="width : 200px;">작성일자</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">미답변</th>
				      <td colspan="2">Mark</td>
				      <td>cd****6</td>
				      <td>2021-04-21</td>
				    </tr>
				    <tr>
				      <th scope="row">답변완료</th>
				      <td colspan="2">Jacob</td>
				      <td>Th****on</td>
				      <td>2021-01-06</td>
				    </tr>
				    <tr>
				      <th scope="row">답변완료</th>
				      <td colspan="2">Larry the Bird</td>
				      <td>la****ry</td>
				      <td>2020-06-21</td>
				    </tr>
				    <tr>
				      <th scope="row">답변완료</th>
				      <td colspan="2">배송이 늦어진다는 문자를 받긴했는데, 도대체 언제오나요?</td>
				      <td>la****ry</td>
				      <td>2020-06-21</td>
				    </tr>
				  </tbody>
			</table>
			
			<div class="accordion" id="accordionExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        Accordion Item #1
			      </button>
			    </h2>
			      <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
			       <div class="accordion-body">
			        <strong>This is the first item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
			       </div>
			      </div>
			  </div>
            
            
             
            <div class="accordionMenu">
              <div class="accordion accordion-flush" id="accordionFlushExample">
          		  <c:forEach var="qna" items="${list}">
               		<div class="accordion-item">
                 	 <h2 class="accordion-header" id="flush-headingOne">
                     <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                       <table class="qaTable">
                         <tr>
	                          <td>답변완료</td>
	                          <td colspan="5">주차장은 최대 몇 대 가능한가요?</td>
	                          <td>${ qna.question }</td>
	                          <td>${ qna.askDate }</td>
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
                          <h1 style="color: #4B654A;">A</h1>
                          <p>
				                            안녕하세요 고객님.  00 카페입니다. 주차장은 총 10대 가능합니다. 방문 시에 참고 부탁드립니다.
				                            감사합니다. 좋은 하루 보내세요.
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                </c:forEach>
                </div>
            </div>
            
         </div>
     </div>    
         
         
	


</body>
</html>