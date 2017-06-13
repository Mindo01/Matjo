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
</head>
<body class="no-sidebar">
	<div ng-modules="restaApp" ng-controller="RestaController" ng-init=""
		id="page-wrapper">

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
								<tr ng-repeat="resta in restaList">
									<td>{{resta.restaId}}</td>
									<td><a href="#" ng-click="goDetailPage(resta)">{{resta.restaTitle}}</a></td>
									<td>{{resta.restaCate}}</td>
									<td>130</td>
								</tr>
								<tr ng-if="restaList == null || restaList.length == 0">
									<td colspan="4">
										데이터가 없습니다.
									</td>
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


	</div>

</body>
</html>