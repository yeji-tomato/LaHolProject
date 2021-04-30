<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 후기</title>
</head>
<body>
<div class="review-content">
		<c:forEach var="cr" items="${ caReview }">
          <table id="reviewLeft">
            <thead>
              <tr>
                <td>
                <i class="far fa-user-circle"></i>
                  	<!-- 별점 -->
                  	<c:choose>
                  		<c:when test="${ cr.crevGra eq 0.5 }">
                  			<i class="fas fa-star-half-alt"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 1.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 1.5 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star-half-alt"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 2.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 2.5 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star-half-alt"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 3.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="far fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 3.5 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star-half-alt"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 4.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="far fa-star"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 4.5 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star-half-alt"></i>
                  		</c:when>
                  		<c:when test="${ cr.crevGra eq 5.0 }">
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  			<i class="fas fa-star"></i>
                  		</c:when>
                  	</c:choose>
                    
                </td>
              </tr>
            </thead>
            <tbody>
              <tr>
              <fmt:formatDate var="date" value="${ cr.crevDate }" pattern="yyyy-MM-dd"/>
                <td>${ cr.id } &nbsp; | &nbsp; ${ date }
                <button id="userReport" data-bs-toggle="modal" data-bs-target="#userModal">
                      <!-- <i class="fas fa-bullhorn"></i> -->
                      <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                </button>
                </td>
                
              </tr>
              <tr>
                <td>
                  <img src="${ contextPath }/resources/muploadFiles/review/${ cr.crevIchName }" id="reviewImg">
                </td>
                <td>
                  <div id="rv-content">
                      <p id="rv-pre">
						${ cr.crevCon }
                      </p>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          </c:forEach>
          <!-- 버튼 -->
          <div class="floatLeft" id="btnFloat">
            <div>
            <c:if test="${ pi.currentPage > 1 }">
            <c:url var="before" value="/cafe/detail?caCode=${ param.caCode }">
              	<c:param name="page" value="${ pi.currentPage -1 }" />
           	 </c:url>
              <a class="rBtn" id="upBtn" href="${ before }">
              	<i class="fa fa-chevron-up" aria-hidden="true"></i>
              </a>
             </c:if>
            </div>
            <div>
            <c:if test="${ pi.currentPage < pi.maxPage }">
            <c:url var="after" value="/cafe/detail?caCode=${ param.caCode }">
                   <c:param name="page" value="${ pi.currentPage + 1 }" />
	        </c:url>
              <a class="rBtn" id="downBtn" href="${ after }" >
              	<i class="fa fa-chevron-down" aria-hidden="true"></i>
              </a>
             </c:if>
            </div>
          </div>
        </div>
</body>
</html>