<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common/footer2.css" type="text/css">
</head>
<body>
	<!-- Footer(푸터) -->
    <footer class="Footer">
 
        <!-- 전체 영역-->
        <div class="one">

             <!-- 처음 영역-->
            <div class="first">

                  <!-- 말영역, 이름-->
                <div class="ha" style="float: left;  ">
                        <div class="icon" style="  float: left;">
                            <img id="la" src="${ contextPath }/resources/img/common/whiteLogo.png" style=" width: 120px;margin-left: 60px;margin-top: 20px;"> 
                        </div >
                        <div class="name"  > 
                            <div style=" margin-top: 40px;margin-left: 30px; ">
                            <a style="font-size: 35px;"> Lahol </a>
                                <div style=" margin-top: 50px;">
                                    <ul class="ftUl">
                                        <li class="ftli"><a href="${ contextPath }/playground/testResult">Ye Ji Lee</a></li>
                                        <li class="ftli"><a href="${ contextPath }/admin/user/normalList">Youn Jae Lee</a></li>
                                        <li class="ftli"><a href="${ contextPath }/common/error">Dayoon Choi</a></li>
                                        <li class="ftli">  Wan Sik Kim </li>
                                        <li class="ftli">  Jin Ju Baek </li>
                                    </ul>
                                </div>
                            </div>  
                        </div>
                    
               
                    
                </div> 
                <!-- 전화영역-->
                <div class="phone" >  
                    <table style="font-size: 10px;margin-top: 35px;  border-spacing: 5px 20px;">
                        <th colspan="2" style="float: left;"><h6>Futuer Developer</h6></th>
                        <tr>
                            <td>
                                <!-- <img id="Monitor"  src="/resources/images/img_common/footerIMG/Monitor.jpg" > -->
                                <img id="Monitor"  src="${ contextPath }/resources/img/common/footer/Monitor.jpg" >
                            </td>
                            <td >
                                Digital Content Convergence<br>
                                Application SW Engineer Training Course (5)
                                <br>
                            </td>
                        </tr>
                        <br>
                        <tr>
                            <td>
                                <!-- <img id="Phone"  src="/resources/images/img_common/footerIMG/PhoneCall.jpg" >  -->
                                <img id="Phone"  src="${ contextPath }/resources/img/common/footer/PhoneCall.jpg" >
                            </td>
                            <td>
                                +97 (90) 97 92 96
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">2020.0925 ~ 2021.05.04</td>
                        </tr>
                    </table>
                </div> 
            </div>

             <!-- 중간 영역-->
            <div class="second" >
                <div class="de">
                    <div>
                    <p id="devTool">Development tools</p> 
                        <div class="devImg">
                            <img id="html" src="${ contextPath }/resources/img/common/footer/PhoneCall.jpg">      
                            <img id="javascript" src="${ contextPath }/resources/img/common/footer/js.jpg" >      
                            <img id="googledrive " src="${ contextPath }/resources/img/common/footer/gogle.png" >  
                            <img id="visualstudio" src="${ contextPath }/resources/img/common/footer/vs.png" >  
                        </div>
                    </div>
                </div>
            </div> 
             
             
        </div>
         

        
    </footer>
</body>
</html>