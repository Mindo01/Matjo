<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>맛조::회원가입</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/font-kor.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
<link rel="stylesheet"
	href="/resources/assets/css/insertMemberFormSub.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

<script type="text/javascript" src="/js/common/angular/angular.js"></script>
<script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>
<script type="text/javascript" src="/js/member/memberApp.js"></script>
<script type="text/javascript" src="/js/member/memberController.js"></script>
<script type="text/javascript" src="/js/common/holdon/HoldOn.js"></script>

</head>
<body>
	
	<div ng-app="memberApp" ng-controller="MemberController" ng-init="updateMemberInit('${sessionScope.memberLoginBean.memberId}');searchAddressCityProc();">
		<div class="wrapper style1">
			<div class="container">
				<article id="main" class="special">
					<header>
						<h2 class="title_ko" lang="ko">
							<a>회원정보수정</a>
						</h2>
					</header>
					<section>
					
						<!-- content -->
						<div id="content">
							<div class="insert_rorw" id="id_area">
								<span class="input_box"> 
									<span id="span_text" ng-model="memberBean.memberId">{{memberBean.memberId}}</span>
								</span>
							</div>
							
							<div class="insert_rorw" id="pw_area">
								<span class="input_box"> 
									<input type="password" id="pw" placeholder="비밀번호" maxlength="20" ng-model="memberBean.mPw">
								</span>
							</div>
							
							<div class="insert_rorw" id="pw_area">
								<span class="input_box"> 
									<input type="password" id="pw" placeholder="비밀번호재확인" maxlength="20" ng-model="memberBean.mPwCheck"> 
									<input type="hidden" ng-model="memberBean.memberPw" />
								</span>
							</div>
						</div>
						
						<div class="insert_rorw" id="pw_area">
							<span class="input_box"> 
								<input type="text" id="pw" placeholder="닉네임" maxlength="16" ng-model="memberBean.memberName">
							</span>
						</div>
						
						<div class="phoneselect" id="phon">
							<div id="margin_bottom">
								<span class="phoneselectbox">
									<span id="span_text" ng-model="memberBean.memberHp">{{memberBean.memberHp}}</span> 
								</span>
							</div>
						</div>
						
						<div class="addressbox_row">
							<span class="addressbox">
								<label id="address">주소 </label>&nbsp;
								<select id="addr" ng-model="memberBean.memberCity" ng-options="city.name as city.name for city in cityList" ng-change="searchAddressLocalProc()">
									<option value="">선택하여 주세요</option>
								</select> 
								
								<select id="addr" ng-model="memberBean.memberLocal" ng-options="local.name as local.name for local in localList">
									<option value="">선택하여 주세요</option>
								</select>
							</span>

						</div>
						<div class="question_row" id="">
							<span class="questionbox"> 
								<label for="quest" id="question">질문</label>&nbsp;
								
								<select id="quest" ng-model="memberBean.memberQuestion">
										<option value="0">나의 학창시절 별명은?</option>
										<option value="1">나의 보물 제 1호는?</option>
										<option value="2">나의 가족 수는?</option>
										<option value="3">나의 애완동물 이름은?</option>
								</select>
								
							</span>
						</div>
						
						<div class="answer">
							<span class="answerbox"> 
								<label for="anserinput" id="ans">답</label>&nbsp;
								<input type="text" id="anserinput" maxlength="20" placeholder="질문의 답을 입력하세요." ng-model="memberBean.memberAnswer">
							</span>
						</div>
						
						<button type="button" class="btn_insert" ng-click="updateMemberProc()">회원정보 수정하기</button>
					</section>
				</article>
				<hr />
			</div>
		</div>
	</div>
	
</body>
</html>