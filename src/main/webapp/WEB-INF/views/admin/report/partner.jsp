<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="${ contextPath }/resources/css/admin/report/partner.css" />
		<link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" />
		<script src="https://cdn.zinggrid.com/zinggrid.min.js" defer></script>
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	</head>
	<body data-theme="light">
		<!--!! 최상단 컨테이너-->
		<div id="whole-container">
			<!--𖤐 왼쪽 영역-->
			<section id="left-area">
				<!--왼쪽 컨테이너-->
				<div id="left-container">
					<!--로고 컨테이너-->
					<div id="logo-container">
						<img
							id="logo"
							src="${ contextPath }/resources/img/admin/common/logo_lightyellow.png"
							alt=""
							width="62%"
							height="auto"
						/>
					</div>
					<!--카테고리 컨테이너-->
					<div id="category-container">
						<!-- 카테고리 리스트-->
						<ul id="category-list">
							<!--유저 카테고리-->
							<li>
								<div class="big-category" id="user-category">
									<svg
										class="category-icon"
										width="30"
										height="30"
										viewBox="0 0 30 30"
										fill="none"
										xmlns="http://www.w3.org/2000/svg"
									>
										<path
											fill-rule="evenodd"
											clip-rule="evenodd"
											d="M16.3125 12.6562C16.3125 11.8278 16.9841 11.1562 17.8125 11.1562H21.5625C22.3909 11.1562 23.0625 11.8278 23.0625 12.6562C23.0625 13.4847 22.3909 14.1562 21.5625 14.1562H17.8125C16.9841 14.1562 16.3125 13.4847 16.3125 12.6562Z"
											fill="#C7C7C7"
										/>
										<path
											fill-rule="evenodd"
											clip-rule="evenodd"
											d="M16.3125 17.3437C16.3125 16.5153 16.9841 15.8437 17.8125 15.8437H21.5625C22.3909 15.8437 23.0625 16.5153 23.0625 17.3437C23.0625 18.1722 22.3909 18.8437 21.5625 18.8437H17.8125C16.9841 18.8437 16.3125 18.1722 16.3125 17.3437Z"
											fill="#C7C7C7"
										/>
										<path
											fill-rule="evenodd"
											clip-rule="evenodd"
											d="M11.0274 12.5156C10.4319 12.5156 9.94926 12.9983 9.94926 13.5938C9.94926 14.1892 10.4319 14.6719 11.0274 14.6719C11.6228 14.6719 12.1055 14.1892 12.1055 13.5938C12.1055 12.9983 11.6228 12.5156 11.0274 12.5156ZM6.94926 13.5938C6.94926 11.3415 8.7751 9.51563 11.0274 9.51563C13.2797 9.51563 15.1055 11.3415 15.1055 13.5938C15.1055 15.846 13.2797 17.6719 11.0274 17.6719C8.7751 17.6719 6.94926 15.846 6.94926 13.5938Z"
											fill="#C7C7C7"
										/>
										<path
											fill-rule="evenodd"
											clip-rule="evenodd"
											d="M11.0274 18.1406C10.7414 18.1406 10.4672 18.2542 10.265 18.4564C10.0628 18.6586 9.94926 18.9328 9.94926 19.2187C9.94926 20.0472 9.27768 20.7187 8.44926 20.7187C7.62083 20.7187 6.94926 20.0472 6.94926 19.2187C6.94926 18.1372 7.37892 17.0999 8.14371 16.3351C8.90851 15.5703 9.9458 15.1406 11.0274 15.1406C12.109 15.1406 13.1463 15.5703 13.9111 16.3351C14.6758 17.0999 15.1055 18.1372 15.1055 19.2187C15.1055 20.0472 14.4339 20.7187 13.6055 20.7187C12.7771 20.7187 12.1055 20.0472 12.1055 19.2187C12.1055 18.9328 11.9919 18.6586 11.7897 18.4564C11.5875 18.2542 11.3133 18.1406 11.0274 18.1406Z"
											fill="#C7C7C7"
										/>
										<path
											fill-rule="evenodd"
											clip-rule="evenodd"
											d="M5.25 7.125V22.875H24.75V7.125H5.25ZM2.25 6.5625C2.25 5.21631 3.34131 4.125 4.6875 4.125H25.3125C26.6587 4.125 27.75 5.21631 27.75 6.5625V23.4375C27.75 24.7837 26.6587 25.875 25.3125 25.875H4.6875C3.34131 25.875 2.25 24.7837 2.25 23.4375V6.5625Z"
											fill="#C7C7C7"
										/>
									</svg>

									<a class="category-text" id="user-text" href="#">회원</a>
								</div>
								<ul>
									<li class="sub-category" onclick="location.href='${ contextPath }/admin/user/normalList'">
										<a href="#" id="a-text">일반 회원</a>
									</li>
									<li class="sub-category" onclick="location.href='${ contextPath }/admin/user/partnerList'">
										<a href="#" id="a-text">사업자 회원</a>
									</li>
								</ul>
							</li>
							<!--카페 카테고리-->
							<li>
								<div class="big-category" id="cafe-category">
									<svg
										class="category-icon"
										width="30"
										height="30"
										viewBox="0 0 30 30"
										fill="none"
										xmlns="http://www.w3.org/2000/svg"
									>
										<path
											d="M6.41205 3.75965C6.85716 2.98071 7.68551 2.5 8.58266 2.5H21.4176C22.3147 2.5 23.1431 2.98071 23.5882 3.75965L25.0167 6.25965C25.8267 7.67704 25.0774 9.38883 23.6545 9.86915C23.6597 9.97077 23.6587 10.0739 23.6513 10.1781L22.5798 25.1781C22.4864 26.4864 21.3978 27.5 20.0862 27.5H9.914C8.6024 27.5 7.5138 26.4864 7.42035 25.1781L6.34892 10.1781C6.34147 10.0739 6.34051 9.97076 6.34568 9.86914C4.92278 9.38881 4.17355 7.67703 4.98348 6.25965L6.41205 3.75965ZM8.84257 10L9.11042 13.75H20.8898L21.1576 10H8.84257ZM9.64614 21.25L9.914 25H20.0862L20.3541 21.25H9.64614ZM22.8461 7.5L21.4176 5L8.58266 5L7.15408 7.5H22.8461Z"
											fill="#C7C7C7"
										/>
									</svg>
									<a class="category-text" id="cafe-text" href="#">카페</a>
								</div>
								<ul>
									<li class="sub-category" onclick="location.href='${ contextPath }/admin/cafe/cafeList'">
										<a href="#" id="a-text">입점 현황</a>
									</li>
									<li class="sub-category" onclick="location.href='${ contextPath }/admin/cafe/promotion'">
										<a href="#" id="a-text">프로모션</a>
									</li>
								</ul>
							</li>
							<!--수익 카테고리-->
							<li>
								<div class="big-category" id="stats-category" onclick="location.href='${ contextPath }/admin/profit'">
									<svg
										class="category-icon"
										width="30"
										height="30"
										viewBox="0 0 30 30"
										fill="none"
										xmlns="http://www.w3.org/2000/svg"
									>
										<path
											fill-rule="evenodd"
											clip-rule="evenodd"
											d="M3.75 4.125C4.57843 4.125 5.25 4.79657 5.25 5.625V22.875H26.25C27.0784 22.875 27.75 23.5466 27.75 24.375C27.75 25.2034 27.0784 25.875 26.25 25.875H3.75C2.92157 25.875 2.25 25.2034 2.25 24.375V5.625C2.25 4.79657 2.92157 4.125 3.75 4.125"
											fill="#C7C7C7"
										/>
										<path
											fill-rule="evenodd"
											clip-rule="evenodd"
											d="M25.4359 6.43934C26.0217 7.02513 26.0217 7.97487 25.4359 8.56066L16.0609 17.9357C15.4751 18.5214 14.5253 18.5214 13.9396 17.9357L11.2502 15.2463L4.81088 21.6857C4.22509 22.2714 3.27535 22.2714 2.68956 21.6857C2.10377 21.0999 2.10377 20.1501 2.68956 19.5643L10.1896 12.0643C10.7753 11.4786 11.7251 11.4786 12.3109 12.0643L15.0002 14.7537L23.3146 6.43934C23.9003 5.85355 24.8501 5.85355 25.4359 6.43934"
											fill="#C7C7C7"
										/>
										<path
											fill-rule="evenodd"
											clip-rule="evenodd"
											d="M18.1877 7.5C18.1877 6.67157 18.8593 6 19.6877 6H24.3752C25.2036 6 25.8752 6.67157 25.8752 7.5V12.1875C25.8752 13.0159 25.2036 13.6875 24.3752 13.6875C23.5468 13.6875 22.8752 13.0159 22.8752 12.1875V9H19.6877C18.8593 9 18.1877 8.32843 18.1877 7.5"
											fill="#C7C7C7"
										/>
									</svg>

									<a class="category-text" id="stats-text" href="#">수익</a>
								</div>
							</li>
							<!--쿠폰 카테고리-->
							<li>
								<div class="big-category" id="coupon-category" onclick="location.href='${ contextPath }/admin/coupon'">
									<svg
										class="category-icon"
										width="30"
										height="30"
										viewBox="0 0 30 30"
										fill="none"
										xmlns="http://www.w3.org/2000/svg"
									>
										<path
											fill-rule="evenodd"
											clip-rule="evenodd"
											d="M30 15C29.8385 16.4161 29.1429 17.7172 28.055 18.6381C27.6341 19.0466 27.2799 19.5188 27.0056 20.0373C26.8316 20.6177 26.7559 21.223 26.7817 21.8284C26.8987 23.2144 26.4778 24.5922 25.6063 25.6763C24.5222 26.5478 23.1444 26.9686 21.7584 26.8517C21.1531 26.8258 20.5477 26.9015 19.9674 27.0756C19.4512 27.3536 18.9796 27.7073 18.5681 28.125C17.6589 29.1791 16.3838 29.8491 15 30C13.5809 29.8484 12.2763 29.1509 11.3619 28.055C10.9505 27.6374 10.4788 27.2837 9.96269 27.0056C9.38235 26.8316 8.77697 26.7559 8.17164 26.7817C6.78564 26.8987 5.40779 26.4778 4.32369 25.6063C3.45225 24.5222 3.03138 23.1444 3.14832 21.7584C3.17416 21.1531 3.09848 20.5477 2.92444 19.9674C2.65012 19.4488 2.29598 18.9766 1.875 18.5681C0.82856 17.6529 0.160181 16.381 0 15C0.161461 13.5839 0.857077 12.2828 1.94496 11.3619C2.36594 10.9534 2.72008 10.4812 2.9944 9.96269C3.16845 9.38235 3.24412 8.77697 3.21828 8.17164C3.10134 6.78564 3.52221 5.40779 4.39366 4.32369C5.47775 3.45225 6.8556 3.03138 8.2416 3.14832C8.84693 3.17416 9.45231 3.09848 10.0327 2.92444C10.5488 2.64638 11.0204 2.29265 11.4319 1.875C12.3411 0.820921 13.6162 0.150866 15 0C16.4191 0.15165 17.7237 0.8491 18.6381 1.94496C19.0495 2.36261 19.5212 2.71634 20.0373 2.9944C20.6177 3.16845 21.223 3.24412 21.8284 3.21828C23.2144 3.10134 24.5922 3.52221 25.6763 4.39366C26.5478 5.47775 26.9686 6.8556 26.8517 8.2416C26.8258 8.84693 26.9015 9.45231 27.0756 10.0327C27.3499 10.5512 27.704 11.0234 28.125 11.4319C29.1714 12.3471 29.8398 13.619 30 15ZM10.8021 14.1185C9.06329 14.1185 7.65374 12.7089 7.65374 10.9702C7.65374 9.2314 9.06329 7.82185 10.8021 7.82185C12.5408 7.82185 13.9504 9.2314 13.9504 10.9702C13.9217 12.6444 12.5874 14.0032 10.914 14.0625L10.8021 14.1185ZM20.597 11.32L11.32 20.597C11.0593 20.8555 10.7076 21.0012 10.3405 21.0028C9.98801 20.9905 9.65317 20.8456 9.40298 20.597C8.86046 20.0513 8.86046 19.1698 9.40298 18.6241L18.68 9.40298C18.9779 8.9001 19.5569 8.6353 20.1321 8.73892C20.7073 8.84253 21.1575 9.29274 21.2611 9.86794C21.3647 10.4431 21.0999 11.0221 20.597 11.32ZM10.8021 10.6203C10.9953 10.6203 11.1519 10.7769 11.1519 10.9701L11.2638 10.9142C11.2638 11.3059 10.5642 11.3059 10.4523 10.9701C10.4595 10.78 10.6119 10.6275 10.8021 10.6203ZM26.0121 13.2789C26.5718 13.8666 27.2015 14.5522 27.2015 15C27.2015 15.3699 26.7716 15.9023 26.3381 16.4391C26.247 16.552 26.1556 16.6652 26.0681 16.777C25.4076 17.4012 24.8669 18.141 24.4729 18.9599C24.1546 19.8574 24.0074 20.8066 24.0392 21.7584C24.0899 22.4395 23.9696 23.1225 23.6893 23.7453C23.0665 24.0256 22.3835 24.1458 21.7024 24.0951C20.7506 24.0634 19.8014 24.2105 18.9039 24.5289C18.085 24.9229 17.3452 25.4635 16.7211 26.124C16.1334 26.6837 15.4477 27.3134 15 27.3134C14.5522 27.3134 13.8666 26.6837 13.2789 26.124C12.6547 25.4635 11.9149 24.9229 11.0961 24.5289C10.1986 24.2105 9.24931 24.0634 8.29755 24.0951C7.61644 24.1458 6.93344 24.0256 6.31061 23.7453C6.03032 23.1225 5.91007 22.4395 5.9608 21.7584C5.99253 20.8066 5.8454 19.8574 5.52703 18.9599C5.133 18.141 4.59237 17.4012 3.93188 16.777C3.37218 16.1893 2.74251 15.5037 2.74251 15.0559C2.74251 14.6082 3.37218 13.9225 3.93188 13.3349C4.59237 12.7107 5.133 11.9709 5.52703 11.152C5.8454 10.2545 5.99253 9.30528 5.9608 8.35352C5.91007 7.67241 6.03032 6.98942 6.31061 6.36658C6.93344 6.08629 7.61644 5.96605 8.29755 6.01677C9.24931 6.0485 10.1986 5.90137 11.0961 5.583C11.8995 5.16648 12.6202 4.60696 13.2229 3.93188C13.8106 3.37218 14.4962 2.74251 14.944 2.74251C15.3918 2.74251 16.0774 3.37218 16.6651 3.93188C17.2892 4.59237 18.029 5.13301 18.8479 5.52703C19.7454 5.8454 20.6947 5.99253 21.6464 5.9608C22.3275 5.91008 23.0105 6.03032 23.6334 6.31061C23.9137 6.93345 24.0339 7.61644 23.9832 8.29755C23.9514 9.24931 24.0986 10.1986 24.417 11.0961C24.811 11.9149 25.3516 12.6547 26.0121 13.2789ZM22.2341 19.0858C22.2341 20.8246 20.8245 22.2341 19.0858 22.2341C17.347 22.2341 15.9374 20.8246 15.9374 19.0858C15.9374 17.347 17.347 15.9375 19.0858 15.9375C20.8245 15.9375 22.2341 17.347 22.2341 19.0858ZM19.0856 18.736C19.2788 18.736 19.4354 18.8926 19.4354 19.0858C19.4354 19.4636 18.7358 19.4636 18.7358 19.0858C18.7358 18.8926 18.8924 18.736 19.0856 18.736Z"
											fill="#C7C7C7"
										/>
									</svg>

									<a class="category-text" id="coupon-text" href="#">쿠폰</a>
								</div>
							</li>
							<!--신고 카테고리-->
							<li>
								<div class="big-category" id="report-category">
									<svg
										class="category-icon"
										width="30"
										height="30"
										viewBox="0 0 30 30"
										fill="none"
										xmlns="http://www.w3.org/2000/svg"
									>
										<path
											d="M15 30C6.7155 30 0 23.2845 0 15C0 6.7155 6.7155 0 15 0C23.2845 0 30 6.7155 30 15C30 23.2845 23.2845 30 15 30ZM15 27C18.1826 27 21.2348 25.7357 23.4853 23.4853C25.7357 21.2348 27 18.1826 27 15C27 11.8174 25.7357 8.76516 23.4853 6.51472C21.2348 4.26428 18.1826 3 15 3C11.8174 3 8.76516 4.26428 6.51472 6.51472C4.26428 8.76516 3 11.8174 3 15C3 18.1826 4.26428 21.2348 6.51472 23.4853C8.76516 25.7357 11.8174 27 15 27ZM13.5 19.5H16.5V22.5H13.5V19.5ZM13.5 7.5H16.5V16.5H13.5V7.5Z"
											fill="#C7C7C7"
										/>
									</svg>

									<a class="category-text" id="report-text" href="#">신고</a>
								</div>
								<ul>
									<li class="sub-category" onclick="location.href='${ contextPath }/admin/report/normal'">
										<a href="#" id="a-text">일반 회원</a>
									</li>
									<li class="sub-category" onclick="location.href='${ contextPath }/admin/report/partner'">
										<a href="#" id="a-text">사업자 회원</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</section>

			<!--𖤐 오른쪽 영역-->
			<section id="right-area">
				<div id="toggle-container">
					<div id="toggle-switch">
						<div class="toggle" id="switch" onclick="toggleDarkMode()">
							<div class="toggle-text-off">OFF</div>
							<div class="glow-comp"></div>
							<div class="toggle-button"></div>
							<div class="toggle-text-on">ON</div>
						</div>
					</div>
				</div>
				<div id="contents-container">
					<div class="table-container">
						<div class="table-title" id="waiting-text">처리 대기</div>
						<zing-grid id="waiting-list"
							sort
							pager
							page-size="3"
							page-size-options="3"
							viewport-stop
							data=''
						>

							<zg-colgroup>
								<zg-column index="prCode" header="상품코드"></zg-column>
								<zg-column index="reportee" header="피신고자ID"></zg-column>
								<zg-column index="ceo" header="대표자"></zg-column>
								<zg-column index="phone" header="연락처"></zg-column>
								<zg-column index="service" header="서비스"></zg-column>
								<zg-column index="accu" header="누적신고"></zg-column>
								<zg-column index="reporter" header="신고자ID"></zg-column>
							</zg-colgroup>
						</zing-grid>
					</div>
					<div class="table-container">
						<div class="table-title" id="complete-text">처리 완료</div>
						<zing-grid id="completed-list"
							sort
							pager
							page-size="3"
							page-size-options="3"
							viewport-stop
							data=''
						>
							<zg-colgroup>
								<zg-column index="prCode" header="상품코드"></zg-column>
								<zg-column index="reportee" header="피신고자ID"></zg-column>
								<zg-column index="ceo" header="대표자"></zg-column>
								<zg-column index="phone" header="연락처"></zg-column>
								<zg-column index="service" header="서비스"></zg-column>
								<zg-column index="accu" header="누적신고"></zg-column>
								<zg-column index="reporter" header="신고자ID"></zg-column>
								<zg-column
									index="status"
									header="상태"
									type="image"
									type-image-alt="불러오기 실패"
									search="disabled"
								></zg-column>
							</zg-colgroup>
						</zing-grid>
					</div>
				</div>
			</section>
		</div>
		<script>
		$(function() {
		    // 서브카테고리 기본 숨김처리
		    $('.sub-category').hide();
		    $('#report-category').addClass('active');
		    $('#report-category').siblings().find('li').show();
		    $('.sub-category:eq(5)').addClass('active');

		    $('.big-category').click(function(){
		        var currentContent = $(this).siblings().find('li');
		        $('.sub-category').not(currentContent).slideUp();
		        currentContent.slideToggle();
		    });

		    $(".big-category").click(function(e) {
		        e.preventDefault();
		        $(".big-category").removeClass("active");
		        $(this).addClass("active");
		    });

		    $(".sub-category").click(function(e) {
		        e.preventDefault();
		        $(".sub-category").removeClass("active");
		        $(this).addClass("active");
		    });
		});
		
		/* 신고처리 대기리스트 조회 */
		$(function(){
			const waitingList = $('#waiting-list');
			$.ajax({
				url: "${ pageContext.request.contextPath }/admin/report/partnerList/waiting",
				dataType: "json",
				type: "get",
				success: function(data){
					waitingList.attr('data', JSON.stringify(data)).trigger("create");
					console.log(data);
					console.log("대기리스트 조회 성공이당");
				},
				error: function(e){
					console.log(e);
				}
			});		
		});
		
		/* 신고처리 완료리스트 조회 */
		$(function(){
			const completedList = $('#completed-list');
			$.ajax({
				url: "${ pageContext.request.contextPath }/admin/report/partnerList/completed",
				dataType: "json",
				type: "get",
				success: function(data){
					completedList.attr('data', JSON.stringify(data)).trigger("create");
					console.log(data);
					console.log("완료리스트 조회 성공이당");
				},
				error: function(e){
					console.log(e);
				}
			});		
		});
				
		// 대기리스트 Row 클릭
		var waitingList = document.querySelector("#waiting-list");
		
		waitingList.addEventListener('row:click', function(e) { // !! THE VERY START
			console.log(e.detail.ZGData.data);
		
			// 업데이트에 필요한 변수
			var reportee = e.detail.ZGData.data.reportee;
			var reportNo = e.detail.ZGData.data.reportNo;
			// 모달에 띄울 변수
			var reportType = e.detail.ZGData.data.reportType;
			var reportReason = e.detail.ZGData.data.reportReason;
			
			Swal.fire({
				  icon: 'question',
				  title: reportType,
				  text: reportReason,
				  showCancelButton: true,
				  confirmButtonText: '경고',
				  confirmButtonColor: '#DC143C',
				  showDenyButton: true,
				  denyButtonText: '해제',
				  denyButtonColor: '#34bdeb',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.isConfirmed) {	// 경고 버튼 선택 시 
					 Swal.fire('경고처리 되었습니다', '', 'success')
					 location.href='${ pageContext.request.contextPath }/admin/updatePartnerWarned?reportNo='+reportNo+'&reportee='+reportee;
				  } else if (result.isDenied) { // 해제 버튼 선택 시
					 Swal.fire('경고가 해제되었습니다', '', 'info')
					 location.href='${ pageContext.request.contextPath }/admin/updatePartnerReportInvalid?reportNo='+reportNo;
				  }
				}); // -- SWAL END
		
		}); // !! THE VERY END 

		
		// 완료리스트 row 클릭 시 
		var completedList = document.querySelector("#completed-list");
		
		completedList.addEventListener('row:click', function(e) { // !! THE VERY START		
			console.log(e.detail.ZGData.data);
			
			// 모달에 띄울 변수
			var reportType = e.detail.ZGData.data.reportType;
			var reportReason = e.detail.ZGData.data.reportReason;
			
			Swal.fire(
					  reportType,
					  reportReason,
					  'info'
					)
		}); // !! THE VERY END 
		
		

		</script>
		<script src="${ contextPath }/resources/js/admin/darkMode.js"></script>
	</body>
</html>
    