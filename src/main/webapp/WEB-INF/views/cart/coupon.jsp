<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<style>
	@font-face {
    font-family: 'NEXON Lv1 Gothic OTF Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}  

*{
    font-family: 'NEXON Lv1 Gothic OTF Bold';
}
	
	.coupon{
		margin : 10%;
	}
	
.btnCenter{
	padding-top : 5%;
	text-align: center;
}	
	
.couBtn{
	background: #5A452E; 
	color: white;
	border : 0;
	border-radius : 5%;
	padding: 1% 3% 1% 3%;
}
</style>
</head>
<body>
	<div class="coupon">
	<div class="rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="background: #F3EFEB;">쿠폰 목록</div>
       <div class="p-4">
         <div class="list-unstyled mb-4">
         	<table style="width : 100%">
         		<tbody>
         			<tr>
         				<c:forEach var="coupon" items="${ couponlist }">
	         			<td class="d-flex justify-content-between py-3 border-bottom">
	         				 <input type="radio" name="radioTxt" value="${ coupon.couponName }">
	         				 <strong>${ coupon.couponName }</strong>
	         			</td>
	         			</c:forEach>
         			</tr>
         		</tbody>
         	</table>
         	
         	<div class="btnCenter">
         		<button class="couBtn" onclick="">확인</button>
         		<button class="couBtn">취소</button>
         	</div>
         </div>
       </div>
     </div>
</body>
</html>