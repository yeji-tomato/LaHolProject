<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClassDetail</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="classdetail.css">
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <style>
    /* 이랜드 나이스체 */
    @font-face {
            font-family: 'ELAND_Nice_M';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/ELAND_Nice_M.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }   

        *{
            font-family: 'ELAND_Nice_M';
        }
      /* 캐로셀 */
     #caroselLeft img{
        width: 500px;
        height: 500px;
     }

     #myTab{
       padding-top: 5%;
     }

     .nav-item{
       padding-left: 5px;
     }

     .nav-link{
       width: 15vw;
       margin: 3%;
       margin-left: 40%;
     }

     .nav-tabs .nav-link.active{
      background-color: #E5BD62;
      color: white;
     }

     .nav-tabs .nav-link{
      background-color: #5A452E;
      color: white;
      padding: 5%;
     }

     .tab-pane{
       background-color: #f6ebdb;
     }

     /* 클래스 정보 */
     .cl-info{
       padding: 5%;
       border: 3px solid #ada397;
       border-radius: 5vw;
       /* background-color: #f1d1ac; */
     }

     .cl-title{
      font-family: 'ELAND_Nice_M';
      font-size: 30px;
     }

     .fa-bullhorn{
       font-size: 20px;
       /* padding: 5%; */
       float: right;
       color: #810B0B;
     }

     .fa-coffee{
       color: #E5BD62;
     }

     .cl-table td{
       padding: 1%;
     }

     .cl-table ul{
      list-style:none;
      text-align: center;
      padding: 3%;
     }

     .btnDiv{
       margin-top: 5%;
       text-align: center;
     }

     #register-btn{
      background-color: #935039;
      color: white;
     }

     #register-btn:hover{
      background-color: #c9a89c;
      color: black;
     }

     #cart-btn{
      background-color: #e3a259;
      color: white;
     }

     #cart-btn:hover{
      background-color: #f1d1ac;
      color: black;
     }

     .clcomment{
       border: 1px solid black;
       width : 80%;
       /* margin:3vh; */
       margin-top: 3vh;
       margin-left: 6%;
       background-color: #f1d1ac;
     }

     .qna>table{
         border: 1px solid black;
         width : 80%;
         margin:3vh;
         margin-left: 6%;
     }

     #delete-modal-1{
         background-color: rgb(212, 46, 46);
     }

     #delete-modal-2{
         background-color: rgb(230, 224, 224);
     }

     .qna{
         margin-top: 3vh;
         border: 1px solid rgb(182, 142, 127);
         border-radius: 3vw;
     }

     #qa{
        
     }

         /* 네비부분 */
         nav{
            background-color: transparent;
            position: fixed;
            z-index: 99;
            width: 100%;
            padding: 30px 10px;
        }

        .menuWrapper {
            display: flex;
            margin : 0;
            padding : 0;
            z-index: 10;
            border-bottom: 1.5px solid white;
            height: 80px;
            align-items: flex-start;
        }

        .menuWrapper > * {
            display: flex;
            text-align: center;
            box-sizing: border-box;
        }

        .menuWrapper .mainMenu {
            width : 43vw;
            min-width : 600px;
            max-width : 50vw;
        }

        .mainMenu ul,
        .loginArea .loginMenu ul {
            padding: 0;
            margin : 0;
            display: flex;
            align-items: flex-start;
            vertical-align: middle;
        }
        .mainMenu ul li {
            align-self: flex-start;
            list-style: none;
            text-align: center;
            padding : 38px;
            line-height: 1px;
        }

        .mainMenu a {
            text-decoration: none;
            color : white;
            transition: all 0.5s linear;
        }

        .mainMenu a:hover {
            /* color : #F3D798; */
            color : #4B654A;
            transition: all 0.5s linear;
        }

        .logoArea {
            width : 10%;
            min-width: 130px;
            height: 100%;
            text-align: center;
            margin : 0;
            display: flex;
            align-items: center;
        }

        .logoArea img {
            width : 80px;
            height: 60px;
            margin : auto;
            display: block;
        }

        .loginArea {
            width : 45vw;
        }

        .loginArea .infoArea {
            width : 60%;
            /* min-width: 400px; */
        }

        .loginArea .loginMenu {
            width: 40%;
            min-width: 200px;
            float: right;
            text-align: right;
        }

        .loginArea .loginMenu ul {
            display: flex;
            justify-content: flex-end;
        }

        .loginArea .loginMenu ul li {
            list-style-type: none;
            text-align: center;
            padding : 38px 15px;
            line-height: 1px;
        }

        .loginArea .loginMenu ul li a {
            text-decoration: none;
            color : white;
            transition: all 0.5s linear;
        }

        .loginArea .loginMenu a:hover {
            /* color : #F3D798; */
            color : #4B654A;
            transition: all 0.5s linear;
        }

        nav.active{
            background: #CDC2AF;
        }
    </style>
    <!--마우스 오버 카페정보-->
    <style type='text/css'>
      .help-tip{

      border-radius: 50%;

      width: 24px;

      height: 24px;

      font-size: 14px;

      line-height: 26px;

      cursor: default;

      }



      .help-tip:before{

      content:'☕';

      font-weight: bold;

      color:#fff;

      }

      .help-tip:hover div{

      display:block;

      transform-origin: 100% 0%;

      -webkit-animation: fadeIn 0.3s ease-in-out;

      animation: fadeIn 0.3s ease-in-out;



      }



      .help-tip div{
      position: relative;

      display: none;

      text-align: left;

      background-color: #1E2021;

      padding: 20px;

      width: 300px;

      border-radius: 3px;

      box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);

      color: #FFF;

      font-size: 13px;

      line-height: 1.4;

      }



      .help-tip div:before{

      content: '';

      width:0;

      height: 0;

      border:6px solid transparent;

      border-bottom-color:#1E2021;

      right:5px;

      top:-12px;

      }



      .help-tip div:after{

      width:100%;

      height:300px;

      content:'';

      position: absolute;

      top:-40px;

      left:0;

      }

      .help-tip:hover div{

      display:block;

      transform-origin: 100% 0%;


      -webkit-animation: fadeIn 0.3s ease-in-out;

      animation: fadeIn 0.3s ease-in-out;



      }



      .help-tip div{

      display: none;

      text-align: left;

      background-color: #f5ddaaf3;

      padding-bottom: 32px;

      padding-left: 35px;

      width: 50vh;

      border-radius: 5px;

      box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);

      left: 20px;

      top : -60px;

      color: #FFF;

      font-size: 13px;

      line-height: 1.4;

      }



      .help-tip div:before{

      content: '';

      width:0;

      height: 0;

      border:6px solid transparent;

      border-bottom-color:#1E2021;

      right:10px;

      top:-12px;

      }



      .help-tip div:after{

      width:100%;

      height:300px;

      content:'';

      top:-40px;

      left:0;

      }



      </style>  

