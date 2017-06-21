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
<script type="text/javascript" src="/js/common/angular/angular.ng-modules.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<c:import url="/WEB-INF/view/layout/header.jsp"></c:import>

<script type="text/javascript" src="/js/member/memberApp.js"></script>
<script type="text/javascript" src="/js/member/memberController.js"></script>

<decorator:head />
</head>
<body>
		<!-- 공통 모달 -->
		<!-- Modal -->
		<div>
			<div class="modal fade" id="write_layerpop" ng-modules="memberApp" ng-controller="MemberController">
				<div class="modal-dialog">
					<div class="modal-content modal-content_write">
						<div class="modal-header">
							<h3 class="modal-title">로그인</h3>
						</div>
						
						<div class="modal-body">
							<div class="input_row" id="id_area">
								<span class="input_box"> 
									<input type="text" placeholder="이메일" maxlength="20" value="" ng-model="memberBean.mId">@ 
									<input type="text" maxlength="25" ng-model="memberBean.mEmail">
									
									<select id="emailselect" ng-model="selectEmail" ng-change="settingEmail()">
										<option value="" selected="selected">직접입력</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
									</select>
								</span>
							</div>
							
							<div class="input_row" id="pw_area">
								<span class="input_box"> 
									<input type="password" placeholder="비밀번호" maxlength="20" ng-model="memberBean.memberPw">
								</span>
							</div>
							
							<!-- TODO : 자동로그인 체크박스 -->
<!-- 							<div class="check_info"> -->
<!-- 								<div class="login_check"> -->
<!-- 									<span class="login_check_box">  -->
<!-- 										<input type="checkbox" value="off"/>  -->
<!-- 										<label for="login_chk" id="label_login_chk" class="sp">자동 로그인</label> -->
<!-- 									</span> -->
<!-- 								</div> -->
<!-- 							</div> -->
								
								
							<div class="modal-footer">
								<span id="loginbutton"> 
									<input type="button" value="로그인" class="btn_global" lang="ko" ng-click="loginMember()">
								</span> 
								
<!-- 								TODO : sns 로그인 -->
<!-- 								<span id="cacaologinbutton">  -->
<!-- 									<input type="button" value="카카오톡 로그인" class="btn_sns" lang="ko"/> -->
<!-- 								</span> -->
<!-- 									<br> -->
<!-- 								네이버 아이디로 로그인 -->
								<span id="naver_id_login" class="naver_id_login" name="naver_id_login">네이버로 로그인</span>
								<label id="findPassword" ng-click="findMemberForm()">비밀번호를 잃어버리셨나요?</label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 내용 -->
			<decorator:body />

			<!-- 공통 네비 메뉴 -->
			<!-- Nav -->
			<nav id="nav" ng-modules="memberApp" ng-controller="MemberController">
				<a href="/index.do"><img src="/resources/images/logo_white.png" /></a>
				<ul>
					<li><a href="/index.do">맛조?</a>
						<ul>
							<li><a href="/matjoview/matjoIntroduction.do">서비스 소개</a></li>
							<li><a href="/matjoview/matjoHistory.do">히스토리</a></li>
							<li><a href="/matjoview/matjoMemberList.do">멤버</a></li>
						</ul></li>
					<li><a href="/rank/selectRankForm.do">랭크</a></li>
					<li><a href="/promotion/selectPromo.do">프로모션</a></li>
					<li><a href="/notice/selectNoticeList.do">맛조센터</a>
						<ul>
							<li><a href="/notice/selectNoticeList.do">공지사항</a></li>
							<li><a href="/inquiry/selectInquiryList.do">문의사항</a></li>
						</ul></li>
				</ul>
				
				<c:choose>
					<c:when test="${sessionScope.memberLoginBean==null}">
					<div class="member_menu">
						<a class="login">로그인</a>
						<a ng-click="insertMemberForm()">회원가입</a>
					</div>
					</c:when>
					<c:otherwise>
						<div class="member_menu">
						${sessionScope.memberLoginBean.memberName}님
						<a ng-click="logoutMember()">로그아웃</a> 
						<a ng-click="updateMemberForm()">회원정보 수정</a>
					</div>
					</c:otherwise>
				</c:choose>
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
		</div>
</body>
<script type="text/javascript">
  	var naver_id_login = new naver_id_login("rJcQNBJ0RQ1vngwezHdZ", "http://localhost:8080/index.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 4,40);
  	naver_id_login.setDomain("http://localhost:8080");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
</html>
