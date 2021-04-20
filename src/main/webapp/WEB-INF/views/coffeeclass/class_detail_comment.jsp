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
	
	


</body>
</html>