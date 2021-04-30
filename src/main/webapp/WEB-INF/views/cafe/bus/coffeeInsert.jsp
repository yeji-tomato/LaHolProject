<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피 음료 작성 폼</title>
</head>
<body>
	<!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
        <form action="${ contextPath }/cafe/biz/coffee/insert" id="uploadForm" method="post" enctype="multipart/form-data">
        <div class="modal-content">
            <div class="modal-header">
                <i class="fa fa-coffee" id="coffee-icon" aria-hidden="true"></i>
                <button type="button" id="close-icon" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa fa-times" aria-hidden="true"></i>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="caNo" value="${ param.caCode }"/>
                <div class="modalForm category">
                    <h5 class="coffee-title">카테고리</h5> 
                    <input type="radio" name="cfCategory" value="COFFEE" class="radioModal">COFFEE
                    <input type="radio" name="cfCategory" value="BEVERAGE" class="radioModal">BEVERAGE
                    <input type="radio" name="cfCategory" value="DESSERT" class="radioModal">DESSERT
                    <input type="radio" name="cfCategory" value="SET MENU" class="radioModal">SET MENU
                </div>
                <div class="modalForm img">
                    <h5 class="coffee-title">음료 대표 사진</h5> 
                    <div id="beverageImg" class="beverageImg"></div>
                    <div id="files">
                        <input type="file" id="imgBev" name="imgBev" onchange="preview(this)">
                    </div>
                    <script>
                        // 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
                        $(function () {
                            $("#files").hide();

                            $("#beverageImg").click(function () {
                                $("#imgBev").click();
                            });
                        });

                        function preview(value) {
                            // value => input type="file"
                            // num => 조건문으로 각 번호에 맞춰서 위의 미리보기 img에 적용시킬것

                            // file이 존재하는지 조건문
                            if (value.files && value.files[0]) {
                                // 파일을 읽어들일 FileReader 객체 생성
                                var reader = new FileReader(); 

                                // 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
                                reader.readAsDataURL(value.files[0]); 

                                // 파일 읽기가 다 완료되었을 때 실행되는 메소드
                                reader.onload = function (e) {
                                    $("#beverageImg").html("<img src='" + reader.result + "' width='260px' height='230px'>");
                                }
                            }
                        }
                    </script>
                </div>
                <div class="modalForm BeverageName">
                    <h5 class="coffee-title">음료명</h5>
                    <input type="text" id="text"  name="cfName" placeholder="음료명으로 노출될 문구를 작성해주세요.(ex. 아메리카노)"/>
                </div>
                <div class="modalForm price">
                    <h5 class="coffee-title">판매가</h5>
                    
                    <input type="number"  min='1000' max='10000' step='100' id="number" name="cfPrice">
                </div>
                <div class="modalForm BeverageCount">
                    <h5 class="coffee-title">재고수량</h5>
                    <button class="minus" type="button">
                        <i class="fa fa-minus" aria-hidden="true"></i>
                    </button>
                    <input type="number" class="numBox" min="1" max="100" readonly name="cfCount">
                    <button class="plus" type="button">
                        <i class="fa fa-plus" aria-hidden="true"></i>
                    </button>
                    <script>
                        $(".plus").click(function(){
                            var num = $(".numBox").val();
                            var plusNum = Number(num)+1;

                            if(plusNum >= 100){
                                $(".numBox").val(num);
                            }else{
                                $(".numBox").val(plusNum);
                            }
                        });

                        $(".minus").click(function(){
                            var num = $(".numBox").val();
                            var minusNum = Number(num)-1;

                            if(minusNum <= 0){
                                $(".numBox").val(num);
                            }else{
                                $(".numBox").val(minusNum);
                            }
                        })
                    </script>
                </div>
            </div>
            <div class="modal-footer">
                <input type="submit" value="추가" class="btn" id="confirmBtn"/>
                <button type="button" class="btn" id="cancelBtn" data-bs-dismiss="modal">취소</button>
            </div>
            </div>
        </form>
        
        </div>
    </div>
</body>
</html>