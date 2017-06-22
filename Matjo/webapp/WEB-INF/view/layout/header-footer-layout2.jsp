<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><decorator:title default="맛조" /></title>
<script type="text/javascript" src="/js/common/angular/angular.js"></script>
<script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>
<script type="text/javascript" src="/js/member/memberApp.js"></script>
<script type="text/javascript" src="/js/member/memberController.js"></script>
<c:import url="/WEB-INF/view/layout/header.jsp"></c:import>

<decorator:head />
</head>
<body>
			<!-- 내용 -->
			<decorator:body />

			<!-- 공통 네비 메뉴 -->
			<!-- Nav -->
			<nav id="nav">
				<a href="/index.do"><img src="/resources/images/logo_white.png" /></a>
				<ul>
					<li><a href="/index.do">맛조?</a>
						<ul>
							<li><a href="/matjoview/matjoIntroduction.do">서비스 소개</a></li>
							<li><a href="/matjoview/matjoHistory.do">히스토리</a></li>
							<li><a href="/matjoview/matjoMemberList.do">멤버</a></li>
						</ul></li>
					<li><a href="/rank/selectRankForm.do">랭크</a></li>
					<li><a href="promotion/selectPromo.do">프로모션</a></li>
					<li><a href="/notice/selectNoticeList.do">맛조센터</a>
						<ul>
							<li><a href="/notice/selectNoticeList.do">공지사항</a></li>
							<li><a href="/inquiry/selectInquiryList.do">문의사항</a></li>
						</ul></li>
				</ul>
					<div class="member_menu" style="color: rgba(0,0,0,0) !important;">
						<a class="login" style="color: rgba(0,0,0,0) !important;">로그인</a>
						<a ng-click="insertMemberForm()" style="color: rgba(0,0,0,0) !important;">회원가입</a>
					</div>
			</nav>
		
		<!-- 공통 푸터 -->
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
</body>
</html>
