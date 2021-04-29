<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   <script type="text/javascript">
   $( document ).ready(function() {	
       $('.trigger').on('click', function() {
           $('.modal-wrapper').toggleClass('open');
           return false;
       });
   </script>
</body>
</html>