<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>맛조::맛집 상세보기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/font-kor.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!-- <script src="../assets/js/jquery.min.js"></script> -->
<link rel="stylesheet" href="/resources/assets/css/selectRestaDetailSub.css"
	type="text/css" />


<script type="text/javascript" src="/js/common/angular/angular.js"></script>
<script type="text/javascript" src="/js/resta/restaApp.js"></script>
<script type="text/javascript" src="/js/resta/restaController.js"></script>
<script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>

<!-- jQuery 별점 모듈(Rate Yo!) -->
<link rel="stylesheet" href="/resources/assets/css/jquery.rateyo.min.css">
<script src="/js/common/jquery.rateyo.min.js"></script>

<!-- Floting side bar -->
<script>
        $(function(){
            var width_size = window.outerWidth;
            if (width_size <= 800) {
                return;
            }
            var $win = $(window);
            var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.

            /*사용자 설정 값 시작*/
            var speed          = 500;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
            var easing         = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
            var $layer         = $('#sidebar'); // 레이어 셀렉팅
            var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
            $layer.css('position', 'relative').css('z-index', '1');
            /*사용자 설정 값 끝*/

            // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
            if (top > 0 )
                $win.scrollTop(layerTopOffset+top);
            else
                $win.scrollTop(0);

            //스크롤이벤트가 발생하면
            $(window).scroll(function(){
                yPosition = $win.scrollTop() - 400; //이부분을 조정해서 화면에 보이도록 맞추세요
                if (yPosition < 0)
                {
                    yPosition = 0;
                }
                $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
            });
            
		
			$("#rateYo").rateYo({
				rating : 4.5,
				halfStar: true,
				readOnly: true
			});
		});
</script>

<!-- side bar 제거 옵션-->
<script>
	$(document).ready(function() {
	    $(window).scroll(function() {
	        $(this).scrollTop() < 1500 ? $("#sidebar").fadeIn() : $("#sidebar").fadeOut()
	    });
	    $(".login").click(function() {
	        $('div.modal').modal();
	    });
	    
	});
</script>

<style type="text/css">
	#main .review_detail {
		display: none;
	}
</style>

<!-- 리뷰 상세보기 버튼-->
<!-- <script type="text/javascript">
	function showhide(num) { // 플래시 또는 html에서 오브젝트id값에 의한 호출
		var review_datail = null;
		if (num == 1) {
			review_detail = document.getElementById("review_detail1"); // 호출된 id값을 review_detail 변수로 치환
		} else if (num == 2) {
			review_detail = document.getElementById("review_detail2"); // 호출된 id값을 review_detail 변수로 치환
		} else if (num == 3) {
			review_detail = document.getElementById("review_detail3"); // 호출된 id값을 review_detail 변수로 치환
		}

		if (review_detail.style.display != 'none') { // 만약 review_detail가 none이 아니면 즉, 보여지는 상태이면
			review_detail.style.display = 'none'; // review_detail를 숨기고
		} else {
			review_detail.style.display = 'block'; // 숨김 상태이면 나타내라
		}
	}
