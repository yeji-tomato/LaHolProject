<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ tablib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoffeeclassQNA</title>
</head>
<body>

 	<div class="tab-pane fade" id="qa" role="tabpanel" aria-labelledby="qa-tab">
 	<form id="questionInsert" action="${ contextPath }/question/insert" method="post">
 	<!-- 무슨 클래스에 대한 질문인가 -->
 	<input type="hidden" name="classNo"> <!-- 데이터 연동 후 value="${}" 값 추가하기 -->
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
          </form>
        </div>
        </div>



</body>
</html>