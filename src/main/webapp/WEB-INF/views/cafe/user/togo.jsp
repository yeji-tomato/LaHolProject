<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/togo.css">
<!-- pickadate -->
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/pickadate/default.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/pickadate/default.date.css">
</head>
<body style="background: #f0ebe5;">

	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<div class="page-cafe">
    <div>
        <h1 id="cafeName">LaHol 카페</h1>
    </div>
<div class="container">
    <div class="row">
        <!--왼쪽-->
        <div class="col">
        <!-- <img src="../resources/images/class/classp7.jpg" style="width: 400px; height: 500px;"> -->
        <!-- carousel -->
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner" id="caroselLeft">
            <div class="carousel-item active" data-bs-interval="10000">
                <img src="https://i.pinimg.com/564x/f2/ca/54/f2ca546edb3cd09e21cb3c64578f3232.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="2000">
                <img src="https://i.pinimg.com/564x/b6/a3/e0/b6a3e0fadac5e060c60e82683162c76d.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://i.pinimg.com/564x/18/9a/64/189a64011192664392d7705825e2aa1a.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://i.pinimg.com/564x/a1/ab/b6/a1abb6390ea859b66dd4041c3d2ec510.jpg" class="d-block w-100" alt="...">
            </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
            </button>
        </div>
        </div>
        <!--오른쪽-->
        <!-- 매장 폼 -->
        <div class="col-5">
            <div class="cf-info">
            <div class="cafeTB">
                <table class="cf-table">
                <thead>
                    <tr>
                    <td>
                        <i class="fa fa-shopping-bag hT" id="htIcon" aria-hidden="true"></i>
                        <h1 class="hT" id="hereTitle">포장</h1>
                        <hr style="width:100%">
                    </td>
                    </tr>
                </thead>
                <tbody>
                    <form>
                    <tr>
                        <td colspan="2" class="tdName"><h4>날짜</h4></td>
                    </tr>
                    <tr>
                        <td class="tdTogo">
                            <input
                            id="date"
                            class="datepicker"
                            name="date"
                            type="text"
                            autofocuss
                            value="DD MONTH, YYYY">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="tdName"><h4>시간</h4></td>
                    </tr>
                    <tr>
                        <td class="tdTogo">
                            <input type="time" id="text" value="xxx" min="yyy" max="zzz" class="timeSelect">
                        </td>
                    </tr>

                </form>
                </tbody>
                </table>
            </div>
                <div class="btnDiv">
                <!-- <button class="btnCafe" id="menuBtn" onclick="menuClick">
                    MENU
                </button> -->
                <!-- <input class="modal-ck" type="checkbox" id="modal-ck" name="modal-ck"/> -->
                <button class="btnCafe" id="confirm" onclick="location.href='${ contextPath }/cafe/beverage'">
                    확인
                </button>	
                <button class="btnCafe" id="cancelBtn" onclick="goBack()">
                    취소
                </button>
                </div>    
            </div>
    </div>
</div>

</div>
</div>

<!-- pickadate.js  -->
 <%@include file="./pickadate/picker.jsp" %>
 <%@include file="./pickadate/picker.date.jsp" %>
 <%@include file="./pickadate/legacy.jsp" %>      
<script>
    $('.datepicker').pickadate();
</script>
<script>
    $(".add").click(function(){
        var num = $(".numBox").val();
        var plusNum = Number(num)+1;

        if(plusNum >= 11){
            $(".numBox").val(num);
        }else{
            $(".numBox").val(plusNum);
        }
    });

    $(".sub").click(function(){
        var num = $(".numBox").val();
        var minusNum = Number(num)-1;

        if(minusNum <= 0){
            $(".numBox").val(num);
        }else{
            $(".numBox").val(minusNum);
        }
    });
  
    
    function goBack() { 
    	window.history.back(); 
    }
    
    
    
</script>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>

</body>
</html>