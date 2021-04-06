<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 아이콘 cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 폰트 모음 CSS-->
<link rel="stylesheet" href="../common/fonts/fonts.css" />
<!-- 스토어 css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/store/main/main.css">
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
			
                <div  class="cat">
                        <div class="ca">
                            <div id="category" style="color:white;  text-align: center;  "> category</div>
                            <button>전체</button><button>식품</button><button>커피머신</button><button>식기류</button><button>텀블러</button><button>커피</button><button>접시</button><button>굿즈</button><button>기타</button><button>d</button>      
 
                        </div> 
                </div>

      
                  <hr>
				 
                <div id="view"> 
                    <br>
                    <div  class="pp" style="float: left;">
                   
                     </div>
                    <div class="fi" style="margin-left:20px">
                    	  <h4 >  &nbsp;추천상품</h4>
                        <select id="filter"  style="margin-top: 0px;margin-left: 5px;">  
                        
                            <optgroup label="필터" >
                                <option value="높은순">높은순</option>
                                <option value="낮은순">낮은순</option>
                                <option value="인기순">인기순</option> 
                            </optgroup>
                        </select> 
                    </div>
						<!-- 인기 상품  -->	
					<div> 
					<c:forEach var="s" items="${ list }">
                    <div class="product"  > 
                        <div class="scale" > 
                            <img  src="${ contextPath }/resources/img/store/STUDY.PNG" width="350px" height="300px " >  
                        </div>    
                        <div class="if" style="float:left; width: 350px;  ">
                        <center>
                        <h4 >${ s.PR_NAME }</h4>
                            <h5 style="color: #96877D"> ${ s.PR_PRICE }</h5>
                            <h6 style="color: #96877D">${ s.ORIGIN }</h6> 
                        </center>
                        </div>
                        <button  id="ifb">바로구매 <i class="fa fa-credit-card-alt" aria-hidden="true"></i></button>  
                    </div> 
                    
             
					</c:forEach>
					          
                     

                     
               
                <div class="paing" style="float: right;position: relative;left: -50%;width: 100%;left: 0px;right: 0px;" >
                <table style="margin-left:40%;">
                <tr>
					<td colspan="6">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="/store/list">
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
							<c:url var="pagination" value="/store/list">
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
						<c:url var="after" value="/board/list">
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
					</td> 
				</tr>
                </table>
                
                </div>
                 
                 <div id="bu" style="width:60%;  height: 50px;   float:left;">
                    <button id="management" style="margin-top: 0px;float:left;margin-left: 1300px;" onClick="location.href='store2.html'"  > 스토어 관리 </button>   
                 
                </div>
                 
             
                </div>
                </div>
                 
                
                 
          
            </div> 
                 
            
    	
    </section>
 
 
		 
</body>
</html>