<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				      <th scope="row" style="font-size : 20px;">Q 
					      <c:if test="${ qna.status eq 'N' }">&nbsp; &nbsp; <p style="font-size : 10px; color : brown;">답변대기<p> </c:if>
					      <c:if test="${ qna.status eq 'Y' }">&nbsp; &nbsp; <p style="font-size : 10px; color : blue;">답변완료</p></c:if>
				      </th>
				      <td colspan="2">${ qna.question }</td>
				      <td id="userId">${ qna.userId }</td>
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
    <!-- 아이디 정규표현식 -->
	<script>	
	
	var userId=document.getElementById("userId");
	
	return userId.replace(/\w{4}$/g, "****");
	
	</script>
	<!-- 아코디언메뉴 -->
	<script>
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
     });
	</script>
  		
  	
  
  		


</body>
</html>