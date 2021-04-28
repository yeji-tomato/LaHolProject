<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>

<!-- 아이콘 cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 폰트 모음 CSS-->
<link rel="stylesheet" href="../common/fonts/fonts.css" />
<!-- 스토어 css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/store/main/main.css?as">
</head>
<style>  
	 

    </style>
<body>
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<!-- carousel -->
	<jsp:include page="/WEB-INF/views/main/store.jsp"/>
	
	
	
	<section id="content" class="content_css"  style="overflow:hidden; height:auto;"  >
		<div class="outer1">
			
			<div class="store1"  > 
			
		 		
      
                <hr>
				 
                <div id="view" style="height:auto"> 
                    <br>
                    <div  class="pp" style="float: left;">
                   
                     </div>
                    <div class="fi" style="margin-left:20px">
                    	   
                    </div> 
                </div>
                
                
           	  <br>
           	    <div class="fi" >
                    <h4>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 판매중인 상품 &nbsp;&nbsp;   </h4>
              				</div> 
              				<br>
              			 
              				<br>
                <div id="view2"   >
                
                			<div class="product" onClick="location.href=' ${ contextPath }/store/create'"    > 
		 		                 <div class="scale"  > 
		 		                 
		                            <img  src="${ contextPath }/resources/img/store/new.jpg" width="350px" height="300px " >  
		                        </div>    
		                        <div class="if" style="float:left; witdh: 50px;">
		                       
		                       
		                      
		                        </div>
		                        <center>
		                        <button  id="add" onClick="location.href=' ${ contextPath }/store/create'"  >제품등록</button>   
		                       	</center>
		                    </div> 
		                    
		                    
		                    
	               		  <c:forEach var="s" items="${ list }">   
		                    <div class="product"    > 
		 		                 <div class="scale"  onclick="selectStore(${s.PR_CODE});"> 
		 		                 <div style="font-weight: bold;position: absolute;z-index:10;width: 350px;" >  <a style="color:#810B0B;">제품 코드:${ s.PR_CODE }<BR>   카테고리:${ s.ST_CATAGORY } <BR> 제품명:${ s.PR_NAME }<BR>  가격:${ s.PR_PRICE}<BR>
                                                                       원산지:${ s.ORIGIN } <BR> 구독여부:${ s.SUBSCRIPTIONS} <BR> 제품등록일: ${ s.PR_DATE}<BR> 택배사: ${ s.DY_COMPANY}</a></div> 
		                            <img  src="${ contextPath }/resources/img/store/${ s.STORE_PHOTO1 }" width="350px" height="300px " >  
		                        </div>    
		                        <div class="if" style="float:left; witdh: 50px;">
		                        <center>
		                        <h4 >${ s.PR_NAME }</h4>
		                            <h5 style="color: #96877D"> ${ s.PR_PRICE }</h5>  
		                        </center>
		                        </div>
		                        <button  id="ifs" onclick="location.href='${ contextPath }/store/updatepage?PR_CODE=${ s.PR_CODE }'" >수정</button>   
		                        <button type="submit" id="ifd" onclick="location.href='${ contextPath }/store/delete?PR_CODE=${ s.PR_CODE }'">삭제</button>  
		                    </div> 
		                     
		                    </c:forEach>
	                    
						
					  	<center>
			                <div class="paing" style="float: right;position: relative;left: -50%;width: 100%;left: 0px;right: 0px;" >
			                <table >
			                <tr>
								<td colspan="6">
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									[이전] &nbsp;
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="/store/list2">
										<c:param name="page" value="${ pi.currentPage -1 }" />
									</c:url>
									<a href="${ before }">[이전]</a> &nbsp;
								</c:if>
								<!-- 페이지 숫자 -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<font color="red" size="4"><b>[${ p }]</b></font> &nbsp;
									</c:if>
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="/store/list2">
											<c:param name="page" value="${ p }"/>
										</c:url>
										<a href="${ pagination }">${ p }</a> &nbsp;
									</c:if>
								</c:forEach>
								<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									[다음]
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="after" value="/board/list2">
										<c:param name="page" value="${ pi.currentPage + 1 }" />
									</c:url>
									<a href="${ after }">[다음]</a>
								</c:if>
								</td> 
							</tr>
			                </table>
	                  
			                </div> 
				             <div id="bu" style="width:60%;  height: 50px;   float:left;">
				              <button id="management" style="margin-top: 0px;float:left;margin-left: 1300px;"    onClick="location.href=' ${ contextPath }/store/list'" >  스토어 메인 </button>   
				              </div> 
				           
              		   </div>
                    </center>
                 
                 
                  
          		  </div>  
          		  
          		  
          		  
          		
          		  
          		  
          		  
          		  
          		  
          		  
          		  
          		  
          		  
          		  
          		  
          		  
          		  
            </div>	
           
          		  
    	 
    </section>
 
    <script>
		function selectStore(PR_CODE){
			location.href='${contextPath}/store/storedetail?PR_CODE=' + PR_CODE + '&page=${ pi.currentPage }'+'&k=0';
			// => 상세 페이지 접근 시 기존 page 값도 파라미터로 전달
		}
	</script>
	

 
		 
</body>
</html>