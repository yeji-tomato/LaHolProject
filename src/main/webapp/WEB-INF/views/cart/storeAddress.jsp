<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 주소 form</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="${ contextPath }/resources/css/basket/storeAddress.css" type="text/css">
</head>
  <style>
 
  #first:checked + div button{

 display:none;

}
  #first:checked + div input{

 display:none;

}
 </style>
<body>
	<div class="contact-form" style="padding-top : 20%;">
            <div class="contact-image">
                <!-- <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/> -->
            	<i class="fa fa-rocket" aria-hidden="true" style=" margin-top: 5px;"></i>
            </div>
            <form method="post">
                <h3>배송지 정보</h3>
                <p style="text-align: center"> 스토어제품이 없을 경우 작성하지 않으셔도 됩니다 </p>
                <input type="checkbox" onClick="checkDisable(this.form)"  id="first">
			                	주문자 회원정보와 동일한 주소로 주문합니다.
			               <div class="row" id="radioDiv" >
			                    <div class="col-md-6">
			                        <div class="form-group">
			                            <input type="text" name="txtName" class="form-control" placeholder="* 이름" value="" />
			                        </div>
			                        <div class="form-group">
			                            <input type="text" name="txtEmail" class="form-control" placeholder="* 연락처" value="" />
			                        </div>
			                        
			        				<div class="form-group address" id="addText">
			        					<input type="text" name="txtPhone" class="form-control" placeholder="* 도로명주소" value="" />
			        				</div>
									<div class="form-group address" id="searchBtn">
										<button>
			                    			<i class="fa fa-search" aria-hidden="true"></i>
			                    		</button>
									</div>
			                        
			               			<div class="form-group">
			                            <input type="text" name="txtPhone" class="form-control" placeholder="* 상세주소" value="" />
			                        </div>
			                    </div>
			                    <div class="col-md-6">
			                        <div class="form-group">
			                            <textarea name="txtMsg" class="form-control" placeholder="* 주문 메시지 " style="width: 100%; height: 20vh;"></textarea>
			                        </div>
			                    </div>
			                    
			                </div>
            </form>
		</div>
		
		              
	                     <script >
				
				 function checkDisable(frm)  {
				     if( frm.chkbox.checked == true ){
				    	 if( document.all["radioDiv"].style.display == "" ){
				         }else{
				                document.all["radioDiv"].style.display = ""; 
				                document.all["radioDiv2"].style.display = "none";  
				                
				         }
				      	  }else if ( frm.chkbox.checked == false){
				      		   if( document.all["radioDiv2"].style.display == "" ){ 
				             
				      	     }else{
				      	       document.all["radioDiv"].style.display = "none"; 
				               document.all["radioDiv2"].style.display = "";  
				      	     }
				      	  }
				 }
				</script>
</body>
</html>