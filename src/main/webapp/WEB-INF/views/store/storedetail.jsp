<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 제품 디테일</title>
<!-- 아이콘 cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
 
<!-- 스토어 css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/store/main/detail.css?a">
<!-- 모달 css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/store/main/modal.css">
<!-- 스토어q css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/store/Q&A/Q&A.css?s">
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 
 
 
 
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
 
 
 
 
 
 <link rel="stylesheet" href="${ contextPath }/resources/css/store/detail.css?a=">
 
 
</head>
<style>

#sub{
  background-color: yellow;
  border: solid 1px;
  border-radius: 5px;
  margin-top: 10px;
}
  .nav-tabs  #home-tab.active{
   background-color: #926736;
   color: white;
   }
   
    h2 {font-size:15px;}
    .star-rating {width:150px; }                                 
    .star-rating,.star-rating span {display:inline-block; height:26px; overflow:hidden;  background-image: url("../resources/img/store/star.png")}
    .star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }

	.reviews{
		border-radius:0px;
	}
	
		.bbb a{
 	color:black;
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
	                let basket = {
	                	    totalCount: 0, 
	                	    totalPrice: 0,
	                	    //체크한 장바구니 상품 비우기
	                	    delCheckedItem: function(){
	                	        document.querySelectorAll("input[name=buy]:checked").forEach(function (item) {
	                	            item.parentElement.parentElement.parentElement.remove();
	                	        });
	                	        //AJAX 서버 업데이트 전송
	                	    
	                	        //전송 처리 결과가 성공이면
	                	        this.reCalc();
	                	        this.updateUI();
	                	    },
	                	    //장바구니 전체 비우기
	                	    delAllItem: function(){
	                	        document.querySelectorAll('.row.data').forEach(function (item) {
	                	            item.remove();
	                	          });
	                	          //AJAX 서버 업데이트 전송
	                	        
	                	          //전송 처리 결과가 성공이면
	                	          this.totalCount = 0;
	                	          this.totalPrice = 0;
	                	          this.reCalc();
	                	          this.updateUI();
	                	    },
	                	    //재계산
	                	    reCalc: function(){
	                	        this.totalCount = 0;
	                	        this.totalPrice = 0;
	                	        document.querySelectorAll(".p_num").forEach(function (item) {
	                	            var count = parseInt(item.getAttribute('value'));
	                	            this.totalCount += count;
	                	            var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	                	            this.totalPrice += count * price;
	                	        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
	                	    },
	                	    //화면 업데이트
	                	    updateUI: function () {
	                	        document.querySelector('#sum_p_num').value =  + this.totalCount.formatNumber();
	                	        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
	                	    },
	                	    //개별 수량 변경
	                	    changePNum: function (pos) {
	                	        var item = document.querySelector('input[name=p_num'+pos+']');
	                	        var p_num = parseInt(item.getAttribute('value'));
	                	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
	                	        
	                	        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

	                	        item.setAttribute('value', newval);
	                	        item.value = newval;

	                	        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	                	        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
	                	        //AJAX 업데이트 전송

	                	        //전송 처리 결과가 성공이면    
	                	        this.reCalc();
	                	        this.updateUI();
	                	    },
	                	    delItem: function () {
	                	        event.target.parentElement.parentElement.parentElement.remove();
	                	    }
	                	}

	                	// 숫자 3자리 콤마찍기
	                	Number.prototype.formatNumber = function(){
	                	    if(this==0) return 0;
	                	    let regex = /(^[+-]?\d+)(\d{3})/;
	                	    let nstr = (this + '');
	                	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	                	    return nstr;
	                	};
	                    //-->
	                    </script>  
	                    
					<div class="rvt"
						style="top: 10px;left: 550px;width: 422px;height: 402px;">
						<span><a style="font-size: 25px;  margin-left: 150px;" >  ${s.PR_NAME }  <c:if test="${ !empty sessionScope.loginUser }"> <button data-bs-toggle="modal" data-bs-target="#PrModal"
						style="background-color:white;	color: red; border-left-width: 0px; border-top-width: 0px;border-right-width: 0px; border-bottom-width: 0px;"><i class="fas fa-exclamation-triangle"></i></button></c:if><p style="margin-left:40%;">  </p></a>
						
	                        &nbsp <i class="fa fa-bullhorn" aria-hidden="true" style="font-size: 15px; color: rgb(190, 130, 51); "> <a>  ※ ${s.PR_EVENT }</a></i> 
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
								<p class="store_info"  > &nbsp 가격:  <fmt:formatNumber value="${ s.PR_PRICE }" pattern="#,###"/>
								</p>
							</tr>
							<br>
							</td>
							<tr>
								<p class="store_info"  > &nbsp 택배사: ${s.DY_COMPANY} 
								</p>
							</tr>
	                        <br>
	                        <tr>
	                        </tr>
	                 </table>
	                            <div class="su" style=" margin-left: 20px;  "> 
	                    
	                             <form  id="terms_form" action="${ contextPath }/cart/storecart"  method="post"  >    
	                             
	                            				<input type="hidden" class="price" name="price" value="${s.PR_PRICE}">
	                            				<input type="hidden" class="pr_code" name="pr_code" value="${s.PR_CODE}">
	                            			 	<input type="hidden" class="name" name="name" value="${s.PR_NAME }">
	                            			 	<input type="hidden" name="photo" value="${s.STORE_PHOTO1}">
	                            		 		
	                                 			  <div class="subdiv">
                                                <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="${s.PR_PRICE }"> </div>
                                                <div class="num">
                                                    <div class="updown" style="float: left;">수량
                                                        <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(1);">
                                                        <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                                        <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                                    </div>
                                                </div>  
                                                <div class="sum"> <input type="hidden" name="sum" size="11" readonly  value=""  >${s.PR_PRICE }원   </div>
                                            	</div>
                                            	
	                            
	                             	 
	                                	 </form>
	                                	
           								 
	                            </div>
	                           
							 <form  id="cart" action="${ contextPath }/store/storecart"  method="post"  >    
							 <input type="hidden" name="price" value="${s.PR_PRICE}">
	                         <input type="hidden" name="pr_code" value="${s.PR_CODE}">
	                         <input type="hidden" name="name" value="${s.PR_NAME }">
	                         <input type="hidden" name="p_num" id="sum_p_num" value="1">
				 			
                                   
							 </form>

	 					 
	                        <div class="btnDiv">
	                        
	                        <c:if test="${ !empty sessionScope.loginUser }">
	                       
	                            <button type="button" class="btn" id = "register-btn"  onClick="location.href=' ${ contextPath }/store/store/order?PR_CODE=${ s.PR_CODE }'" >
	                               바로구매
	                              <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
	                            </button>
	                            <button type="button" class="btn" id ="cart-btn">
	                              장바구니
	                              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
	                            </button>
	                            
	                       
	                            
	                    <c:if test="${  s.SUBSCRIPTIONS eq 'Y'  }">        
	                            <button type="button" class="btn" id = "cart1-btn" onClick="location.href=' ${ contextPath }/store/subW?PR_CODE=${ s.PR_CODE }'"  >
	                              정기구독
	                                <i class="fa fa-shopping-bag" aria-hidden="true" ></i>
	                              </button>    </c:if>
	                  
	                  </c:if>
	                   <c:if test="${  empty sessionScope.loginUser }">
	                   		<h4><a style="color:red;">구매 및 구독은 로그인후 이용해주시기 바랍니다.</a></h4>
	                   </c:if>
	                            </div>  
							 
					
					</div> 
					 
	                </div>
	                
	                
	                	
	              
	             
	         
	                <script>
	                $(document).on('click', '#cart-btn', function(){
	                	 
	                	var p_num1 = $("input[name=p_num1]").val();
	                	
	                	Swal.fire({
							title : '상품이 장바구니에 추가되었습니다.',
							text : "쇼핑을 계속 하시겠습니까??",
							icon : 'success',
							showCancelButton : true,
							confirmButtonColor : '#4B654A',
							cancelButtonColor : '#d33',
							confirmButtonText : '계속 쇼핑',
							cancelButtonText : '장바구니로'
						}).then(function(result) {
							if(result.isConfirmed) {
								 $.ajax({
					              	    url:"${ contextPath }/cart/storecart",
					               		type : "post",
					               		dataType : 'json',
					               		data : {
					               			price :   ${ s.PR_PRICE },
					               		 
					               			pr_code : ${ s.PR_CODE },
					               			
					               			name : "${ s.PR_NAME }",
					               			
					               			p_num1 : p_num1 
					               			 
					               		},
					               		success : function(data){
					               			location.href="${ contextPath }/store/storemain";
					               		},
					               		error : function(e){
					       					console.log(e);
					       				}
					               		
					              		}); 
							} else {
							
								 $("#terms_form").submit();
							}
						});
	                	
	                	
	                 
	         	
	         			 
	         			 
	            	});
	                </script>
	                 <script>
	                $(document).on('click', '#register-btn', function(){
	                
	                	
	                	
	                	
	                    $("#cart").submit();
	            	});
	                </script>
	              
	                
	                   
	                
	                <!-- 세부영역-->
	                <div>
	                    <ul class="nav nav-tabs" id="myTab" role="tablist">
	                        <li class="nav-item" role="presentation">
	                            <button  style="font-family: 'NEXON Lv1 Gothic OTF Bold'; " class="${ sa }" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">
	                                상세정보
	                            </button>
	                        </li>
	                        <li class="nav-item" role="presentation">
	                            <button style="font-family: 'NEXON Lv1 Gothic OTF Bold'; " class="${ sa2 }" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button" role="tab" aria-controls="review" aria-selected="false">
	                                후기
	                            </button>
	                        </li>
	                        <li class="nav-item" role="presentation">
	                            <button style="font-family: 'NEXON Lv1 Gothic OTF Bold'; " class="${ sa1 }" id="qa-tab" data-bs-toggle="tab" data-bs-target="#qa" type="button" role="tab" aria-controls="qa" aria-selected="false">
	                                Q&A
	                            </button>
	                        </li>
	                        <li class="nav-item" role="presentation">
	                            <button style="font-family: 'NEXON Lv1 Gothic OTF Bold'; " class="nav-link" id="de-tab" data-bs-toggle="tab" data-bs-target="#de" type="button" role="tab" aria-controls="de" aria-selected="false">
	                               배송/반품
	                            </button>
	                        </li>
	                        
	                    </ul>
	                      <div class="tab-content" id="myTabContent">
	                        <!-- 상세 정보 -->
	                        <div class="${ table }" id="home" role="tabpanel" aria-labelledby="home-tab">
	                                <!-- Product description section 1-->
	                                <div class="row align-items-center py-md-3">
	                                    <!--사진-->
	                                    <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2" style="
	                                    margin-left: 0px;
	                                "><img class="d-block rounded-3"  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }"  style="width: 600px; height:auto; "alt="Image"></div>
	                                    <!--설명-->
	                                    <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
	                                    <h2 class="h3 mb-4 pb-2">${s.PR_NAME } </h2>
	                                    <h6 class="fs-base mb-3"> </h6>
	                                    <p class="fs-sm text-muted pb-2"> ${s.PR_IF }.</p>
	                                    </div>
	                                </div>
	                                <!-- Product description section 2-->
	                                <div class="row align-items-center py-4 py-lg-5">
	                                <div class="col-lg-5 col-md-6 offset-lg-1"><img class="d-block rounded-3"  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO2 }"  style="width: 500px;"alt="Map"></div>
	                                <div class="col-lg-4 col-md-6 offset-lg-1 py-4">
	                                <h2 class="h3 mb-4 pb-2">제품 기능</h2>
	                                <h6 class="fs-base mb-3"> </h6>
	                                <p class="fs-sm text-muted pb-md-2"> ${s.PR_INF } </p>
	                                </div>
	                                </div>
	                                <!-- Product description section 1-->
	                                <div class="row align-items-center py-md-3">
	                                <!--사진-->
	                                <div class="col-lg-5 col-md-6 offset-lg-1 order-md-2" style="
	                                margin-left: 0px;
	                            "><img class="d-block rounded-3"  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO3 }"   style="width: 550px;"alt="Image"></div>
	                                <!--설명-->
	                                <div class="col-lg-4 col-md-6 offset-lg-1 py-4 order-md-1">
	                                <h2 class="h3 mb-4 pb-2">제품 주의사항</h2>
	                                <h6 class="fs-base mb-3"> </h6>
	                                <p class="fs-sm text-muted pb-2"> ${s.PR_NOTICE }  </p>
	                                </div>
	                            </div>
	                                
	                        </div>
	                      <!-- 후기 -->
	                        <div class="${ table3 }" id="review" role="tabpanel" aria-labelledby="review-tab">
	                           
	                          
	                          		  <table class="reviews" id="reviews" style="margin-left: 120px;">
									    <thead>
									        <tr  >
									            <th>작성자</th>  
									            <th>별점 및 내용</th>
									            <th style="padding-left: 250px;"  width:65%;">등록일</th>
									        </tr>
									    </thead>
									    <tbody>
									  
									       <c:forEach var="r" items="${ ReviewList }"  varStatus="status" >
									    
									            <tr>
									               <c:if test="${ r.purchase_number != null }">  
									               <td style="width: 66px;"><button id="sub" style="width:50px;  background-color:#F3D798; border-color:#F3D798;" >일반</button></td>
									               </c:if>
									                <c:if test="${ r.subscribe_code != null }">  
									               <td style="width: 66px;"><button id="sub" style="width:50px;background-color:#935039; border-color:#935039; color:white;">구독</button></td>
									               </c:if>
									               <td style="width: 280px;"> <div class="wrap-star"style="margin-top: 5px;"> 
												     	<c:if test="${ r.review_grade == 0.5 }">  
												        <div class='star-rating'> 
												         <span style ="width:10%"></span>
												        </div>
												     	</c:if> 
												     		<c:if test="${ r.review_grade == 1.0 }">  
												        <div class='star-rating'> 
												         <span style ="width:20%"></span>
												        </div>
												     	</c:if>
												     		<c:if test="${ r.review_grade == 1.5 }">  
												        <div class='star-rating'> 
												         <span style ="width:30%"></span>
												        </div>
												     	</c:if>
												     		<c:if test="${ r.review_grade == 2.0 }">  
												        <div class='star-rating'> 
												         <span style ="width:40%"></span>
												        </div>
												     	</c:if>
												     		<c:if test="${ r.review_grade == 2.5 }">  
												        <div class='star-rating'> 
												         <span style ="width:50%"></span>
												        </div>
												     	</c:if>
												     		<c:if test="${ r.review_grade == 3.0 }">  
												        <div class='star-rating'> 
												         <span style ="width:60%"></span>
												        </div>
												     	</c:if>
												     		<c:if test="${ r.review_grade == 3.5 }">  
												        <div class='star-rating'> 
												         <span style ="width:70%"></span>
												        </div>
												     	</c:if>
												     		<c:if test="${ r.review_grade == 4.0 }">  
												        <div class='star-rating'> 
												         <span style ="width:80%"></span>
												        </div>
												     	</c:if>
												     		<c:if test="${ r.review_grade == 4.5 }">  
												        <div class='star-rating'> 
												         <span style ="width:90%"></span>
												        </div>
												     	</c:if>
												     		<c:if test="${ r.review_grade == 5.0 }">  
												        <div class='star-rating'> 
												         <span style ="width:100%"></span>
												        </div>
												     	</c:if>
												     	  
												     	 
												    </div>
									               <input type="hidden" value="${ loginUser.id }" id="userId">
									               </td>
									               <td style="padding-top: 16px; padding-left: 250px;  ">  ${  r.review_date }   <c:if test="${ !empty sessionScope.loginUser }"> <button data-bs-toggle="modal" 
									               data-bs-target="#PrRModal${r.review_no}"style="background-color:white;	
									               color: red; border-left-width: 0px; border-top-width: 0px;border-right-width: 0px; border-bottom-width: 0px;">
									               
									               <i class="fas fa-exclamation-triangle"></i></button></c:if> </td> 
									            </tr>
									            <tr> 
									                <td style="width: 110px;">${ r.id  } </td>
									                <td>${  r.review_content}</td>
									            
									                 <c:if test="${ r.review_photo ne null }">  
									             
									            </tr>
									             <td> <img class="d-block rounded-3"  src="${ contextPath }/resources/muploadFiles/review/${r.review_chph}"  style="width: 200px;" >
									               </td>
									                </c:if>
									          
									        </c:forEach>
									    </tbody>
									</table>
	                          		
	                          		
	                          		
	                  <%--               <table id="qnaBoard">
	                                
	                                        <strong>
	                                       		   <tr>
	                                               <th id="tb_title2" style="text-align:left;">문의유형</th>
								                   <th id="tb_content2" style="text-align:left;">문의내용</th>
								                   <th id="tb_author2" style="text-align:left;">작성자</th>
								                   <th id="tb_date2" style="padding-right: 60px;">날짜</th>
	                                       		  </tr>
	                                        </strong>
	                                        
	                                         <c:forEach var="r" items="${ ReviewList }"  > 
								
									<table cellspacing="0" border="1" class="recruit" id="faqBoard">
										<tbody> 
										
											<tr class="question">   
												
												
													<td id="tb_title">  </td>
												  	<td id="tb_content">  ${ r.review_content } </td>
												  	<td id="tb_author">  ${ r.id  } </td>
												  	<td id="tb_date">  ${ r.review_date  }
												  </td>
												  </tr>
												  </tbody>
												  </table>
												  </c:forEach>
	                                  
								  </table>  
	                           --%>
	                          
	                          
	                          
	                               <div class="paing" style="float: right;position: relative;left: -50%;width: 100%;left: 0px;right: 0px;" >
			               
									<c:set var="loc" value="/store/storedetail?PR_CODE=${s.PR_CODE }" scope="page"/> 
	                           <center>
						                <table class="bbb">
						               
							                <tr>
												<td colspan="6">
												<!-- [이전] -->
												<c:if test="${ pi2.currentPage <= 1 }">
													[이전] &nbsp;
												</c:if>
												<c:if test="${ pi2.currentPage > 1  }">
													<c:url var="before" value="${ loc }">
														<c:param name="page" value="${ pi2.currentPage -1 }" />
														<c:if test="${param.searchValue ne null} }">
															<c:param name="searchCondition" value="${ param.searchCondition }  "/>
															<c:param name="searchValue" value="${ param.searchValue}  "/>
														</c:if>
													</c:url>
													<a href="${ before }&k=2#review" >[이전]</a> &nbsp;
												</c:if>
												
												
												<!-- 페이지 숫자 -->
												<c:forEach var="p" begin="${ pi2.startPage }" end="${ pi2.endPage }">
													<c:if test="${ p eq pi2.currentPage }">
														<font color="red" size="4"><b  style="color: #F3D798">[${ p }]</b></font> &nbsp;
													</c:if>
													<c:if test="${ p ne pi2.currentPage  }">
														<c:url var="pagination" value="${ loc}">
															<c:param name="page" value="${ p }"/>
															 <c:if test="${param.searchValue ne null} }">
																	<c:param name="searchCondition" value="${ param.searchCondition}  "/>
																	<c:param name="searchValue" value="${ param.searchValue}  "/>
														     </c:if>
														</c:url>
														<a href="${ pagination }&k=2#review"  >${ p }</a> &nbsp;
													</c:if>
											
												</c:forEach>
											 
												<!-- [다음] -->
												<c:if test="${ pi2.currentPage >= pi2.maxPage }">
													[다음]
												</c:if>
												<c:if test="${ pi2.currentPage < pi2.maxPage }">
													<c:url var="after" value="${ loc}">
														<c:param name="page" value="${ pi2.currentPage + 1 }" />
														<c:if test="${param.searchValue ne null} }">
																	<c:param name="searchCondition" value="${param.searchCondition} "/>
																	<c:param name="searchValue" value="${param.searchValue} "/>
														     </c:if>
													</c:url>
													<a href="${ after }&k=2#review"  >[다음]</a>
												</c:if>
												</td> 
											</tr>
											  </center>
						                </table> 
						             
						              </div>
	                       		
	                            
	                        
	
	
	
	                        </div>
	                        <!-- Q&A --> 
	                        <div class="${ table2 }" id="qa" role="tabpanel" aria-labelledby="qa-tab">
	                            
	                            <div id="board_div" style="  margin-top: 10px;  ">
	                                <table id="qnaBoard">
	                                
	                                        <strong>
	                                       		   <tr>
	                                               <th id="tb_title2" style="text-align:left;">문의유형</th>
								                   <th id="tb_content2" style="text-align:left;">문의내용</th>
								                   <th id="tb_author2" style="text-align:left;">작성자</th>
								                   <th id="tb_date2" style="padding-right: 60px;">날짜</th>
	                                       		  </tr>
	                                        </strong>
	                                        
	                                  
								  </table>  
								 <c:forEach var="q" items="${ QsearchList }"  > 
								
									<table cellspacing="0" border="1" class="recruit" id="faqBoard">
										<tbody> 
										
											<tr class="question">   
												<input type="hidden" name="QnA_NO" value="${ q.qnaNo} ">
												
													<td id="tb_title"> ${ q.qnaTitle } </td>
												  	<td id="tb_content">  ${ q.qnaContent } </td>
												  	<td id="tb_author">  ${ q.id  } </td>
												  	<td id="tb_date">  ${ q.qnaDate  }
												  
												  
												 	 
											 		
											 		
											 		<c:set var="loop_flag" value="false" />
											 		 <c:forEach var="a" items="${ Alist}"  > 
											 		   <c:if test="${not loop_flag }">
															<c:if test="${  !empty a  && a.qnaNo eq  q.qnaNo }">
																 <h6  style="color:red;">답변완료</h6>
																  <c:set var="loop_flag" value="true" />
															 </c:if>  
															 
													 </c:if>
													 </c:forEach> 
													 
													 
													  <c:forEach var="a" items="${ Alist}"  > 
											 		   <c:if test="${not loop_flag }">
													 
													  <c:if test="${ empty a || a.qnaNo ne  q.qnaNo  }">
							                       	   			<h6 style="color:blue;">답변대기
							                       	   			 <c:forEach var="c" items="${ CafeCode }"  > 
														 			<c:if test="${ !empty sessionScope.loginUser && c eq loginUser.id }"> 
																	 <button type="button" id="aa" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${ q.qnaNo}" style="background-color:#935039; border-color:#935039;" >답변 </button></h6>
														 			</c:if>
														 		</c:forEach>
							                       	   			 <c:set var="loop_flag" value="true" />
							                       		</c:if>
							                       	
													 </c:if>
													 </c:forEach> 
													 
													 <c:forEach var="a" items="${ Alist2 }"  > 
														 <c:if test="${   a  eq 'x' }">
														 		<h6 style="color:blue;">답변대기
														 		 <c:forEach var="c" items="${ CafeCode }"  > 
														 			<c:if test="${ !empty sessionScope.loginUser && c eq loginUser.id }"> 
																	 <button type="button" id="aa" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${ q.qnaNo}" style="background-color:#935039; border-color:#935039;">답변 </button></h6>
														 			</c:if>
														 		</c:forEach>
														 </c:if>
											 		</c:forEach>
											 		
											  		 
											</tr>
											<tr class="hide"> 
											<c:set var="loop_flag" value="false" />
											 	  <c:forEach var="a" items="${ Alist}"  >  
											 	   <c:if test="${not loop_flag }">
													<c:if test="${  a.qnaNo eq  q.qnaNo }">
														<td> <img  src="${ contextPath }/resources/img/store/A.jpg"  style="width:50px;"> </td>
													 	<td id="tb_a" >    ${  a.aContent  }  </td> 
													 	<td style="font-size:7px;"> *자세한 문의는 고객센터로 연락바랍니다.  </td>  
													 	<td style="font-size:15px;"> ${  s.SERVICE_CENTER  }   </td>  
														 	  <c:set var="loop_flag" value="true" />
													 </c:if>   
													  
													 </c:if>
												</c:forEach>
												 
												   <c:forEach var="a" items="${ Alist}"  >  
											 	   <c:if test="${not loop_flag }">
													<c:if test="${   a.qnaNo ne  q.qnaNo  }">
														<td>미답변 </td>
													 	<td id="tb_a" > 빠른시일 안에 답변을 해드리겠습니다.     </td> 
													 	<td style="font-size:7px;">   </td>  
													 	<td style="font-size:15px;">   </td>  
														 	  <c:set var="loop_flag" value="true" />
													 </c:if>   
													  
													 </c:if>
												</c:forEach>
												
												
													 <c:forEach var="a" items="${ Alist2 }"  > 
														 <c:if test="${   a  eq 'x' }">
														 		<td>미답변 </td>
													 	<td id="tb_a" > 빠른시일 안에 답변을 해드리겠습니다.     </td> 
													 	<td style="font-size:7px;">   </td>  
													 	<td style="font-size:15px;">   </td>  
														 </c:if>
											 		</c:forEach>
											
											</tr> 
										</tbody>
									</table>
									</c:forEach>
								 
									
									   
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
						    	 
	                              
	                               
	                       	 </div> 
	                       	 
	                       	 
	                       	 <c:if test="${ !empty sessionScope.loginUser }">
	                       	  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#QModal"  style="background-color:#e3a259; border-color:#e3a259;"> 질문</button>
	                       	 </c:if>
	                       	 
	                       	 
	                       	  
	                       	  
	                <div class="paing" style="float: right;position: relative;left: -50%;width: 100%;left: 0px;right: 0px;" >
			               
									<c:set var="loc" value="/store/storedetail?PR_CODE=${s.PR_CODE }" scope="page"/> 
						                     
					<center>
	                <table class="bbb" >
		                <tr>
							<td colspan="6">
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">
								[이전] &nbsp;
							</c:if>
							<c:if test="${ pi.currentPage > 1  }">
								<c:url var="before" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage -1 }" />
									<c:if test="${param.searchValue ne null} }">
										<c:param name="searchCondition" value="${ param.searchCondition }  "/>
										<c:param name="searchValue" value="${ param.searchValue}  "/>
									</c:if>
								</c:url>
								<a href="${ before }&k=1#qa">[이전]</a> &nbsp;
							</c:if>
							
							
							<!-- 페이지 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<font color="red" size="4"><b  style="color: #F3D798">[${ p }]</b></font> &nbsp;
								</c:if>
								<c:if test="${ p ne pi.currentPage  }">
									<c:url var="pagination" value="${ loc}">
										<c:param name="page" value="${ p }"/>
										 <c:if test="${param.searchValue ne null} }">
												<c:param name="searchCondition" value="${ param.searchCondition}  "/>
												<c:param name="searchValue" value="${ param.searchValue}  "/>
									     </c:if>
									</c:url>
									<a href="${ pagination }&k=1#qa">${ p }</a> &nbsp;
								</c:if>
						
							</c:forEach>
						<!-- class="nav-link" id="qa-tab" data-bs-toggle="tab" data-bs-target="#qa" type="button" role="tab" aria-controls="qa" aria-selected="false"
							 -->
							<!-- [다음] -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								[다음]
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="${ loc}">
									<c:param name="page" value="${ pi.currentPage + 1 }" />
									<c:if test="${param.searchValue ne null} }">
												<c:param name="searchCondition" value="${param.searchCondition} "/>
												<c:param name="searchValue" value="${param.searchValue} "/>
									     </c:if>
								</c:url>
								<a href="${ after }&k=1#qa">[다음]</a>
							</c:if>
							</td> 
						</tr>
	                </table> 
	                 
                </div>
	                       	  
	                       		</center> 
	                       	  
	                       	  
	                       	  
	                       	  
	                       	  
	                       	 
	                       	 
	                        </div>
	                
	        
	                        
	                        
							
	                        <div class="tab-pane fade" id="de" role="tabpanel" aria-labelledby="de-tab" style="background-color:white;" >
	                        <!--  작성한 택배사에 맞는 택배사 정보 출력 -->
	                        <c:if  test="${ s.DY_COMPANY == '로젠' }">  
	                            <img  src="${ contextPath }/resources/img/store/배송수정.jpg" style="  margin-left: 35px; ">
	                        </c:if>
	                          <c:if  test="${ s.DY_COMPANY == '한진' }">  
	                            <img  src="${ contextPath }/resources/img/store/한진.jpg" style="  margin-left: 35px; ">
	                        </c:if>
	                          <c:if  test="${ s.DY_COMPANY == 'CJ' }">  
	                            <img  src="${ contextPath }/resources/img/store/cj.jpg" style="  margin-left: 35px; ">
	                        </c:if>
	                          <c:if  test="${ s.DY_COMPANY == '쿠팡' }">  
	                             <img  src="${ contextPath }/resources/img/store/쿠팡.png" style="  margin-left: 35px; width: 950px;" >
	                            <img  src="${ contextPath }/resources/img/store/쿠팡팡.jpg" style="  margin-left:0; ">
	                        </c:if>
	                          
	                        </div>
	                       
	                    </div>
	                     
	                    
	                  </div>
						  
			</div>
			</div>
		
					 <c:forEach var="q" items="${ QsearchList }"> 
			    	 	   	 	 <!-- Modal 답변 -->
							<div class="modal fade" id="exampleModal${ q.qnaNo}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<form   action="${ contextPath }/store/anser?qnaNo=${ q.qnaNo }&PR_CODE=${ s.PR_CODE }&k=1"  method="post" >
								<input type="hidden"  name="qnaNo" value="${ q.qnaNo }">
								<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel" style="color: white;">
									<img src="${ contextPath }/resources/img/common/whiteLogo.png" class = "logoimg">
										제품 답변
									</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
								
										<table class="rp_reason_table">
											 <tr>
												<td>문의 제품명: ${s.PR_NAME } </td>
											</tr>
											 <tr>
												<td>문의유형 : ${ q.qnaTitle } </td>
											</tr>
											 <tr>
												<td> 문의내용: ${ q.qnaContent } </td>
											</tr>
											
											<tr>
												<td colspan="2"> 
													<textarea class="evidence" name="aContent"> </textarea>
												</td>
											</tr>
										</table>
										<p>
											<br>
											<p class="alert-text">
											배송이나 상품에 대한 잘못된 답변등은  신고당하실수 있습니다.
											</p>
										</p>
										
										</div>
										<div class="modal-footer" >
										<button type="submit"  class="btn btn-danger">답변</button>
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										</div>
									</table>
								</div>
								</div>
								</form>
							</div>
			
					</c:forEach>
					
					
						  <script>
			                $(document).on('click', '#modalAbt', function(){
			                	Swal.fire("답변이 등록되었습니다.") .then(function(result) {
			    					if(result.isConfirmed) {
			    						 $("#modalA").submit();
			    					} else {
			    						return;
			    					}
			    				}); 
			                   
			            	});
			                </script>
			
					 	 <!-- Modal 질문하기 -->
							<div class="modal fade" id="QModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<form  id="modalQ"action="${ contextPath }/store/question?PR_CODE=${ s.PR_CODE }"  method="post" >
								<input type="hidden"  name="PR_CODE" value="${ s.PR_CODE }">
								<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel" style="color: white;">
									<img src="${ contextPath }/resources/img/common/whiteLogo.png" class = "logoimg">
										제품 질문
									</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
									<h5 class="sorry-text">제품에대한 질문을 해주세요 <br> 질문이 접수되면 3일내로 처리됩니다. </h5>
										<table class="rp_reason_table">
											<tr>
												<td style="width: 102px;">제품명</td>
												<td aria-readonly="true">${ s.PR_NAME }</td>
											</tr>
											<tr>
												<td>문의유형</td>
												<td>
													<select name="qnaTitle"> 
														<option value="배송">
															배송
														</option>
														<option value="제품">
															제품
														</option>
														<option value="이벤트">
															이벤트
														</option>
														<option value="기타">
															기타
														</option> 
													</select>
											</td>
											</tr>
											<tr>
												<td>문의 내용</td>
											</tr>
											<tr>
												<td colspan="2"> 
													<textarea class="evidence" name="qnaContent"> </textarea>
												</td>
											</tr>
										</table>
										<p>
											<br>
											<p class="alert-text">
											제품에대한 문의가 아닌 부적절한 내용의 글이면 임의로 삭제 될수있습니다.
											</p>
										</p>
										
										</div>
										<div class="modal-footer" >
										<button type="button"  id="modalQbt"  class="btn btn-danger"   >문의등록</button>
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										</div>
									</table>
								</div>
								</div>
								</form>
							</div>
							
							
							  <script>
			                $(document).on('click', '#modalQbt', function(){
			                	Swal.fire("질문이 등록되었습니다.").then(function(result) {
			    					if(result.isConfirmed) {
			    						 $("#modalQ").submit();
			    					} else {
			    						return;
			    					}
			    				}); 
			                   
			            	});
			                </script>
							
							
							
							 <!-- Modal 제품신고하기 -->
							<div class="modal fade" id="PrModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<form  id="insert" action="${ contextPath }/store/report?PR_CODE=${ s.PR_CODE }"  method="post" >
								<input type="hidden"  name="PR_CODE" value="${ s.PR_CODE }"> 
								<input type="hidden"  name="c_code" value="${a}"> 
								<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel" style="color: white;">
									<img src="${ contextPath }/resources/img/common/whiteLogo.png" class = "logoimg">
										제품 신고
									</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
									<h5 class="sorry-text">페이지 사용에 불편을 드려 죄송합니다. <br> 신고가 접수되면 3일내로 처리됩니다. </h5>
										<table class="rp_reason_table">
											<tr>
												<td>제품명</td>
												<td aria-readonly="true">${ s.PR_NAME }</td>
											</tr>
											<tr>
												<td>신고사유</td>
												<td>
													<select name="reportType" id="reportType"> 
													 <option>--신고사유선택--</option>
													<option>
														원산지 불일치
													</option>
													<option>
														이미지와 많이 다름 (하자포함)
													</option>
													<option>
														배송오류
													</option>
													<option>
														과도한 배송 지연(2주이상)
													</option>
													<option>
														기타
													</option>
													</select>
											</td>
											</tr>
											<tr>
												<td>신고 내용</td>
											</tr>
											<tr>
												<td colspan="2"> 
													<textarea class="evidence" name="reportReason" id="reportReason"></textarea>
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
										<div class="modal-footer" >
										<button  type="button" class="btn btn-danger"  id="report" onclick="onSubmit();"  >신고</button>
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										</div>
									</table>
								</div>
								</div>
								</form>
							</div>
							 <script>
					                $(document).on('click', '#report', function(){
					                	 
					                	 var reportType = document.getElementById("reportType");
								         var reportReason = document.getElementById("reportReason");

								         
								        
								         
								            if (reportType.value == "--신고사유선택--") {
								            	 Swal.fire({
													title : '신고유형을 선택하세요.',
													icon : 'warning'
												});
								            	reportType.focus();
								                return;
								            } else if (reportReason.value == "") {
								            	 Swal.fire({
													title : '신고 사유를 작성해주세요.',
													icon : 'warning'
												});
								            	reportReason.focus();
								                return;
								            } else{
								            Swal.fire("제품 신고가 완료되었습니다.").then(function(result) {
							    					if(result.isConfirmed) {
							    					 $("#insert").submit();
							    				} else {
							    					return;
							    				}
							    			}); 
					            		 
					            	} 
					            	});
	                </script>
	                
	                
	                
	              <%--   
	                 <!-- Modal 제품신고하기 -->
							<div class="modal fade" id="PrModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<form  id="insert" action="${ contextPath }/store/report?PR_CODE=${ s.PR_CODE }"  method="post" >
								<input type="hidden"  name="PR_CODE" value="${ s.PR_CODE }"> 
								<input type="hidden"  name="c_code" value="${a}"> 
								<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel" style="color: white;">
									<img src="${ contextPath }/resources/img/common/whiteLogo.png" class = "logoimg">
										제품 질문
									</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
									<h5 class="sorry-text">페이지 사용에 불편을 드려 죄송합니다. <br> 신고가 접수되면 3일내로 처리됩니다. </h5>
										<table class="rp_reason_table">
											<tr>
												<td>제품명</td>
												<td aria-readonly="true">${ s.PR_NAME }</td>
											</tr>
											<tr>
												<td>신고사유</td>
												<td>
													<select name="reportType" id="reportType"> 
													 <option>--신고사유선택--</option>
													<option>
														원산지 불일치
													</option>
													<option>
														이미지와 많이 다름 (하자포함)
													</option>
													<option>
														배송오류
													</option>
													<option>
														과도한 배송 지연(2주이상)
													</option>
													<option>
														기타
													</option>
													</select>
											</td>
											</tr>
											<tr>
												<td>신고 내용</td>
											</tr>
											<tr>
												<td colspan="2"> 
													<textarea class="evidence" name="reportReason" id="reportReason"></textarea>
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
										<div class="modal-footer" >
										<button  type="button" class="btn btn-danger"  id="report"  >신고</button>
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										</div>
									</table>
								</div>
								</div>
								</form>
							</div>
							 --%>
							
							 <!-- Modal 리뷰신고하기 -->
							 <c:forEach var="r" items="${ ReviewList }"  >
							<div class="modal fade" id="PrRModal${r.review_no}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<form  id="insert2" action="${ contextPath }/store/report2?PR_CODE=${ s.PR_CODE }"  method="post" >
								<input type="hidden"  name="PR_CODE" value="${ s.PR_CODE }"> 
								<input type="hidden"  name="r_no"  value="${ r.review_no }"> 
								<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel" style="color: white;">
									<img src="${ contextPath }/resources/img/common/whiteLogo.png" class = "logoimg">
										리뷰신고
									</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
									<h5 class="sorry-text">페이지 사용에 불편을 드려 죄송합니다. <br> 신고가 접수되면 3일내로 처리됩니다. </h5>
										<table class="rp_reason_table">
											<tr>
												<td>리뷰제품명</td>
												<td aria-readonly="true">${ s.PR_NAME }</td>
											</tr>
											<tr>
												<td>신고사유</td>
												<td>
													<select name="reportType" id="reportType2"> 
														<option>--신고유형선택--</option>
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
												<td>신고 내용</td>
											</tr>
											<tr>
												<td colspan="2"> 
													<textarea class="evidence" name="reportReason" id="reportReason2"></textarea>
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
										<div class="modal-footer" >
										<button  type="button" class="btn btn-danger"  id="report2"   >신고</button>
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										</div>
									</table>
								</div>
								</div>
								</form>
							</div>
							</c:forEach>
							 <script>
					                $(document).on('click', '#report2', function(){
					                	 
					                	 var reportType2 = document.getElementById("reportType2");
								         var reportReason2 = document.getElementById("reportReason2");
								      
								     	 
								     

							            if (reportType2.value == "--신고유형선택--") {
							            	 Swal.fire({
												title : '신고유형을 선택하세요.',
												icon : 'warning'
											});
							            	reportType2.focus();
							                return;
							            } 
							            
							            if (reportReason2.value == "") {
							            	 Swal.fire({
												title : '신고 사유를 작성해주세요.',
												icon : 'warning'
											});
							            	reportReason2.focus();
							                return;
							            } else{
								            Swal.fire("리뷰 신고가 완료되었습니다.").then(function(result) {
							    					if(result.isConfirmed) {
							    					 $("#insert2").submit();
							    				} else {
							    					return;
							    				}
								        	}); 
					            		 
					            	} 
							               
								     	 
						            	});
	              	  </script>
							
							
							
							
							
							
							
							 
	                
	              	 
						 
	 
		</section>
					
			 
</body>
</html>