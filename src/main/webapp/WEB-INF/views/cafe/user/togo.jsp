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
<body>

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
            <input type="hidden" name="caNo" id="caCode" value="${ param.caCode }">
            <input type="hidden" id="userId" name="userId" value="${ loginUser.id }">
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
                    
                    <tr>
                        <td colspan="2" class="tdName"><h4>날짜</h4></td>
                    </tr>
                    <tr>
                        <td class="tdTogo">
                            <input
                            id="date"
                            class="datepicker"
                            name="caResDate"
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
                            <input type="time" id="text" value="xxx" min="yyy" max="zzz" class="timeSelect" name="caResGoTime">
                        </td>
                    </tr>
                </tbody>
                </table>
            </div>
                <div class="btnDiv">
                <!-- <button class="btnCafe" id="menuBtn" onclick="menuClick">
                    MENU
                </button> -->
                <!-- <input class="modal-ck" type="checkbox" id="modal-ck" name="modal-ck"/> -->
                <button class="btnCafe" id="confirm">
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
    console.log($(".timeSelect").val());
</script>
<script>
     
    function goBack() { 
    	window.history.back(); 
    }
    
    
    
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	$(function(){
		
		$("#confirm").on("click", function(){
			
			const Date = $("#date").val();
			const  caResTime = $(".timeSelect").val();
			const userId = $("#userId").val();
			const caNo = $("#caCode").val();
			
			$.ajax({
				url:"${ contextPath }/cafe/togo/insert",
				type : "post",
				data : {
					caNo : caNo,
					userId : userId,
					caDate : Date,
					caResTime : caResTime
				},
				success : function(data){
					Swal.fire({
		    			  text: '포장 예약이 완료되었습니다!',
		    			  imageUrl: 'https://images.unsplash.com/photo-1607473129381-ca8345af56ac?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
		    			  imageWidth: 400,
		    			  imageHeight: 200,
		    			  imageAlt: 'Custom image',
		    		}).then((result) => {
		    			location.href='${ contextPath }/cafe/beverage?caCode=${ param.caCode }';
		    		})
				},
				error : function(e){
					console.log(e);
				}
			});
		});
	});

</script>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>

</body>
</html>