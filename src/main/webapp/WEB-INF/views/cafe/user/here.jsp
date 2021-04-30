<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/here.css">
<!-- pickadate -->
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/pickadate/default.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/user/pickadate/default.date.css">
</head>
<body>

	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	<div class="page-cafe">
        <div>
            <h1 id="cafeName">${ cafeInfo.caName }</h1>
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
                <input type="hidden" id="mainPhoto" value="${ cafeInfo.mainPhoto }">
                    <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.mainPhoto }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.photo1 }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.photo2 }" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.photo3 }" class="d-block w-100" alt="...">
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
                            <i class="fa fa-coffee hT" id="htIcon" aria-hidden="true"></i>
                            <h1 class="hT" id="hereTitle">매장</h1>
                            <hr style="width:100%">
                        </td>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td colspan="2" class="tdName"><h4>날짜</h4></td>
                        </tr>
                        <tr>
                            <td class="tdHere">
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
                            <td class="tdHere">
                            <c:forTokens var="timeSta" items="${ cafeInfo.caStartTime  }" delims=":" varStatus="status">
                            	<c:if test="${ status.index eq 0 }">
	                            	<c:set var="startHH" value="${ timeSta }"/>
	                            </c:if>
	                            <c:if test="${ status.index eq 1 }">
	                            	<c:set var="startMM" value="${ timeSta }"/>
	                            </c:if>
                            </c:forTokens>
                            <c:forTokens var="timeEnd" items="${ cafeInfo.caEndTime }" delims=":" varStatus="status">
                            	<c:if test="${ status.index eq 0 }">
	                            	<c:set var="endHH" value="${ timeEnd }"/>
	                            </c:if>
	                            <c:if test="${ status.index eq 1 }">
	                            	<c:set var="endMM" value="${ timeEnd }"/>
	                            </c:if>
                            </c:forTokens>
                            <fmt:parseNumber var="sum_sthh" value="${ startHH }" integerOnly="true" /> 
                            <fmt:parseNumber var="sum_enhh" value="${ endHH }" integerOnly="true" />
                            <fmt:parseNumber var="sum_stmm" value="${ startMM }" integerOnly="true" /> 
                            <fmt:parseNumber var="sum_enmm" value="${ endMM }" integerOnly="true" />
							
							<c:set var="breakPoint" value="0" />
                                <select class="timeSelect" name="caResHereTime">
                                    <option disabled selected>예약은 2시간만 이용가능합니다.</option>
                                    <c:forEach var="i" begin="${ sum_sthh }" end="${ sum_enhh }" step="2">
                                    	<c:forEach var="j" begin="${ sum_stmm }" end="${ sum_enmm }">
                                    		<option><fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j}" /> - <fmt:formatNumber pattern="00" value="${i+2}" />:<fmt:formatNumber pattern="00" value="${j}" /></option>
                                    	</c:forEach>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tdName"><h4>인원</h4></td>
                        </tr>
                        <tr>
                            <td class="tdHere">
                                <fieldset data-quantity class="person">
                                    <button type="button" title="Down" class="sub">Down</button>
                                    <input type="number" name="caResPer" class="numBox" min="1" max="10" readonly>
                                    <button type="button" title="Up" class="add">Up</button>
                                </fieldset>
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
                    <button class="btnCafe" id="cancelBtn"  onclick="goBack()">
                        취소
                    </button>
                    </div>    
                </div>
        </div>
    </div>

    </div>
</div>
<script href="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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
    

    <!-- ajax post 보내기 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">
    	$(function(){
    		
    		$("#confirm").on("click", function(){
    			
    			var caNo = $("#caCode").val();
    			var userId = $("#userId").val();
    			const Date = $("#date").val();
        		var caResHereTime = $("select[name=caResHereTime] option:selected").text();
        		var caResPer = $(".numBox").val();
        		var mainPhoto = $("#mainPhoto").val();
        		
    			$.ajax({
    				url:"${ contextPath }/cafe/here/insert",
    				type : "post",
    				data : {
    					caNo : caNo,
    					userId : userId,
    					caDate : Date,
    					caResHereTime : caResHereTime,
    					caResPer : caResPer
    				},
    				success : function(data){
    					Swal.fire({
    		    			  text: '매장 예약이 완료되었습니다!',
    		    			  imageUrl: '${ contextPath }/resources/nuploadFiles/cafeImg/${ cafeInfo.photo3 }',
    		    			  imageWidth: 500,
    		    			  imageHeight: 200,
    		    			  imageAlt: 'Custom image',
    		    			  confirmButtonColor: '#E5BD62',
    		    		}).then((result) => {
    		    			location.href='${ contextPath }/cafe/beverage?caCode=${ cafeInfo.caCode }';
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