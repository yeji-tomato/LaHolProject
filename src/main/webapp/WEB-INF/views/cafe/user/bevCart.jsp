<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 장바구니</title>
<!-- beverage css -->
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/beverage.css">
</head>
<body>
	<script>
		$(function(){
			$.ajax({
				url:"${ contextPath }/cafe/coRes/basket",
				type: "get",
				data : CoffeeRes,
				dataType : 'jsp',
				success : function(data){
					alert("불러오는 것에 대해 성공하였습니다.");
					
					
				},
				error : function(e){
					console.log(e);
				}
			});
		}); 
	</script>
	<div class="cart">
        <div class="cartTable">
        <button style="float:right;" class="cartCloseBtn">
			<i class="fa fa-times" aria-hidden="true"></i>
		</button>
		<script>
		$(function() {
            $(".cartCloseBtn").click(function(e) {
                e.preventDefault();
                $(".cart").removeClass("cartAdd");
            });
            });
		</script>
    <table>
        <thead>
            <tr style="width: 100%;">
                <td colspan="5">
                <div id="indexListAjax">
                    <i class="fa fa-coffee cTitle" id="cfIcon" aria-hidden="true"></i>
                    <h2 class="cTitle">${ cafeRes.caResType }</h2>
                    <fmt:formatDate var="date" value="${ cafeRes.caResDate }" pattern="yyyy-MM-dd"/>
                    <c:set var="hereTogo" value="${ cafeRes.caResType }" />
                    <c:if test="${ hereTogo eq '매장' }">
                    	<h4 style="color: #96877D;" class="cTitle">${ date } &nbsp; ${ cafeRes.caResHereTime } &nbsp; ${ cafeRes.caResPer }명</h4>
                    </c:if>
                    <c:if test="${ hereTogo eq '포장' }">
                    	<h4 style="color: #96877D;" class="cTitle">${ date } &nbsp; ${ cafeRes.caResGoTime } &nbsp; ${ cafeRes.caResPer }명</h4>
                    </c:if>
                 </div>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                	<c:forEach var="cfRes" items="${ CoffeeRes }">
                    <div class="card" id="cardCart">
                        <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cfRes.cfIchname }" class="card-img-top" alt="...">
                        <div class="card-body" id="card-body">
                            <h5 class="card-text">${ cfRes.cfName }</h5>
                            <button type="button" class="minus" id="pmBtn">
                                <i class="fa fa-minus" aria-hidden="true"></i>
                            </button>
                            <input type="number" class="cartNumBox" value="${ cfRes.cfResAmount }" min="1" max="100" readonly>
                            <button type="button" class="plus"  id="pmBtn">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                    </c:forEach>
                </td>
            </tr>
        </tbody>
    </table>
    <script>
        $(".plus").click(function(){
            var num = $(".cartNumBox").val();
            var plusNum = Number(num)+1;

            if(plusNum >= 100){
                $(".cartNumBox").val(num);
            }else{
                $(".cartNumBox").val(plusNum);
            }
        });

        $(".minus").click(function(){
            var num = $(".cartNumBox").val();
            var minusNum = Number(num)-1;

            if(minusNum <= 0){
                $(".cartNumBox").val(num);
            }else{
                $(".cartNumBox").val(minusNum);
            }
        })
    </script>
        <div class="cartBtn">
        <button id="card">
            <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
        </button>
        <button id="cart">
            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
        </button>
    </div>
</div>

</div>
</body>
</html>