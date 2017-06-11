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
						<a>비밀번호 찾기</a>
					</h2>
				</header>
				<section>

					<!-- content -->
					<div id="content">

						<div class="insert_rorw" id="pw_area">
							<span class="input_box"> <label>아이디</label> <input
								type="text" id="pw" ng-model="memberBean.memberId" />
							</span>
						</div>
							<button type="button" class="btn_insert"
								ng-click="selectMember()">아이디 확인</button>

						<div class="insert_rorw" id="pw_area">
							<span class="input_box"> <label>질문 선택</label> &nbsp;
							<select id="quest"
								ng-model="memberBean.memberQuestion">
									<option value="0">나의 학창시절 별명은?</option>
									<option value="1">나의 보물 제 1호는?</option>
									<option value="2">나의 가족 수는?</option>
									<option value="3">나의 애완동물 이름은?</option>
							</select>
							</span>
						</div>
						<div class="insert_rorw" id="pw_area">
							<span class="input_box"> <label>질문 답</label> <input
								type="text" id="pw" maxlength="50"
								ng-model="memberBean.memberAnswer" />
							</span>
						</div>
						<button type="button" class="btn_insert"
							ng-click="findMemberProc()">질문 답 확인</button>
					</div>
				</section>
			</article>
			<hr />
		</div>
	</div>
</body>
</html>