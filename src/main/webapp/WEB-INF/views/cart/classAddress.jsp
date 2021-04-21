<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 주소</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="${ contextPath }/resources/css/basket/classAddress.css" type="text/css">
</head>
<body>
	<div class="class-form">
            <div class="class-image">
                <!-- <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/> -->
            	<i class="fa fa-user" aria-hidden="true"></i>
            </div>
            <form method="post">
                <h3>클래스 주소</h3>
       
               <div class="row">
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
                            <textarea name="txtMsg" class="form-control" placeholder="* 주문 메시지 " style="width: 100%; height: 150px;"></textarea>
                        </div>
                    </div>
                    
                </div>
            </form>
		</div>
</body>
</html>