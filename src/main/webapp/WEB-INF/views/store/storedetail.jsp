<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 디테일</title>
<!-- 아이콘 cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
 
<!-- 스토어 css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/store/main/detail.css">
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 
 
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
 
 <link rel="stylesheet" href="${ contextPath }/resources/css/store/detail.css?a=">
 
</head>
<style>

  .nav-tabs  #home-tab.active{
   background-color: #926736;
   color: white;
   }

</style>
<body>
<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<!-- carousel -->
	<jsp:include page="/WEB-INF/views/main/store.jsp"/>
 
	
 
	<section id="content" class="content_css"  >
			<div class="outer">
				
				<div class="galleryArea" style="margin: 0%; "> 
	
					<!-- 상단 페이지-->	
	                <div class="ifmaiton">
					<h4 style="margin-left: 365px;   font-family: Nanum Gothic; color:#797878; font-size:17px;"> 
					</h4>
					<div class="store" style="top: 5px; left: 35px; " > 
						<div class="container" style="background-color: white;" >
							<div id="bigImages">
	                            <img id="big" src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }" style="width: 430px; height:  400px"  >
	                         </div> 
	                         <div id="smallImages">
	                            <img class="small"   src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }">
	                            <img class="small"  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO2 }">
	                            <img class="small"   src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO3 }"> 
	                         </div>  
	                         <script>
	                                var bigPic = document.querySelector("#big");
	                                var smallPics = document.querySelectorAll(".small"); 
	                                
	                                for(var i =0 ; i <smallPics.length; i++){
	                                    smallPics[i].addEventListener("click",changepic);
	                                }
	                                function changepic(){
	                                    var smallPicAttribute = this.getAttribute("src");
	                                    bigPic.setAttribute("src" , smallPicAttribute);
	                                }
	 
	
	                         </script> 
						</div>
						 
						<td><br>
						<tr>
						</tr>
						</td>
					</div> 
	                 <!--수량증감-->
	                <script >
	 
	                    var sell_price;
	                    var amount;
	                    
	                    function init () {
	                        sell_price = document.form.sell_price.value;
	                        amount = document.form.amount.value;
	                        document.form.sum.value = sell_price;
	                        change();
	                    }
	                    
	                    function add () {
	                        hm = document.form.amount;
	                        sum = document.form.sum;
	                        hm.value ++ ;
	                    
	                        sum.value = parseInt(hm.value) * sell_price;
	                    }
	                    
	                    function del () {
	                        hm = document.form.amount;
	                        sum = document.form.sum;
	                            if (hm.value > 1) {
	                                hm.value -- ;
	                                sum.value = parseInt(hm.value) * sell_price;
	                            }
	                    }
	                    
	                    function change () {
	                        hm = document.form.amount;
	                        sum = document.form.sum;
	                    
	                            if (hm.value < 0) {
	                                hm.value = 0;
	                            }
	                        sum.value = parseInt(hm.value) * sell_price;
	                    }  
	                    //-->
	                    </script>  
	                    
					<div class="rvt"
						style="top: 10px;left: 550px;width: 422px;height: 402px;">
						<span><a style="font-size: 25px;  margin-left: 150px;" > 상품명<p style="margin-left:40%;"> </p></a>
	                        &nbsp <i class="fa fa-bullhorn" aria-hidden="true" style="font-size: 15px; color: rgb(190, 130, 51); "> <a>  ※지금 행사 ~~</a></i>
					     </span>
						<table id="info">
							<br>
							<br>
							<td>
							<tr>
								<p class="store_info"   > &nbsp 카테고리: ${s.ST_CATAGORY }
								</p>
							</tr>
							<br>
							<tr>
								<p class="store_info"  > &nbsp 원산지:  ${s.ORIGIN }
								</p>
							</tr>
							<br>
							<tr>
								<p class="store_info"  > &nbsp 가격:  ${s.PR_PRICE }
								</p>
							</tr>
							<br>
							</td>
							<tr>
								<p class="store_info"  > &nbsp 배송비: 2,500원
								</p>
							</tr>
	                        <br>
	                        <tr>
	                            <div class="su" style=" margin-left: 20px;  "> 
	                            <form name="form" method="get">
	                                수량 : <input type=hidden name="sell_price" value="${s.PR_PRICE }" >
	                                <input type="text" name="amount" value="1" size="3" onchange="change();" >
	                              
	                                <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();">
	                              
	                                총 금액 : <input type="text" name="sum" size="11" readonly>원
	                                </form>
	                            </div>
							</tr>
	
	
							 
	                        <div class="btnDiv">
	                            <button type="button" class="btn" id = "register-btn">
	                               바로구매
	                              <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
	                            </button>
	                            <button type="button" class="btn" id = "cart-btn">
	                              장바구니
	                              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
	                            </button>
	                            <button type="button" class="btn" id = "cart1-btn" onClick="location.href='Subscription.html'" >
	                              정기구독
	                                <i class="fa fa-shopping-bag" aria-hidden="true" ></i>
	                              </button>
	                            </div>  
							 
						</table>
					</div> 
					 
	                </div>
	                
	                <!-- 세부영역-->
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
	                            <button class="nav-link" id="qa-tab" data-bs-toggle="tab" data-bs-target="#qa" type="button" role="tab" aria-controls="qa" aria-selected="false">
	                                Q&A
	                            </button>
	                        </li>
	                        <li class="nav-item" role="presentation">
	                            <button class="nav-link" id="de-tab" data-bs-toggle="tab" data-bs-target="#de" type="button" role="tab" aria-controls="de" aria-selected="false">
	                               교환/반품
	                            </button>
	                        </li>
	                        
	                    </ul>
	                      <div class="tab-content" id="myTabContent">
	                        <!-- 상세 정보 -->
	                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
	                                <!-- Product description section 1-->
	                                <div class="row align-items-center py-md-3">
	                                    <!--사진-->
	                                    <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2" style="
	                                    margin-left: 0px;
	                                "><img class="d-block rounded-3"  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }" alt="Image"></div>
	                                    <!--설명-->
	                                    <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
	                                    <h2 class="h3 mb-4 pb-2">제품명</h2>
	                                    <h6 class="fs-base mb-3">제품소개</h6>
	                                    <p class="fs-sm text-muted pb-2">제품 소개 상세 :${s.PR_INF }.</p>
	                                    </div>
	                                </div>
	                                <!-- Product description section 2-->
	                                <div class="row align-items-center py-4 py-lg-5">
	                                <div class="col-lg-5 col-md-6 offset-lg-1"><img class="d-block rounded-3"  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO2 }" alt="Map"></div>
	                                <div class="col-lg-4 col-md-6 offset-lg-1 py-4">
	                                <h2 class="h3 mb-4 pb-2">제품 기능</h2>
	                                <h6 class="fs-base mb-3">기능 설명</h6>
	                                <p class="fs-sm text-muted pb-md-2"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
	                                </div>
	                                </div>
	                                <!-- Product description section 1-->
	                                <div class="row align-items-center py-md-3">
	                                <!--사진-->
	                                <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2" style="
	                                margin-left: 0px;
	                            "><img class="d-block rounded-3"  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }" alt="Image"></div>
	                                <!--설명-->
	                                <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
	                                <h2 class="h3 mb-4 pb-2">제품 유의사항</h2>
	                                <h6 class="fs-base mb-3"> </h6>
	                                <p class="fs-sm text-muted pb-2">   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit.</p>
	                                </div>
	                            </div>
	                                
	                        </div>
	                      <!-- 후기 -->
	                        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
	                           
	                          <div class="rev" >
	                              <div id="reviewc1">
	
	                              </div>
	                              <div id="reviewc2">
	
	                            </div>
	                             
	                          </div>
	
	
	                        </div>
	                        <!-- Q&A -->
	                        <div class="tab-pane fade" id="qa" role="tabpanel" aria-labelledby="qa-tab">
	                            
	                            <div id="board_div" style="  margin-top: 10px;  ">
	                                <table id="qnaBoard">
	                                    <thead>
	                                        <strong>
	                                        <tr id="th_title">
	                                            <th id="tb_num">문의유형</th>
	                                            <th id="tb_title">문의내용</th>
	                                            <th id="tb_author">작성자</th>
	                                            <th id="tb_date">날짜</th>
	                                        </tr>
	                                        </strong>
	                                    </thead>
	                                    <tbody> 
	                                            <tr>
	                                                <td>배송문의</td>
	                                                <td>제목</td>
	                                                <td> 나다</td>
	                                                <td> 2021.03.29</td>
	                                            </tr>
	                                            <tr>
	                                                <td>상품문의</td>
	                                                <td>제목</td>
	                                                <td> 나다</td>
	                                                <td> 2021.03.29</td>
	                                            </tr>
	                                         
	                                             
	                                             
	                                    </tbody>
	                                </table> 
	                                    <button  type="button"  id="modal_opne_btn">질문하기</button>
	                                    <!-- 질문 팝업-->
	                                    <div id="modal">
	    
	                                        <div class="modal_content">
	                                            <table class="table table-boardered">
	                             
	                                                <input type="hidden" class="title" name="category"
	                                                    value=" " readonly> 
	                                                <br><br>
	                                                <tr>
	                                                    <th id="thArea">문의유형</th>
	                                                    <td><select id="filter"  style=" float: left;">  
	                                                        <optgroup label="문의유형">
	                                                            <option value="배송">배송</option>
	                                                            <option value="상품">상품</option>
	                                                            <option value="기타">기타</option> 
	                                                        </optgroup>
	                                                    </select> </td>
	                                                </tr>
	                                                 
	                                                
	                                                 
	                                                <tr>
	                                                    <th id="thArea">내용</th>
	                                                    <td><textarea rows="5" cols="40"  
	                                                            placeholder="내용을 입력해주세요." class="form-control"></textarea></td>
	                                                </tr> 
	                                                
	                                            </table>
	                                           
	                                            <div id="modal_close_btn" style="float:left;">
	                                            <button type="button"   style="  margin-left: 100px;  margin-top: 0px;  width: 94px;  margin-right: 10px;  " >확인</button>
	                                            </div>
	                                            <div id="btnArea" style="float:left;">
	                                            <button id="modal_close_btn"   style="   margin-left: 0;;   margin-left: 0px;  margin-top: 0px;  width: 94px;   " >취소</button>
	                                            </div>  
	                                            
	                                          
	                                                   
	                                             
	                                             
	                                        </div>
	                                        <div class="modal_layer"></div>
	                                    </div>
	                                    
	    
	                                    <!-- 질문 팝업-->
	    
	                                </div>
	                                <div class="pagingArea" style="margin-left: 50px;">
	                                       
	                                    <button onclick="location.href=' '" style="  width: 32px;   "> &lt;&lt; </button>
	                                     
	                                        <button disabled> &lt; </button>
	                             
	                                        <button onclick="location.href=' '"> &lt; </button>
	                                  
	                                        <button disabled> &gt; </button> 
	                                        <button onclick="location.href=' '"> &gt; </button>
	                              
	                                    <button onclick="location.href=' '"style="    width: 32px; "> &gt;&gt; </button>
	                                 </div> 
	                        </div>
	                        <div class="tab-pane fade" id="de" role="tabpanel" aria-labelledby="de-tab" >
	                        <!--  작성한 택배사에 맞는 택배사 정보 출력 -->
	                        <c:if  test="${ s.DY_COMPANY == '로젠' }">  
	                            <img  src="${ contextPath }/resources/img/store/배송정보.jpg" style="  margin-left: 35px; ">
	                        </c:if>
	                         
	                         
	                           
	                        </div>
	                       
	                    </div>
	                  </div>
						 
		
	
				 
	                
			</div>
	 
		</section>
			 
</body>
</html>