</script> -->
</head>
<body class="left-sidebar" onload="init()">
	<div id="page-wrapper" ng-app="restaApp" ng-controller="RestaController" ng-init="selectRestaProc('${dlBean.restaId}')">

		<!-- Modal -->
		<div class="modal fade" id="write_layerpop">
			<div class="modal-dialog">
				<div class="modal-content modal-content_write">
					<div class="modal-header">
						<h3 class="modal-title">로그인</h3>
					</div>
					<div class="modal-body">
						<div class="input_row" id="id_area">
							<span class="input_box"> <input type="text" id="id"
								name="id" tabindex="7" accesskey="L" placeholder="이메일"
								class="int" maxlength="41" value="">@ <input type="text"
								id="email" name="id" tabindex="7" accesskey="L" placeholder=""
								class="int" maxlength="41" value=""> <select
								id="emailselect" value="직접입력">
									<option selected="selected">gmail.com</option>
									<option>naver.com</option>
									<option>daum.net</option>
									<option>lycos.co.kr</option>
							</select>
							</span>

						</div>
						<div class="input_row" id="pw_area">
							<span class="input_box"> <input type="password" id="pw"
								name="pw" tabindex="8" placeholder="비밀번호" class="int"
								maxlength="16" onkeypress="capslockevt(event);getKeysv2();"
								onkeyup="checkShiftUp(event);"
								onkeydown="checkShiftDown(event);">
							</span>
						</div>
						<div class="check_info">
							<div class="login_check">
								<span class="login_check_box"> <input type="checkbox"
									name="nvlong" class="login_chk" tabindex="9" value="off"
									onchange="savedLong(this);nclks_chk('login_chk', 'log.keepon', 'log.keepoff',this,event)"
									onclick="msieblur(this);" /> <label for="login_chk"
									id="label_login_chk" class="sp">자동 로그인</label>
								</span>
							</div>
						</div>
						<div class="modal-footer">
							<span id="loginbutton"> <input type="submit" title="로그인"
								alt="로그인" tabindex="12" value="로그인" class="btn_global" lang="ko"
								onclick="nclks('log.login',this,event)">
							</span> <span id="cacaologinbutton"> <input type="submit"
								title="카카오톡 로그인" alt="로그인" tabindex="12" value="카카오톡 로그인"
								class="btn_sns" lang="ko"
								onclick="nclks('log.login',this,event)">
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Header -->
		<div id="header">

			<!-- Inner -->
			<div class="inner"></div>

			<!-- Nav -->
			<nav id="nav">
				<a href="index.html"><img src="/resources/images/logo_white.png" /></a>
				<ul>
					<li><a href="index.html">맛조?</a>
						<ul>
							<li><a href="showService.html">서비스 소개</a></li>
							<li><a href="showHistory.html">히스토리</a></li>
							<li><a href="showMembers.html">멤버</a></li>
						</ul></li>
					<li><a href="selectRank.html">랭크</a></li>
					<li><a href="selectPromo.html">프로모션</a></li>
					<li><a href="selectNoticeList.html">맛조센터</a>
						<ul>
							<li><a href="selectNoticeList.html">공지사항</a></li>
							<li><a href="selectInquiryList.html">문의사항</a></li>
						</ul></li>
				</ul>
				<div class="member_menu">
					<a class="login">로그인</a> <a class="register"
						href="insertMemberForm.html">회원가입</a>
				</div>
			</nav>

		</div>

		<!-- Main -->
		<div class="wrapper style1" lang="ko">
			<div class="container">
				<div class="row 200%">
					<div class="4u 12u(mobile)" id="sidebar" lang="ko">
						<hr class="first" />
						
						<!-- 좌측 업소정보 -->
						<section>
							<!-- 업소 명 -->
							<span id="sidebar_resta_title" >${dlBean.restaTitle }</span> <br />
							<!-- 업소 한줄 설명 -->
							<span id="sidebar_resta_info">까르보나라 치킨과 시원한 맥주</span> <br /><!-- 업소설명 제공안됨. 사용불가 예상 -->
							
							
							<!-- 업소 평점-->
							<span id="sidebar_resta_score">
							<div>
								<div id="rateYo"></div>
								&nbsp;4.5
							</div>
							</span> 
							<br/>
							
							
							<!-- 업소 대표 이미지 -->
							<!-- TODO 지우자 -->
							<img width="200px" height="200px" src="${dlBean.restaImgUrl}" class="resta_detail_img" /><br/>
							<!-- 업소 연락처 -->
							<span>${dlBean.restaPhone }</span> <br/>
							<!-- 업소 홈페이지 -->
							<span><a href="${dlBean.restaUrl}">${dlBean.restaUrl}</a></span>
							<br />
							<!-- 업소 주소 -->
							<span id="sidebar_resta_address">${dlBean.restaAddr}</span> <br/>
							<!-- 업소 지도 -->
							<div id="map_div"></div>
						</section>
						<hr />
					</div>
					<div class="8u 12u(mobile) important(mobile)" id="content">
						<article id="main">
							<!-- 리뷰 내용-->
							<section id="review" ng-repeat="review in reviewList">
								<table>
									<!-- 1행 -->
									<tr>
										<td id="review_group_img"><img src="/resources/images/group.PNG" /></td>
										<td colspan="2">
											<span id="review_group_name">
												{{review.reviewGroupName}}<br/>
											</span>
											<br /> 
											<span id="review_group_write">04명의 인원이 함께 작성하였습니다.</span>
										</td>
										<td id="review_td_like"><img id="review_like_img"
											src="images/heart_1.png"> <span id="review_like">37</span><br />
											<span>등록일시:2017년 5월 22일</span></td>
									</tr>

									<!-- 2행 -->
									<tr>
										<td rowspan="4" id="review_avg_score"><span>평균 평점</span><br />
											<span>★★★★☆</span><br /> <span>4.0</span></td>
										<td colspan="3" id="review_content">(훌륭) 다음에 또와요</td>

									</tr>

									<!-- 3행 -->
									<tr>
										<td colspan="3" id="review_content">(보통) 먹을만 하네요</td>
									</tr>

									<!-- 4행 -->
									<tr>
										<td colspan="3" id="review_content">(별로) 다음에 다른데 가요</td>
									</tr>

								</table>

								<!-- 리뷰 상세 -->
								<div class="review_detail" id="review_detail1">
									<table ng-repeat="pereview in review.pereviewList">
										<tr>
											<td id="review_detail_member_img"><img
												src="pereview.pereviewImgUrl" /></td>
											<td id="review_detail_member_name"><span>{{pereview.pereviewMemId}}</span></td>
											<td><span>{{pereview.pereviewContent}}</span></td>
										</tr>
										<tr>
											<td></td>
											<td colspan="2"><img src="pereview.pereviewImgUrl" /></td>
										</tr>
									</table>
								</div>
								<button type="button" ng-click="doAccordian()">상세보기</button>
							</section><!-- 리뷰 한개 아이템 마지막 -->
							
							<!-- <!-- <section id="review">
								<table>
									1행
									<tr>
										<td id="review_group_img"><img src="/resources/images/group.PNG" /></td>
										<td colspan="2">
											<span id="review_group_name">
												{{review.reviewGroupName}}<br/>
											</span>
											<br /> 
											<span id="review_group_write">04명의 인원이 함께 작성하였습니다.</span>
										</td>
										<td id="review_td_like"><img id="review_like_img"
											src="images/heart_1.png"> <span id="review_like">37</span><br />
											<span>등록일시:2017년 5월 22일</span></td>
									</tr>

									2행
									<tr>
										<td rowspan="4" id="review_avg_score"><span>평균 평점</span><br />
											<span>★★★★☆</span><br /> <span>4.0</span></td>
										<td colspan="3" id="review_content">(훌륭) 다음에 또와요</td>

									</tr>

									3행
									<tr>
										<td colspan="3" id="review_content">(보통) 먹을만 하네요</td>
									</tr>

									4행
									<tr>
										<td colspan="3" id="review_content">(별로) 다음에 다른데 가요</td>
									</tr>

								</table>

								리뷰 상세
								<div class="review_detail" id="review_detail1">
									<table>
										<tr>
											<td id="review_detail_member_img"><img
												src="/resources/images/jihye.PNG" /></td>
											<td id="review_detail_member_name"><span>지혜</span></td>
											<td><span>맛있었어</span></td>
										</tr>

										<tr>
											<td></td>
											<td colspan="2"><img src="/resources/images/food_1.jpg" /></td>
										</tr>

										<tr>
											<td id="review_detail_member_img"><img
												src="/resources/images/minju.PNG" /></td>
											<td id="review_detail_member_name"><span>민주</span></td>
											<td><span>괜찮았어</span></td>
										</tr>

										<tr>
											<td></td>
											<td colspan="2"><img src="/resources/images/food_2.jpg" /></td>
										</tr>

										<tr>
											<td id="review_detail_member_img"><img
												src="/resources/images/daehee.PNG" /></td>
											<td id="review_detail_member_name"><span>대히</span></td>
											<td><span>다른데 가자</span></td>
										</tr>

										<tr>
											<td></td>
											<td colspan="2"><img src="/resources/images/food_3.jpg" /></td>
										</tr>
									</table>
								</div>
								<button type="button" ng-click="doAccordian()">상세보기</button>
							</section>리뷰 한개 아이템 마지막 --> -->
						</article>
					</div>
				</div>
				<hr />

			</div>

		</div>

		<!-- Footer -->
		<div id="footer">
			<div class="install_div">
				<ul class="install_area">
					<li class="install_item_1"><img src="/resources/images/icon_android.png" />
						<div class="install_item_content">
							<h3>안드로이드 버전 설치하기</h3>
							<p>
								더 편리하게 이용할 수 있는 꿀~팁!<br />안드로이드 앱을 설치하면 된다구 !
							</p>
						</div></li>
					<li class="install_item_2"><img src="/resources/images/icon_store.png" />
						<div class="install_item_title">
							<h3>마켓으로 가기</h3>
						</div></li>
					<li class="install_item_2"><img src="/resources/images/icon_share.png" />
						<div class="install_item_title">
							<h3>친구에게 공유하기</h3>
						</div></li>
				</ul>
			</div>

			<!-- Copyright -->
			<div class="copyright">
				<ul class="menu">
					<li>&copy; Matjo 2017 05. All rights reserved.</li>
					<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>
		</div>

	</div>

	<!--부트스트랩-->

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>