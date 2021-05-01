<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src="https://code.jquery.com/jquery-1.10.2.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
</head>
<body>

      <!-- 후기 -->
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
          <h4 style="text-align : center; margin-top:10vh;">클래스 후기</h4>
          <div>
          <h6 style="text-align : center; color : gray;">클래스를 수강하신 분들이 남긴 후기입니다. 후기는 마이페이지에서 등록할 수 있습니다.</h6>
          </div>
          <table class="table table-hover" id="recruit">
				<thead>
				    <tr>
				      <th scope="col" style="width : 200px;">사용자평점</th>
				      <th scope="col" colspan="2" style="text-align:center;">답변내용</th>
				      <th scope="col" style="width : 200px;">작성자</th>
				      <th scope="col" style="width : 200px;">등록일자</th> 
				      <th scope="col" style="width : 50px;">신고</th>
				    </tr>
				  </thead>
				  <tbody>
				  <!-- 후기 -->
				  <c:forEach var="clr" items="${ rvlist }">
				  <c:set var="star-rating" value="${ clr.cl_grade }" />
				    <tr>
				      <td id="userId">
				       <div class="rating">
				       	 <c:forEach var = "i" begin="1" end="${ clr.cl_grade }">
				       	 <i class="fa fa-star"></i>
						 </c:forEach>
			           </div>
				      </td>								 
				      <td colspan="2">${ clr.cl_review }</td>
				      <c:set var="id" value="${ clr.writer_id }"/>
               		  <c:set var="idLength" value="${ fn:length(id) - 3 }"/>
               		  <fmt:parseNumber var="ri" type="number" value="${ idLength }"/>
				      <td id="userId">${ fn:substring(id, 0, 3) }<c:forEach begin="0" end="${ri-1}">*</c:forEach></td>
				      <td>${ clr.cl_rev_date }</td>
				      <td>
				       <button style="border:transparent; background-color:transparent;">
	                      <div class="report" style="margin-bottom: 3vh;">
	                        <i class="fa fa-bullhorn" aria-hidden="true" id="reportComment" data-bs-toggle="modal" data-bs-target="#commentModal"></i>
	                      </div>
	                   </button>
				      </td>
				    </tr>
				  </c:forEach>  
				  </tbody>
			</table>   
     	</div>
     	
     	<script>
     	//신고 모달
        const loginId = $("#reportComment").val();
       
            const userReport = document.getElementById("reportComment");
            userReport.addEventListener("click", function(){
               console.log(loginId);         
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
     	</script>


	 	<!-- Q&A -->
		<div class="tab-pane fade" id="qa" role="tabpanel" aria-labelledby="qa-tab">
          <div class="qa-content">
            <div class="writeBtn">
              <button id="askBtn" class="btn btn-warning" type="button" aria-hidden="true" data-bs-toggle="modal" data-bs-target="#askModal">문의하기</button>
            </div>
            <br>
            <br>
            <table class="table table-hover" id="recruit">
				<thead>
				    <tr>
				      <th scope="col" style="width : 200px;">답변상태</th>
				      <th scope="col" colspan="2" style="text-align:center;">질문내용</th>
				      <th scope="col" style="width : 200px;">작성자</th>
				      <th scope="col" style="width : 200px;">작성일자</th>
				      <c:if test="${ loginUser != NULL && loginUser.id eq coffeeclass.clWriter }">
				      <th scope="col" style="width : 100px"></th>
				      </c:if>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach var="qna" items="${ qnalist }">
				    <!-- 질문 -->
				    <tr>									 
				      <th scope="row" style="font-size : 20px;"> 
					      <c:if test="${ qna.status eq 'N' }"> <p style="font-size : 15px; color : brown;">Q &nbsp; &nbsp; 답변대기<p> </c:if>
					      <c:if test="${ qna.status eq 'Y' }"> <p style="font-size : 15px; color : blue;"> Q &nbsp; &nbsp; 답변완료</p></c:if>
				      </th>
				      <td colspan="2">${ qna.question }</td>
				      <c:set var="id1" value="${ qna.userId }"/>
               		  <c:set var="idLength1" value="${ fn:length(id1) - 3 }"/>
               		  <fmt:parseNumber var="ri1" type="number" value="${ idLength1 }"/>
				      <td id="userId">${ fn:substring(id1, 0, 3) }<c:forEach begin="0" end="${ri1-1}">*</c:forEach></td>
				      <td>${ qna.askDate }</td>
				      	  <c:if test="${ loginUser != NULL && loginUser.id eq coffeeclass.clWriter }">
				      <th scope="col" style="width : 100px">
				          <button id="answerBtn" type="button" data-bs-toggle="modal" data-bs-target="#answerModal${qna.qnaNo}">답변하기</button>
				      </th>
				      </c:if>
				    </tr>
				    
				    <!-- 답변 -->
				    	<c:if test="${ qna.answer != null }">
				    <tr class="hide">
				      <th style="font-size : 20px;">A 
				      </th>
				      <td colspan="2"> ☞${ qna.answer }</td>
				      <td> ${ coffeeclass.trName } 강사님</td>
				      <td>${ qna.answerDate }</td>
				    </tr>
				    </c:if>
				  </c:forEach>  
				  </tbody>
			</table> 
       
     </div>    
   </div> 
	<script>	
    <!-- 아이디 정규표현식 -->
	var userId=document.getElementById("userId"){
	return userId.replace(/\w{4}$/g, "****")
	}
	
 /*   아코디언 메뉴
 
	 $(function(){
         var article = (".recruit .show1"); 
         $(".recruit .question  td").click(function() { 
             var myArticle =$(this).parents().next("tr"); 
             if($(myArticle).hasClass('hide')) { 
                 $(article).removeClass('show1').addClass('hide'); 
                 $(myArticle).removeClass('hide').addClass('show1'); 
             } 
             else { 
                 $(myArticle).addClass('hide').removeClass('show1'); 
             } 
         }); 
     });    */ 
    
	</script>
  		
  	
  
  		


</body>
</html>