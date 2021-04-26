<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 주문 확인</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/order.css" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/css/cafe/bus/sideMenu.css" type="text/css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>

	<!-- 사업자 menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

<!-- 카페 사이드 메뉴 바 -->
<div class="cafe-sidemenubar">
    <div id="side" class="col-cf">
    <ul class="side-menu">
        <li class="side-item" id="cafeHome"> 
                <div class="side-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                        <path   d="M18 12H19.9248C20.8933 12 21.2962 10.7609 20.513 10.1913L12.5881 4.42778C12.2375 4.17276 11.7625 4.17276 11.4118 4.42778L3.48699 10.1913C2.70374 10.7609 3.10668 12 4.07516 12H5.99998V19C5.99998 19.5523 6.44769 20 6.99998 20H9.99998V14H14V20H17C17.5523 20 18 19.5523 18 19V12Z"/>
                    </svg>
                </div>
                <p class="menu-text">HOME</p>
        </li>
        <li class="side-item active" id="cafeOrd">
                <div class="side-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                        <path  fill-rule="evenodd" d="M15 5H18C19.1046 5 20 5.89543 20 7V19C20 20.1046 19.1046 21 18 21H6C4.89543 21 4 20.1046 4 19V7C4 5.89543 4.89543 5 6 5H9C9 3.34315 10.3431 2 12 2C13.6569 2 15 3.34315 15 5ZM13 5C13 5.55228 12.5523 6 12 6C11.4477 6 11 5.55228 11 5C11 4.44772 11.4477 4 12 4C12.5523 4 13 4.44772 13 5ZM6 9C6 8.44772 6.44772 8 7 8H17C17.5523 8 18 8.44772 18 9C18 9.55228 17.5523 10 17 10H7C6.44772 10 6 9.55228 6 9ZM7 12C6.44772 12 6 12.4477 6 13C6 13.5523 6.44772 14 7 14H17C17.5523 14 18 13.5523 18 13C18 12.4477 17.5523 12 17 12H7ZM7 16C6.44772 16 6 16.4477 6 17C6 17.5523 6.44772 18 7 18H10C10.5523 18 11 17.5523 11 17C11 16.4477 10.5523 16 10 16H7Z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <p class="menu-text">주문 내역</p>
        </li>
        <li class="side-item" id="cafeRes">
                <div class="side-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" viewBox="0 0 24 24">
                        <path d="M12,19a1,1,0,1,0-1-1A1,1,0,0,0,12,19Zm5,0a1,1,0,1,0-1-1A1,1,0,0,0,17,19Zm0-4a1,1,0,1,0-1-1A1,1,0,0,0,17,15Zm-5,0a1,1,0,1,0-1-1A1,1,0,0,0,12,15ZM19,3H18V2a1,1,0,0,0-2,0V3H8V2A1,1,0,0,0,6,2V3H5A3,3,0,0,0,2,6V20a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V6A3,3,0,0,0,19,3Zm1,17a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V11H20ZM20,9H4V6A1,1,0,0,1,5,5H6V6A1,1,0,0,0,8,6V5h8V6a1,1,0,0,0,2,0V5h1a1,1,0,0,1,1,1ZM7,15a1,1,0,1,0-1-1A1,1,0,0,0,7,15Zm0,4a1,1,0,1,0-1-1A1,1,0,0,0,7,19Z"/>
                    </svg>
                </div>
                <p class="menu-text">예약 내역</p>
        </li>
        <li class="side-item" id="cafeWri">
                <div class="side-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                        <path  d="M17.864 3.60051C17.4735 3.20999 16.8403 3.20999 16.4498 3.60051L15.0356 5.01472 19.2782 9.25736 20.6924 7.84315C21.0829 7.45263 21.0829 6.81946 20.6924 6.42894L17.864 3.60051zM17.864 10.6716L13.6213 6.42894 4.72185 15.3284C4.53431 15.516 4.42896 15.7703 4.42896 16.0355L4.42896 18.864C4.42895 19.4163 4.87667 19.864 5.42896 19.864H8.25738C8.5226 19.864 8.77695 19.7586 8.96449 19.5711L17.864 10.6716z"/>
                    </svg>
                </div>
                <p class="menu-text">카페 등록</p>
        </li>
        <li class="side-item" id="cafeCon">
                <div class="side-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
                        <path  fill-rule="evenodd" d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22ZM15.5355 8.46447C15.9261 8.07394 16.5592 8.07394 16.9498 8.46447C17.3403 8.85499 17.3403 9.48816 16.9498 9.87868L11.2966 15.5318L11.2929 15.5355C11.1919 15.6365 11.0747 15.7114 10.9496 15.7602C10.7724 15.8292 10.5795 15.8459 10.3948 15.8101C10.2057 15.7735 10.0251 15.682 9.87868 15.5355L9.87489 15.5317L7.05028 12.7071C6.65975 12.3166 6.65975 11.6834 7.05028 11.2929C7.4408 10.9024 8.07397 10.9024 8.46449 11.2929L10.5858 13.4142L15.5355 8.46447Z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <p class="menu-text">카페 확인</p>
        </li>
    </ul>
    </div>
    <%@include file="./sideMenu.jsp" %>
    
    
