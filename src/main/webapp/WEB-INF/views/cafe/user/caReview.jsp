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
                  <i class="fa fa-user-circle" aria-hidden="true"></i>
                  <!-- 별점 -->
                      <i class="fa fa-star" aria-hidden="true"></i>
                      <i class="fa fa-star" aria-hidden="true"></i>
                      <i class="fa fa-star" aria-hidden="true"></i>
                      <i class="fa fa-star-half-o" aria-hidden="true"></i>
                      <i class="fa fa-star-o" aria-hidden="true"></i>
                    <button id="userReport" data-bs-toggle="modal" data-bs-target="#userModal">
                      <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                    </button>
                </td>
              </tr>
            </thead>
            <tbody>
              <tr>
              <fmt:formatDate var="date" value="${ cr.crevDate }" pattern="yyyy-MM-dd"/>
                <td>${ cr.id } &nbsp; | &nbsp; ${ date }</td>
              </tr>
              <tr>
                <td>
                  <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cr.crevIchName }" id="reviewImg">
                </td>
                <td style="padding-left: 3%;">
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