</head>
<body>
   


    <div class="container">
        <div class="row">
            <!--왼쪽-->
            <div class="col">
            <!-- <img src="../resources/images/class/classp7.jpg" style="width: 400px; height: 500px;"> -->
            <!-- carousel -->
            <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner" id="caroselLeft">
                <div class="carousel-item active" data-bs-interval="10000">
                  <img src="../resources/images/class/classp7.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                  <img src="https://images.unsplash.com/photo-1442512595331-e89e73853f31?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://images.unsplash.com/photo-1511537190424-bbbab87ac5eb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" class="d-block w-100" alt="...">
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
                          <pre class="cl-title">르꼬르동블루 교수가 알려주는 레몬디저트</pre>
                        </td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>주최카페</td>
                        <td colspan="2">Viktoria Blanc</td>
                      </tr>
                      <tr>
                        <td>연계 카페명
                        </td>
                        <td>Viktoria Blanc 
                        <!--마우스 오버시 등장하는 정보-->              
                        <div class="help-tip" style="float:right;">
                    
                          <div class="info">
                          <p>카페이름 : 빅토리아 블랑 </p>
                          <p>카페 위치 : 서울시 마포구 연남동  </p>
                          <a href = "../cafe/user/detail/detail.html">☕카페보러가기</a>
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
                            <li>난이도</li>
                            <li>소요시간</li>
                          </ul>
                        </td>
                      </tr>
                      <tr>
                        <td>날짜</td>
                        <td colspan="2">
                          <select style="width: 80%;">
                            <option value="" class = "selectdate">날짜</option>
                            <option value="" class = "selectdate">2020-03-24 수</option>
                            <option value="" class = "selectdate">2020-03-25 목</option>
                            <option value="" class = "selectdate">2020-03-26 금</option>
                            <option value="" class = "selectdate">2020-03-26 토</option>
                          </select>          
                        </td>
                      </tr>
                      <tr>
                        <td>시간</td>
                        <td colspan="2">
                          <select style="width: 80%;">
                            <option value="" class = "selecttime">시간</option>
                            <option value="" class = "selecttime">09:00 - 11:00</option>
                            <option value="" class = "selecttime">13:00 - 15:00</option>
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
                  <div class="btnDiv">
                    <button type="button" class="btn" id = "register-btn" onclick="location.href='bus_class_fix.html'">
                      클래스 정보수정
                      <i class="fa fa-wrench" aria-hidden="true"></i>
                    </button>                     
                        <!-- Button trigger modal -->
                      <button type="button" class="btn btn-primary" id = "cart-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                          클래스 삭제
                      <i class="fa fa-trash" aria-hidden="true"></i> 
                    </div>     
                   
              </div>
        </div>
    </div>
  </div>
  
  <!-- 삭제 확인 모달 -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">클래스 삭제 알림</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" style="text-align: center;">
          <클래스명>을 정말 삭제하시겠습니까? <br><br>
          삭제하실 경우
          <br> 등록된 정보와 회원들의 후기도 함께 삭제되며, 복구가 어렵습니다. <br>
        </div>
        <div class="modal-footer">
          <button type="button" id = "delete-modal-1" class="btn btn-primary">위 내용을 확인했으며 클래스를 삭제하겠습니다</button>
          <button type="button" id = "delete-modal-2" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
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
                    <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2"><img class="d-block rounded-3" src="../resources/images/class/classp8.jpg" alt="Image"></div>
                    <!--설명-->
                    <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
                    <h2 class="h3 mb-4 pb-2">클래스 소개</h2>
                    <h6 class="fs-base mb-3">클래스 한 줄 소개</h6>
                    <p class="fs-sm text-muted pb-2">클래스 소개 상세 : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit.</p>
                    </div>
                </div>
              <!-- Product description section 2-->
              <div class="row align-items-center py-4 py-lg-5">
                <div class="col-lg-5 col-md-6 offset-lg-1"><img class="d-block rounded-3" src="../resources/images/class/classp2.jpg" alt="Map"></div>
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4">
                <h2 class="h3 mb-4 pb-2">클래스 커리큘럼</h2>
                <h6 class="fs-base mb-3">Factory information</h6>
                <p class="fs-sm text-muted pb-md-2"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
                </div>
              </div>
              <!-- Product description section 1-->
              <div class="row align-items-center py-md-3">
                <!--사진-->
                <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2"><img class="d-block rounded-3" src="../resources/images/class/classp8.jpg" alt="Image"></div>
                <!--설명-->
                <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
                <h2 class="h3 mb-4 pb-2">클래스 소개</h2>
                <h6 class="fs-base mb-3">클래스 한 줄 소개</h6>
                <p class="fs-sm text-muted pb-2">클래스 소개 상세 : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit.</p>
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
                <td>
                <td>
                  2020.04.20
                <td>
                  <button class = "iconbtn"><img src = "../../LaHolFront/resources/images/class/report.png"  class="iconbtn">
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
                  <button class = "iconbtn"><img src = "../../LaHolFront/resources/images/class/report.png"  class="iconbtn">
                </button>
              </td>
              </tr>
              <tr>
                <td>dayoon1004</td>
              </tr>
              <tr>
                <td>아 진짜 별로에요 ㅡㅡ 선생님이 갓 바리스타 되셨는지 제가 묻는거 대답 하나도 못하시고.. </td>
              </tr>
            </tbody>
            </table>
        </div>
      </div>
        </div>
        <!--Q&A-->
         <div class="tab-pane fade" id="qa" role="tabpanel" aria-labelledby="qa-tab">
            <div class="qna">
                <div class="question" style="border-bottom: 1px solid black;">
                    <table>
                        <tr>
                            <!--세번째 행-->
                            <th rowspan="5" style="font-size: 70px; color:pink; width: 80px; border-right: black 1px solid;""><b>Q</b></th>
                            <td style="min-width: 35px;">질문자</td>
                            <td >khstudent04</td>
                            <td>질문등록일</td>
                            <td>2020.01.04</td>
                            <td>
                                <button type="button" class="btn btn-outline-warning">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">제가 프랑스어를 못하는데 강의는 프랑스어로 진행되나요?</td>    
                        </tr>
                    </table>
                </div>
                <div class="answer">
                    <table>
                        <tr>
                            <!--세번째 행-->
                            <th rowspan="5" style="font-size: 70px; color : rgb(255, 123, 0); width: 80px; border-right: black 1px solid;""><b>A</b></th>
                            <td style="min-width: 45px;">아이디</td>
                            <td >khstudent04</td>
                            <td>질문등록일</td>
                            <td>2020.01.04</td>
                        </tr>
                        <tr>
                            <!--네번째 행-->
                            <td colspan="4">강의는 영어로 진행되면 통역사 분이 같이 계십니다!</td>    
                        </tr>
                    </table>
                </div>
            </div>
           
            <div class="qna">
                <div class="question" style="border-bottom: 1px solid black;">
                    <table>
                        <tr>
                            <!--세번째 행-->
                            <th rowspan="5" style="font-size: 70px; color:pink; width: 80px; border-right: black 1px solid;""><b>Q</b></th>
                            <td style="min-width: 35px;">질문자</td>
                            <td >khstudent04</td>
                            <td>질문등록일</td>
                            <td>2020.01.04</td>
                        </tr>
                
                        <tr>
                            <!--네번째 행-->
                            <td colspan="4">제가 프랑스어를 못하는데 강의는 프랑스어로 진행되나요?</td>    
                        </tr>
                    </table>
                </div>
                <div class="answer">
                    <table>
                        <tr>
                            <!--세번째 행-->
                            <th rowspan="5" style="font-size: 70px; color : rgb(255, 123, 0); width: 80px; border-right: black 1px solid;""><b>A</b></th>
                            <td style="min-width: 45px;">아이디</td>
                            <td >khstudent04</td>
                            <td>질문등록일</td>
                            <td>2020.01.04</td>
                        </tr>
                
                        <tr>
                            <!--네번째 행-->
                            <td colspan="4">강의는 영어로 진행되면 통역사 분이 같이 계십니다!</td>    
                        </tr>
                    </table>
                </div>
            </div>

            <div class="qna">
                <div class="question" style="border-bottom: 1px solid black;">
                    <table>
                        <tr>
                            <!--세번째 행-->
                            <th rowspan="5" style="font-size: 70px; color:pink; width: 80px; border-right: black 1px solid;""><b>Q</b></th>
                            <td style="min-width: 35px;">질문자</td>
                            <td >khstudent05</td>
                            <td>질문등록일</td>
                            <td>2020.01.04</td>
                        </tr>
                
                        <tr>
                            <!--네번째 행-->
                            <td colspan="4">강의전 준비할게 있나요?</td>    
                        </tr>
                    </table>
                </div>
                <div class="answer">
                    <table>
                        <tr>
                            <!--답변정보-->
                            <th rowspan="5" style="font-size: 70px; color : rgb(255, 123, 0); width: 80px; border-right: black 1px solid;""><b>A</b></th>
                            <td>답변등록일</td>
                            <td>2020.01.04</td>
                        </tr>
                        <tr>
                            <!--답변내용-->
                            <td colspan="4">준비물 없이 편하게 오시면 됩니다~^^</td>    
                        </tr>
                    </table>
                </div>
            </div>
       <!--tab영역끝-->

       <div class="qna">
        <table style="border:0;">
             <tr name="trStaff">
                 <td style="width:150px; font-size: 40px; text-align: center; color: lightpink;" rowspan="1"><strong>Q</strong></td>
                 <td style="width:800px">
                     <p style="float: left;">질문등록일</p>
                     <p>2020.01.19</p>
                     <h3>제가 프랑스어를 못하는데 강의 들을 수 있나요??</h3>
                 </td>
                 <td>
                     <button  type="button" class="btn btn-outline-warning" name="addAnswer" style="width: 80px;">답변달기</button>
                 </td>
             </tr>  
     </table>
     </div>
  
 <script>
     //답변 추가 버튼
     $(document).on("click","button[name=addAnswer]",function(){
         
         var addAnswerText =     '<tr name="trStaff">'+
             '    <td class="active col-md-1" style="font-size: 40px; text-align: center; color: lightpink;"><strong>A</strong></td>'+
             '    <td class="col-md-11">'+
             '        <textarea name="answer" style="resize:none; width : 95%; height:50px;"></textarea>'+
             '    </td>'+
             '    <td>'+
             '        <button class="btn btn-default" name="regAnswer">등록</button>'+
             '        <button class="btn btn-default" name="delAnswer">삭제</button>'+
             '    </td>'+
             '</tr>';
             
         var trHtml = $( "tr[name=trStaff]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
         
         trHtml.after(addAnswerText); //마지막 trStaff명 뒤에 붙인다.
         
     });
     //답변 등록 버튼
     $(document).on("click","button[name=regAnswer]",function(){
        alert("등록되었습니다.");
 
        //textarea POST
     });
     
     //답변 삭제 버튼
     $(document).on("click","button[name=delAnswer]",function(){
         
         var trHtml = $(this).parent().parent();
         
         trHtml.remove(); //tr 테그 삭제
         
     });
 </script>
       

        </div>
        </div>

      
</body>
</html>