<div class="res-container" style="height: 100vh">
    <div id="od" class="col-cf">
        <div class="order_table">
            <h2>주문 내역</h2>
                <table class="table" id="orderTB">
                
                    <thead>
                    <tr>
                        <td colspan="9" style="text-align: center;">
                       <button class="btnOrd arrowBtn">
                           <i class="fa fa-chevron-left" aria-hidden="true"></i>
                       </button>
                       &nbsp;
                       <b style="font-size: 20px;">2016-03-04</b>&nbsp;
                       <button class="btnOrd arrowBtn">
                           <i class="fa fa-chevron-right" aria-hidden="true"></i>
                       </button>
                   </td>
               </tr>
               <tr> 
                   <td scope="col">#</td>
                   <td scope="col">주문명</td>
                   <td scope="col">고객이름</td>
                   <td scope="col">휴대폰 번호</td>
                   <td scope="col">예약</td>
                   <td scope="col">시간</td>
                   <td scope="col">상세보기</td>
                   <td scope="col">주문상태</td>
               </tr>
               </thead>
               <tbody id="tbody">
               <c:forEach var="ord" items="${ cafeOrderlist }">
                       <tr>
                       <td>${ ord.caResNo }</td>
                       <td>${ ord.cfName }</td>
                       <td>${ ord.name }</td>
                       <td>${ ord.phone }</td>
                       <td>${ ord.caResType }</td>
                       <c:set var="hereTogo" value="${ ord.caResType }" />
                       <c:if test="${ hereTogo eq '매장' }">
				        	<td>${ ord.caHereTime }</td>
				        </c:if>
				        <c:if test="${ hereTogo eq '포장' }">
				        	<td>${ ord.caGoTime }</td>
				        </c:if> 
                       <td class="mod trigger">
                           <i class="fa fa-arrow-right" aria-hidden="true"></i>
                       </td>
                       <td>
                           <div class="btn-group" role="group">
                               <button disabled style="color: black;" class="btnOrd">
                                   <li id="statusCf">${ ord.caResing }</li>
                               </button>
                               <button id="btnGroupDrop" type="button" onclick="coffeeStatus('${ ord.caResNo }')" data-bs-toggle="dropdown" class="btnOrd" >
                                   <i class="fa fa-caret-down" aria-hidden="true"></i>
                               </button>
                               <ul class="dropdown-menu" aria-labelledby="btnGroupDrop">
                                   <li class="btnOrd check" id="cofBef">
                                          	 제조 전
                                   </li>
                                   <li class="btnOrd check" id="cofIng">
                                           	제조 중
                                   </li>
                                   <li class="btnOrd check" id="cofFin"> 
                                           	제조 완료
                                   </li>
                               </ul>
                               <c:set var="caResNo" value="${ ord.caResNo }" />
                           </div>
                           <script>
                           function coffeeStatus(caResNo){
                        	   $(".check").click (function(){
                                   var coffeeStatus = ($(this).text()).trim();
                                   console.log(caResNo);
                                   Swal.fire({
                                   	  title: coffeeStatus,
                                   	  text : "(으)로 바꾸시겠습니까?",
                                   	  icon: 'question',
                                   	  showCancelButton: true,
                                   	  confirmButtonColor: '#4B654A',
                                   	  cancelButtonColor: '#810B0B',
                                   	  confirmButtonText: 'Yes'
                                   	}).then((result) => {
                                   	  if (result.isConfirmed) {
                                   	    Swal.fire({
                                   	       title: coffeeStatus,
                                   	       text : '으로 변경되었습니다!',
                                   	       icon: 'success',
                                   	      confirmButtonColor: '#4B654A'
                                   	  })
                                   	    $.ajax({
                   			       			url:"${ contextPath }/cafe/biz/ing",
                   			        		type : "post",
                   			        		data : {
                   			        			caResing : coffeeStatus,
                   			        			caResNo : caResNo
                   			        		},
                   			        		success : function(data){
                   			        			$("#statusCf").text(coffeeStatus);
                   			        		},
                   			        		error : function(e){
                   								console.log(e);
                   							}
                   			        		
                   			       		});
                                   	  }
                                   	})

                                   
                               });
                           }
                           
                           </script>
                       </td>
                       </tr>
               </c:forEach>
           </tbody>
           
       </table>
       <!-- Modal -->
       <div class="modal-wrapper">
           <div class="modalCafe">
           <div class="headModal">
               <h5 class="headerM">음료 주문 내역</h5>
               <a class="mod-close trigger headerM" href="#">
                   <i class="fa fa-times" id="closeIcon" aria-hidden="true"></i>
               </a>
           </div>
           <div class="contentMod">
               <div class="container">
                   <div class="row row-cols-1 row-cols-md-2">
                   <!-- col -->
                   <div class="col">
                       <div class="card mb-4">
                           <div class="row g-0">
                               <div class="col-md-4" id="cardImg">
                               <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/02/[9200000001635]_20210225092236748.jpg" alt="음료주문사진">
                               </div>
                               <div class="col-md-8">
                               <div class="card-body">
                                   <table class="card-table">
                                       <thead>
                                           <tr><td colspan="2"><h5 class="card-title">콜드 브루 플로트</h5></td></tr>
                                       </thead>
                                       <tbody>
                                           <tr>
                                               <td>수량</td>
                                               <td class="redCard">1</td>
                                           </tr>
                                           <tr>
                                               <td>종류 </td>
                                               <td class="redCard">ICE</td>
                                           </tr>
                                           <tr>
                                               <td>용량</td>
                                               <td class="redCard">Tall</td>
                                           </tr>
                                           <tr>
                                               <td>컵</td>
                                               <td class="redCard">매장컵</td>
                                           </tr>
                                       </tbody>
                                   </table>
                               </div>
                               </div>
                           </div>
                           </div>
                   </div>
                   <!-- col -->
                   <div class="col">
                       <div class="card mb-4">
                           <div class="row g-0">
                               <div class="col-md-4" id="cardImg">
                               <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[128192]_20150803101501786.jpg" alt="음료주문사진">
                               </div>
                               <div class="col-md-8">
                               <div class="card-body">
                                   <table class="card-table">
                                       <thead>
                                           <tr><td><h5 class="card-title">화이트 초콜릿 모카</h5></td></tr>
                                       </thead>
                                       <tbody>
                                           <tr>
                                               <td>수량</td>
                                               <td class="redCard">1</td>
                                           </tr>
                                           <tr>
                                               <td>종류 </td>
                                               <td class="redCard">ICE</td>
                                           </tr>
                                           <tr>
                                               <td>용량</td>
                                               <td class="redCard">Tall</td>
                                           </tr>
                                           <tr>
                                               <td>컵</td>
                                               <td class="redCard">매장컵</td>
                                           </tr>
                                       </tbody>
                                   </table>
                               </div>
                               </div>
                           </div>
                           </div>
                   </div>
                   <!-- col -->
                   <div class="col">
                       <div class="card mb-4">
                           <div class="row g-0">
                               <div class="col-md-4" id="cardImg">
                               <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/02/[9200000001635]_20210225092236748.jpg" alt="음료주문사진">
                               </div>
                               <div class="col-md-8">
                               <div class="card-body">
                                   <table class="card-table">
                                       <thead>
                                           <tr><td colspan="2"><h5 class="card-title">콜드 브루 플로트</h5></td></tr>
                                       </thead>
                                       <tbody>
                                           <tr>
                                               <td>수량</td>
                                               <td class="redCard">1</td>
                                           </tr>
                                           <tr>
                                               <td>종류 </td>
                                               <td class="redCard">ICE</td>
                                           </tr>
                                           <tr>
                                               <td>용량</td>
                                               <td class="redCard">Tall</td>
                                           </tr>
                                           <tr>
                                               <td>컵</td>
                                               <td class="redCard">매장컵</td>
                                           </tr>
                                       </tbody>
                                   </table>
                               </div>
                               </div>
                           </div>
                           </div>
                   </div>
                   <!-- col -->
                   <div class="col">
                       <div class="card mb-4">
                           <div class="row g-0">
                               <div class="col-md-4" id="cardImg">
                               <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[128192]_20150803101501786.jpg" alt="음료주문사진">
                               </div>
                               <div class="col-md-8">
                               <div class="card-body">
                                   <table class="card-table">
                                       <thead>
                                           <tr><td><h5 class="card-title">화이트 초콜릿 모카</h5></td></tr>
                                       </thead>
                                       <tbody>
                                           <tr>
                                               <td>수량</td>
                                               <td class="redCard">1</td>
                                           </tr>
                                           <tr>
                                               <td>종류 </td>
                                               <td class="redCard">ICE</td>
                                           </tr>
                                           <tr>
                                               <td>용량</td>
                                               <td class="redCard">Tall</td>
                                           </tr>
                                           <tr>
                                               <td>컵</td>
                                               <td class="redCard">매장컵</td>
                                           </tr>
                                       </tbody>
                                   </table>
                               </div>
                               </div>
                           </div>
                           </div>
                   </div>
                   
                   </div>
               </div>
               
           </div>

       </div>
       <!-- 페이징 바 -->
           <div aria-label="Page navigation" class="cafe-order-page">
               <ul class="pagination">
                   <li class="page-item">
                   <a class="page-link" id="page-color" href="#" aria-label="Previous">
                       <span aria-hidden="true">&laquo;</span>
                   </a>
                   </li>
                   <li class="page-item" id="page-hover"><a class="page-link" id="page-color" href="#">1</a></li>
                   <li class="page-item"><a class="page-link" id="page-color" href="#">2</a></li>
                   <li class="page-item"><a class="page-link" id="page-color" href="#">3</a></li>
                   <li class="page-item">
                   <a class="page-link" id="page-color" href="#" aria-label="Next">
                       <span aria-hidden="true">&raquo;</span>
                   </a>
                   </li>
               </ul>
               </div>
           </div>
       <script>
           

            // Modal
            $( document ).ready(function() {
            $('.trigger').on('click', function() {
                $('.modal-wrapper').toggleClass('open');
                return false;
            });
});
        </script>


        </div>
    </div>
    </div>
    </div>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>