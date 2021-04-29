<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음료 세부 내역 페이지</title>
</head>
<body>
<!-- Modal -->
<div class="modal-wrapper">
 <div class="modalCafe">
 <div class="headModal">
     <h5 class="headerM">음료 주문 내역</h5>
     <div class="mod-close trigger headerM" >
         <i class="fa fa-times" id="closeIcon" aria-hidden="true"></i>
     </div>
 </div>
 <div class="contentMod">
     <div class="container">
         <div class="row row-cols-1 row-cols-md-2">
         <!-- col -->
         <c:forEach var="bOrder" items="${ beverageOrder }">
        <div class="col">
            <div class="card mb-4">
                <div class="row g-0">
                    <div class="col-md-4" id="cardImg">
                    <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ bOrder.cfIchname }" alt="음료주문사진">
                    </div>
                    <div class="col-md-8">
                    <div class="card-body">
                        <table class="card-table">
                            <thead>
                                <tr><td colspan="2"><h5 class="blackColor">${ bOrder.cfName }</h5></td></tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="blackColor">수량</td>
                                    <td class="redCard">${ bOrder.cfResAmount }</td>
                                </tr>
                                <tr>
                                    <td class="blackColor">종류 </td>
                                    <td class="redCard">${ bOrder.cfResHI }</td>
                                </tr>
                                <tr>
                                    <td class="blackColor">용량</td>
                                    <td class="redCard">${ bOrder.cfResCap }</td>
                                </tr>
                                <tr>
                                    <td class="blackColor">컵</td>
                                    <td class="redCard">${ bOrder.cfResCup }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
                </div>
                </div>
        </div>
        </c:forEach>
            
            </div>
        </div>
        
    </div>
    
	
</div>
   </div>
</body>
</html>