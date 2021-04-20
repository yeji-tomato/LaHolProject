<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/main/ct.css?A">
</head>
<style>

 background-color: #f6ebdb;
  
       
       
</style>



<body>
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
 <div class="banner" style="  height: 100px;
">
        <h1 style="padding-top: 18vh;">라홀의 가족이 되시는 것을 환영합니다</h1>
    </div>
    <div>
        	
        <!--입력란-->
        <div id="tbColor">

        <div id="createform">
            <div class= "content-header">
                <h2 class = "intro5">
                    라홀 제품 등록
                </h2>
                <pre class = "intro" id="intro5-sub">
                   제품 등록전에 판매 약관을 읽어보시고 동의하여 주십시요 . 차후에 약관정보 미숙지 및 약관 정보를 
                   위배하시면 불이익일 생기실수있습니다.
                </pre>
                </div>

                <div class="container">

          
                        <div class="row" style="margin-top: 30px;">
                            <div class="col-sm-12 text-center">
                                <div class="col-sm-3"></div>
        
                                <div class="col-sm-6">
        
                                                                                 
                                   	<form   id="terms_form" action="${ contextPath }/store/insert"  method="post" enctype="multipart/form-data" >
                                  
                                        <table class="table table-boardered">
                                            <tr>
                                                <th>카테고리</th>
                                                <td><select id="area5" name="ST_CATAGORY"
                                                    style="width: 102px; float: left;">
                                                        <optgroup label="판매카테고리">
                                                            <option value="텀블러">텀블러</option>
                                                            <option value="접시">접시</option>
                                                            <option value="식기류">식기류</option>
                                                            <option value="커피머신">커피머신</option>
                                                            <option value="굿즈">굿즈</option>
                                                            <option value="의류">의류</option>
                                                            <option value="기타">기타</option>
                                                        </optgroup> 
                                                </select></td>
                                            </tr>
                                            <tr>
                                                <th  >제품명</th>
                                                <td><input type="text" class="form-control"
                                                    name="PR_NAME" required placeholder="제품명은 최대8글자입니다"
                                                    maxlength="8"></td>
                                            </tr>
                                            
                                            <tr>
                                                <th>이벤트/한줄소개</th>
                                                <td><input type="text" class="form-control"
                                                    name="PR_EVENT" required placeholder=" ex)맛있는 원두커피 1kg 대용량/10+1 행사/신선한 당일로스팅 원두/홀릭커피"></td>
                                            </tr>
        
                                            <tr>
                                                <th>원산지</th>
                                                <td><input type="text" class="form-control"
                                                    name="ORIGIN" required   ></td>
                                            </tr>
        
                                            
        
                                            <tr>
                                                <th>제품가격</th>
                                                <td><input type="text"  
                                                    name="PR_PRICE" class="form-control" placeholder=" 숫자만입력하세요."></td>
                                            </tr>
                                            <tr>
                                                <th>구독가능여부 </th>
                                                <td align="left" ><input type="radio" name="SUBSCRIPTIONS" value="Y" /> 사용
                                                    <input type="radio" name="SUBSCRIPTIONS" value="N" checked="checked" /> 미사용</td>
                                            </tr>
                                            <tr> 
                                                <th>상품이미지</th>
                                                <td><input  type="file"  name="mainfile" style="float: left;"><input
                                                    type="file"  name="file1"><input
                                                    type="file"  name="file2"></td>
                                            </tr>
                                             
                                            <tr>
                                                <th>택배사</th>
                                                <td><select id="area5" name="DY_COMPANY"
                                                    style="width: 102px; float: left;">
                                                        <optgroup label="택백사선택">
                                                            <option value="로젠">로젠</option>
                                                            <option value="한진">한진</option>
                                                            <option value="CJ">CJ</option>
                                                            <option value="쿠팡">쿠팡</option> 
                                                        </optgroup> 
                                                </select></td>
                                            </tr>
                                             <tr>
                                                <th>제품소개</th>
                                                <td><textarea rows="5" cols="40" name="PR_IF"  class="form-control"> </textarea></td>
                                            </tr>
                                            <tr>
                                                <th>제품기능설명</th>
                                                <td><textarea rows="5" cols="40" name="PR_INF"  class="form-control"> </textarea></td>
                                            </tr>
                                                <tr>
                                                <th>제품유의사항</th>
                                                <td><textarea rows="5" cols="40" name="PR_NOTICE"  class="form-control"> </textarea></td>
                                            </tr>
        
                                            <tr>
                                                
                                            </tr>
        
                                            <tr>
                                               
                                            </tr>
                                            <tr>
                                                <th>제품고객센터</th>
                                                <td><input type="text" name="SERVICE_CENTER" required
                                                    class="form-control"></td>
                                            </tr>
         
                                        </table>
                                        <tr>  제품 판매약관
                                                
                                            <pre style="height: 271px; white-space: pre-wrap; font-family: Nanum Gothic;">  라홀 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 라홀 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘라홀)와 이를 이용하는 라홀 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 라홀 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                                                
           라홀 서비스를 이용하시거나 라홀서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다
                                                
             라홀 서비스를 이용하시거나 라홀서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다라홀 서비스를 이용하시거나 라홀서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다
                                                
                       그냥 아무거나 써논겁니다.            
                                             </pre>
                                            
                                            </tr> 
                                            <tr>
                                                <td>
                                               <input type="checkbox" id="check_1"  name="" /> 제품 판매 이용약관 동의<br />
                       							 <input type="checkbox" id="check_2"  name="" /> 개인정보 수집 및 정보 이용 동의<br />
         										<input type="checkbox" id="check_3"  name="" /> 판매 위치정보 이용약관 동의<br />
			                                              
                                                </td>
                                            </tr>
                                            <br>
                                            <br>
                                            <br>
                                            <tr>
                                                <td colspan="2">
                                                    <input  type="button" id="nextBtn" value="등록"> 
                                                    <button type="button" id="btnArea2"
                                                        onclick="javascript:history.back();">취소</button> 
                                                </td>
                                            </tr>
        
        
                                    </form>
                             </div>
        
                            </div>
                           
                          <script >
        $(document).ready(function(){
    
            $("#nextBtn").click(function(){    
                if($("#check_1").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return;
                }else if($("#check_2").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                    return;
                }else if($("#check_3").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
                    return;
                }else{
                    $("#terms_form").submit();
                }
            });    
        });
    </script> 
                           
                           
                           
                           
                           
                           
                           
                           
         
                        </div>
                        <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script> 
                        <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
        
                   
                </div>
        </div>

        
        
    </div>
    </div>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>