<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>맛조::맛집 검색 결과</title>
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
<script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function() {
		$(".login").click(function() {
			$('div.modal').modal();
		});
	});
</script>
<script type="text/javascript" src="/js/resta/restaApp.js"></script>
<script type="text/javascript" src="/js/resta/restaController.js"></script>
<!-- <script type="text/javascript">
function getLoc() {
	// HTML5의 geolocation을 사용할 수 있는지 확인한다. 
	if (navigator.geolocation) {
	    // GeoLocation을 이용해서 접속 위치를 얻어온다.
	    navigator.geolocation.getCurrentPosition(function(position) {
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	            alert(lat + ', ' + lon); // 콘솔로 좌표 확인
	      });
	} else { // HTML5의 GeoLocation을 사용할 수 없을때
		// 처리
	}
}
</script> -->
</head>
<body class="no-sidebar">
	<div ng-modules="restaApp" ng-controller="RestaController" ng-init=""
		id="page-wrapper">

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
		<div class="wrapper style1">

			<div class="container">
				<article id="main" class="special">
					<header>
						<h2 class="title_ko" lang="ko">
							<a href="#">맛집 검색 결과</a>
						</h2>
						<p lang="ko" id="textKeyword"></p>
					</header>
					<section class="search_area_resta">
						<!-- 검색 창 -->
						<div class="search_window_resta">
							<span class="orange_window"> <input type="text"
								class="input_text" ng-model="pagingBean.searchText" />
							</span>
							<button type="submit" class="sch_smit"
								ng-click="selectRestaListProc(${pagingBean})">검색</button>
						</div>
					</section>
					<section>
						<!-- 검색 필터 -->
						<div id="tab_area" class="tab_filter_area">
							<!-- 탭 기능을 위한 안보이는 라디오 버튼 -->
							<input id="tab_resta" type="checkbox" name="tab" />
							<!-- 라벨 : 화면에 표시되는 탭 제목 -->
							<label for="tab_resta" class="tab_filter">검색 조건 설정</label>
							<!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->
							<!-- 탭버튼 클릭 시 화면 -->
							<div class="tab_resta_content">
								검색 필터입니다 <br /> <input type="radio" name="search" value="normal"
									ng-model="searchType" checked />일반검색&nbsp;&nbsp;&nbsp; <input
									type="radio" name="search" value="location"
									ng-model="searchType" />위치기반 검색<br /> <input type="radio"
									name="radius" value="5" ng-model="pagingBean.radius" checked />5km&nbsp;&nbsp;&nbsp;
								<input type="radio" name="radius" value="10"
									ng-model="pagingBean.radius" />10km&nbsp;&nbsp;&nbsp; <input
									type="radio" name="radius" value="20"
									ng-model="pagingBean.radius" />20km
							</div>
						</div>
					</section>
					<section>
						<div class="notice">
							<table class>
								<colgroup>
									<col width="10%">
									<col width="*">
									<col width="10%">
									<col width="8%">
								</colgroup>
								<tr>
									<th>번호</th>
									<th>맛집 이름</th>
									<th>카테고리</th>
									<th>조회수</th>
								</tr>
								<tr>
									<td>1</td>
									<td><a href="#">최고로 맛있는 집</a></td>
									<td>한식</td>
									<td>130</td>
								</tr>
								<tr>
									<td>2</td>
									<td><a href="#">정말로 맛있는 집</a></td>
									<td>양식</td>
									<td>130</td>
								</tr>
								<tr>
									<td>3</td>
									<td><a href="#">디이따 맛있는 집</a></td>
									<td>중식</td>
									<td>130</td>
								</tr>
								<tr>
									<td>4</td>
									<td><a href="#">대박 맛있는 집</a></td>
									<td>한식</td>
									<td>130</td>
								</tr>
								<tr>
									<td>5</td>
									<td><a href="#">둘이 먹다 하나가 죽는 집</a></td>
									<td>일식</td>
									<td>130</td>
								</tr>
								<tr>
									<td>6</td>
									<td><a href="#">차칸치키니</a></td>
									<td>술집</td>
									<td>130</td>
								</tr>
								<tr ng-repeat="resta in restaList">
									<td>{{resta.restaId}}</td>
									<td><a href="#" ng-click="goDetailPage(resta)">{{resta.restaTitle}}</a></td>
									<td>{{resta.restaCate}}</td>
									<td>130</td>
								</tr>
							</table>
						</div>
					</section>
				</article>
				<!-- 페이지 -->
				<button type="button" ng-click="addRestaItem(pagingBean.pageNo+1)">더
					보기</button>

				<!-- 특정 업소 선택시 화면이동을 하며 dlBean 을 보낸다 -> 앵귤러만으로 구현이 안되기에 JS 코드와 함께 작동시킴 -->
				<form id="sendForm" method="post">
					<input type="hidden" id="restaId" name="restaId"> 
					<input type="hidden" id="restaTitle" name="restaTitle">
					<input type="hidden" id="restaCate" name="restaCate"> 
					<input type="hidden" id="restaAddr" name="restaAddr"> 
					<input type="hidden" id="restaImgUrl" name="restaImgUrl">
					<input type="hidden" id="restaLat" name="restaLat">
					<input type="hidden" id="restaLng" name="restaLng">
					<input type="hidden" id="restaUrl" name="restaUrl">
					<input type="hidden" id="restaPhone" name="restaPhone">
				</form>

				<hr />
			</div>

		</div>

		<!-- Footer -->
		<div id="footer">
			<div class="install_div">
				<ul class="install_area">
					<li class="install_item_1"><img
						src="/resources/images/icon_android.png" />
						<div class="install_item_content">
							<h3>안드로이드 버전 설치하기</h3>
							<p>
								더 편리하게 이용할 수 있는 꿀~팁!<br />안드로이드 앱을 설치하면 된다구 !
							</p>
						</div></li>
					<li class="install_item_2"><img
						src="/resources/images/icon_store.png" />
						<div class="install_item_title">
							<h3>마켓으로 가기</h3>
						</div></li>
					<li class="install_item_2"><img
						src="/resources/images/icon_share.png" />
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

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>