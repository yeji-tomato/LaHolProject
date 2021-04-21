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
    
    <link rel="stylesheet" href="${ contextPath }/resources/css/store/main/ct.css?Aㅇ">
</head>
<style>

 background-color: #f6ebdb;
  
       
       
</style>
<body>
	<!-- menubar -->
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
 <div class="banner">
        <h1 style="padding-top: 18vh;"> </h1>
    </div>
    <div>
        	
        <!--입력란-->
        <div id="tbColor2">

        <div id="createform">
            <div class= "content-header">
                <h2 class = "intro5">
                    라홀 제품 수정
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
        
                                                                                 
                                   	<form action="${ contextPath }/store/update"  method="post" enctype="multipart/form-data">
                                   	
                                  	<input type="hidden" name="PR_CODE" value="${ s.PR_CODE }">
                                  	
                                  	<c:if test="${ !empty s.STORE_PHOTO1 }">
                                  		<input  type="hidden" name="mainfile" value="${ s.STORE_PHOTO1 }"> 
										 <input type="hidden" name="fileSystemNames" value="${ s.STORE_PHOTO1 }">
                                  	</c:if>
                                  	 	<c:if test="${ !empty s.STORE_PHOTO2 }">
                                  		<input  type="hidden" name="file1" value="${ s.STORE_PHOTO2 }"> 
										 <input type="hidden" name="fileSystemNames" value="${ s.STORE_PHOTO2 }">
                                  	</c:if>
                                  	 	<c:if test="${ !empty s.STORE_PHOTO3 }">
                                  		<input  type="hidden" name="file2" value="${ s.STORE_PHOTO3 }"> 
										 <input type="hidden" name="fileSystemNames" value="${ s.STORE_PHOTO3 }">
                                  	</c:if>
                                  	
                                        <table class="table table-boardered">
                                            <tr>
                                                <th>카테고리</th>
                                                <td><select id="area5" name="ST_CATAGORY"
                                                    style="width: 102px; float: left;">
                                                    <option value="${  s.ST_CATAGORY }"> ${ s.ST_CATAGORY } </option>
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
                                                    name="PR_NAME" required value="${ s.PR_NAME } "
                                                    maxlength="8">  </td>
                                            </tr>
                                            
                                            <tr>
                                                <th>이벤트소개</th>
                                                <td><input type="text" class="form-control"
                                                    name="PR_EVENT" required value="${ s.PR_EVENT }"> </td>
                                            </tr>
        
                                            <tr>
                                                <th>원산지</th>
                                                <td><input type="text" class="form-control"
                                                    name="ORIGIN" required  value="${s.ORIGIN  }" >   </td>
                                            </tr>
        
                                          
        
                                            <tr>
                                                <th>제품가격</th>
                                                <td><input type="text"  
                                                    name="PR_PRICE" class="form-control"   value="${ s.PR_PRICE  }" > </td>
                                            </tr>  
											<!-- <tr>  구독기능은 수정 불가능
                                                <th>구독가능여부 </th>
                                                <td align="left" ><input type="radio" name="SUBSCRIPTIONS" value="Y" /> 사용
                                                    <input type="radio" name="SUBSCRIPTIONS" value="N" checked="checked" /> 미사용</td>
                                            </tr> -->
                                            <tr> 
                                                <th>상품이미지</th>
                                                <td>
                                                <input  type="file"  name="mainfile" > 기존메인파일:${s.STORE_PHOTO1 }
                                                <input type="file"  name="file1">기존추가이미지1:${s.STORE_PHOTO2 }
                                                <input type="file"  name="file2">기존추가이미지2:${s.STORE_PHOTO3 }
                                                    
                                                   
                                                     
                                                    </td>
                                            </tr>
                                             
                                             
                                           
                                            <tr>
                                                <th>택배사</th>
                                                <td><select id="area5" name="DY_COMPANY"
                                                    style="width: 102px; float: left;">
                                                     <option value="${ s.DY_COMPANY }"> ${ s.DY_COMPANY } </option>
                                                        <optgroup label="택백사선택"> 
                                                            <option value="로젠">로젠</option>
                                                            <option value="롯데">롯데</option>
                                                            <option value="CJ">CJ</option>
                                                            <option value="쿠팡">쿠팡</option> 
                                                        </optgroup> 
                                                </select></td>
                                            </tr>
                                             <tr>
                                                <th>제품소개</th>
                                                <td><textarea rows="5" cols="40" name="PR_IF"  class="form-control"  >${ s.PR_IF } </textarea></td>
                                            </tr>
                                            <tr>
                                                <th>제품기능설명</th>
                                                <td><textarea rows="5" cols="40" name="PR_INF"  class="form-control" >${ s.PR_INF }</textarea></td>
                                            </tr>
                                                <tr>
                                                <th>제품유의사항</th>
                                                <td><textarea rows="5" cols="40" name="PR_NOTICE"  class="form-control" >${ s.PR_NOTICE } </textarea></td>
                                            </tr> 
                                            <tr>
                                                <th>제품고객센터</th>
                                                <td><input type="text" name="SERVICE_CENTER" required
                                                    class="form-control" value="${s.SERVICE_CENTER }">   </td>
                                            </tr> 
                                        </table>
                                          
                                            <br>
                                            <br>
                                            <br>
                                            <tr>
                                                <td colspan="2">
                                                    <button id="btnArea1">수정</button>
                                                    <button type="button" id="btnArea2"
                                                        onclick="javascript:history.back();">취소</button> 
                                                </td>
                                            </tr>
        
        
                                    </form>
                             </div>
        
                            </div>
                           <!--  <script>
                        
                                $(document).ready(function() {
                                 
                                    $('#btnArea1').click(function() {
        
                                        if( $('select[name=terms]').val() == 'N'){
                                            if(confirm("동의가 필요합니다 동의하시겠습니까? ")){ 
                                            }else{
                                                return false;
                                                
                                            }
                                        }
                                    });
        
                                });
                            </script> -->
         
                        </div> 
        
                    </form>
                </div>
        </div>

        
        
    </div>
    </div>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer2.jsp"/>
</body>
</html>