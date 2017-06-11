<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맛조</title>

<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/font-kor.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
<link rel="stylesheet" href="/resources/assets/css/insertMemberFormSub.css" />
<link rel="stylesheet" href="/resources/assets/css/findMemberSub.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

</head>
<body>
	<div class="wrapper style1" ng-app="memberApp"
		ng-controller="MemberController">
		<div class="container">
			<article id="main" class="special">
				<header>
					<h2 class="title_ko" lang="ko">
						<a>새 비밀번호 설정</a>
					</h2>
				</header>
				<section>

					<!-- content -->
					<div id="content">

						<div class="insert_rorw" id="pw_area">
							<span class="input_box"> 
								<label id="address">새비밀번호 입력</label> 
								<input type="password" id="pw" maxlength="20" ng-model="memberBean.memberPw" required /> 
							</span>
						</div>
						
						<div class="insert_rorw" id="pw_area">
							<span class="input_box"> 
								<label id="address">새비밀번호 확인</label> 
								<input type="password" id="pw" maxlength="20" ng-model="memberBean.mPwCheck" required />
							</span>
						</div>
						
						<button type="button" class="btn_insert" ng-click="newPassword('${param.memberId}')">새 비밀번호 설정</button>
					</div>
				</section>
			</article>
			<hr />
		</div>
	</div>

</body>
</html>