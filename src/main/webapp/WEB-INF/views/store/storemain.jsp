<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 아이콘 cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
<!-- 스토어 css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/store/main/main.css?sddsd">
</head>
<style>  
	
 
    </style>
<body>
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<!-- carousel -->
	<jsp:include page="/WEB-INF/views/main/store.jsp"/>
	
	
	 
	
		<div class="outer1"  style="height:auto;"> 
			<div class="store1" style="height:auto;"  >  
				<!-- 서치 -->
		           
		                <div class="search-container">
		                    <div class="search-box">
		                        <div class="search-icon"><i class="fa fa-search search-icon"></i></div>
		                       <form action="${ contextPath }/store/search" method="get" class="search-form"  >
		                       		 <c:if test="${ param.searchCondition == 'title' }"> 
		                            <input type="search" name="searchValue" value="${ param.searchValue }" placeholder="Search" id="search" autocomplete="off">
		                            </c:if>
		                             <c:if test="${ param.searchCondition != 'title' }"> 
		                            <input type="search" name="searchValue"   placeholder="Search" id="search" autocomplete="off">
		                            </c:if> 
		                             <button class="go-icon" name="searchCondition" value="title" type="submit"><i class="fa fa-arrow-right"></i></button>
		                        </form>
		                        <svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
		                            xml:space="preserve">
		                        <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
		                        <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
		                        </svg>
		                       
		                    </div>
		                </div>
		                
		             
		            <script>
		            $(document).ready(function(){
		                    $("#search").focus(function() {
		                    $(".search-box").addClass("border-searching");
		                    $(".search-icon").addClass("si-rotate");
		                    });
		                    $("#search").blur(function() {
		                    $(".search-box").removeClass("border-searching");
		                    $(".search-icon").removeClass("si-rotate");
		                    });
		                    $("#search").keyup(function() {
		                        if($(this).val().length > 0) {
		                        $(".go-icon").addClass("go-in");
		                        }
		                        else {
		                        $(".go-icon").removeClass("go-in");
		                        }
		                    });
		                  
		                });
		            </script>
			
			
			
		
	                 <div class="cat">
	                 <form action="${ contextPath }/store/search" method="get"  ><input name="searchCondition" value="category" style="width:0px; ,height:0px;height: 0px;padding-left: 0px;padding-bottom: 0px;border-right-width: 0px;border-left-width: 0px;border-bottom-width: 0px;padding-top: 0px;padding-right: 0px;border-top-width: 0px;">
	                        <div class="ca">
	                            <div id="category" style="color:white;  text-align: center;" > category</div>
	                            <button name="searchValue"  value="이벤트" >이벤트</button><button name="searchValue"  value="식품">식품</button><button name="searchValue"  value="머신">커피머신</button><button name="searchValue"  value="식기류">식기류</button><button   name="searchValue" value="텀블러" >텀블러</button><button name="searchValue"  value="커피">커피</button><button name="searchValue"  value="접시">접시</button><button name="searchValue"  value="굿즈">굿즈</button><button name="searchValue"  value="기타">기타</button><button name="searchValue"  value="원두">원두</button>      
	 
	                        </div> 
	                     </form>
	                </div>

      
                 <hr>
				 
				 <!--  -->
				 
				 
                <div id="view" > 
                    <br>
                    <div  class="pp" style="float: left;">
                   
                     </div>
                    <div class="fi" style="margin-left:20px">
                    	  <h4 >  &nbsp;추천상품</h4>
                       <!--  <select id="filter"  style="margin-top: 0px;margin-left: 5px;">  
                        
                            <optgroup label="필터" >
                                <option value="높은순">높은순</option>
                                <option value="낮은순">낮은순</option>
                                <option value="인기순">인기순</option> 
                            </optgroup>
                        </select>  -->
                    </div>
                   
					<!-- 인기 상품  -->	
					<c:forEach var="s" items="${ list2 }">
	                    <div class="product"   >
	                    
	                        <div class="scale" >  
	                          <c:if test="${  s.SUBSCRIPTIONS eq 'Y'  }">  	<div style="font-weight: bold;position: absolute;  z-index:10;" >  <a style="color:#810B0B;">구독가능 </a></div>  </c:if>
	                            <img  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }" width="350px" height="300px"  onclick="selectStore(${s.PR_CODE});"  >  
	                            
	                           
	                        </div>    
	                        <div class="if" style="float:left; width: 350px;  ">
	                        <center>
	                        <h5 onclick="selectStore(${s.PR_CODE});" ><a style="color:red;" ><인기></a>${ s.PR_NAME }</h5>
	                            <h5 style="color: #810B0B"> ${ s.PR_PRICE }원</h5>
	                            <h6 ><c:if test="${  s.SUBSCRIPTIONS eq 'Y' && !empty sessionScope.loginUser   }">        
	                             <a style="color:#RED; ">#구독가능 </a>   </c:if> <a style="color:#935039; ">#${ s.ORIGIN }</a> <a style="color:#96877D "> #${ s.ST_CATAGORY} </a></h6> 
	                          </a></h6> 
	                              
	                        </center>
	                        </div>
	                        <button  id="ifb">바로구매 <i class="fa fa-credit-card-alt" aria-hidden="true"></i></button>  
	                         <c:if test="${  s.SUBSCRIPTIONS eq 'Y'  }"> 
                        <button  id="ifb" style="  margin-top: 45px; background-color:#935039;" onClick="location.href=' ${ contextPath }/store/subW?PR_CODE=${ s.PR_CODE }'" >정기구독 <i class="fa fa-credit-card-alt" aria-hidden="true"></i></button> </c:if>  
	                    </div> 
                    
             
					</c:forEach>
	   
                
                
                </div>
                
                
               <hr style=" margin-top: 530px;   ">
      
                <div id="view2"   >
                    <br>
                    <h4>   &nbsp;&nbsp;&nbsp;일반상품</h4>
              				   
					<c:forEach var="s" items="${ list }">
                    <div class="product"   > 
                        <div class="scale" > 
                            <c:if test="${  s.SUBSCRIPTIONS eq 'Y'  }">  	<div style="font-weight: bold;position: absolute;  z-index:10;" >  <a style="color:#810B0B;">구독가능 </a></div>  </c:if>
                            <img  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }" width="350px" height="300px "  onclick="selectStore(${s.PR_CODE});" >  
                        </div>    
                        <div class="if" style="float:left; width: 350px;  ">
                        <center>
                        <h4   onclick="selectStore(${s.PR_CODE});">${ s.PR_NAME }</h4>
                            <h5 style="color: #810B0B"> ${ s.PR_PRICE }</h5>
                              <h6 ><c:if test="${  s.SUBSCRIPTIONS eq 'Y' && !empty sessionScope.loginUser  }">        
	                             <a style="color:#RED;">#구독가능 </a>   </c:if> <a style="color:#935039 ">#${ s.ORIGIN }</a> <a style="color:#96877D "> #${ s.ST_CATAGORY} </a></h6> 
	                          </a></h6> 
                        </center>
                        </div>
                        
                        
                        <button  id="ifb">바로구매 <i class="fa fa-credit-card-alt" aria-hidden="true"></i></button> 
                        
                        
                        
                           <c:if test="${  s.SUBSCRIPTIONS eq 'Y'  }"> 
                        <button  id="ifb" style="  margin-top: 45px; background-color:#935039;" onClick="location.href=' ${ contextPath }/store/subW?PR_CODE=${ s.PR_CODE }'" >정기구독 <i class="fa fa-credit-card-alt" aria-hidden="true"></i></button> </c:if>  
                    </div> 
                    
             
					</c:forEach>
					           
                <div class="paing" style="float: right;position: relative;left: -50%;width: 100%;left: 0px;right: 0px;" >
	                <c:if test="${param.searchValue eq null }">
						<c:set var="loc" value="/store/list" scope="page"/>
					</c:if>
						
					<c:if test="${param.searchValue ne null}" >
							<c:set var="loc" value="/store/search?searchCondition=${ param.searchCondition }&searchValue=${ param.searchValue}" scope="page"/> 
					</c:if>
					
	                <table style="margin-left:40%;">
		                <tr>
							<td colspan="6">
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">
								[이전] &nbsp;
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage -1 }" />
									<c:if test="${param.searchValue ne null} }">
										<c:param name="searchCondition" value="${ param.searchCondition }  "/>
										<c:param name="searchValue" value="${ param.searchValue}  "/>
									</c:if>
								</c:url>
								<a href="${ before }">[이전]</a> &nbsp;
							</c:if>
							
							
							<!-- 페이지 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<font color="red" size="4"><b>[${ p }]</b></font> &nbsp;
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="${ loc}">
										<c:param name="page" value="${ p }"/>
										 <c:if test="${param.searchValue ne null} }">
												<c:param name="searchCondition" value="${ param.searchCondition}  "/>
												<c:param name="searchValue" value="${ param.searchValue}  "/>
									     </c:if>
									</c:url>
									<a href="${ pagination }">${ p }</a> &nbsp;
								</c:if>
							</c:forEach>
							
							
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
								<a href="${ after }">[다음]</a>
							</c:if>
							</td> 
						</tr>
	                </table> 
                </div>
                 <c:if test="${ loginUser.grade eq 'P'  }"> 
		                 <div id="bu" style="width:60%;  height: 50px;   float:left;">
		                    <button id="management" style="margin-top: 0px;float:left;margin-left: 1300px;"   onClick="location.href=' ${ contextPath }/store/list2'" >  스토어 관리  </button>   
		                  
		                </div>
                 </c:if>
             
                 
                
              
          		  </div> 
          		 
          		 
          		</div>
          		 

          		 
          		</div>
          		
                     	  
 	  
    
       
    <script>
		function selectStore(PR_CODE){
			location.href='${contextPath}/store/storedetail?PR_CODE=' + PR_CODE + '&page=${ pi.currentPage }';
			// => 상세 페이지 접근 시 기존 page 값도 파라미터로 전달
		}
	</script>
	
	
	
	 
      
     
		 
</body> 
	  
</html> 
	
  