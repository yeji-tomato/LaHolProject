<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<!-- menubar css -->
<!-- <link rel="stylesheet" href="<c:url value="/resources/menubar.css"/>"> -->
<link rel="stylesheet" href="${ contextPath }/resources/css/common/footer.css" type="text/css">
<!--푸터 bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>
<body>
	<!-- Footer(푸터) -->
    <footer id="btFooter" style="background:#4B654A;">
        <div id="btF">
        <div class="name">
        
        <div id="a">   
        <img id="la" src="${ contextPath }/resources/img/common/whiteLogo.png" style="float: left;  width: 100px;">
        <a id="aa">LaHol</a>
        <div class="container">
            <div class="row">
                <div class="col" id="footeralign">
                    <ul>
                        <li>  Ye Ji Lee</li>
                        <li>  Youn Jae Lee</li>
                        <li>  Dayoon Choi </li>
                        <li>  Wan Sik Kim </li>
                        <li>  Jin Ju Baek </li>
                    </ul>
                </div>
                <div class="col">
                    <table>
                        <th colspan="2"><h6>Futuer Developer</h6></th>
                        <tr>
                            <td>
                                <img id="Monitor"  src="${ contextPath }/resources/img/common/footer/Monitor.jpg" >
                            </td>
                            <td>
                                &nbsp;Digital Content Convergence
                                &nbsp;Application SW Engineer Training 
                                &nbsp;Course (5)
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img id="Phone"  src="${ contextPath }/resources/img/common/footer/PhoneCall.jpg" > 
                            </td>
                            <td>
                                &nbsp;+97 (90) 97 92 96
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">2020.0925 ~ 2021.05.04</td>
                        </tr>
                    </table>
                </div>
                </div>
            </div>


        </div>
        
        <div class="de">
            <p id="devTool">Development tools</p>

            <div class="devImg">
                <img id="html" src="${ contextPath }/resources/img/common/footer/PhoneCall.jpg">      
                <img id="javascript" src="${ contextPath }/resources/img/common/footer/js.jpg" style="margin-left: 50px;" >      
                <img id="googledrive " src="${ contextPath }/resources/img/common/footer/gogle.png" style="margin-left: 100px;">  
                <img id="visualstudio" src="${ contextPath }/resources/img/common/footer/vs.png" style="margin-left: 150px;">          
            </div>
        </div>

        </div>
        </div>
    </footer>
</body>
</html>