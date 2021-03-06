<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>맛조::회원가입</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
<link rel="stylesheet" href="/resources/assets/css/insertMemberFormSub.css" />
</head>
<body>
	
		<div class="wrapper style1" ng-app="memberApp" ng-controller="MemberController" ng-init="searchAddressCityProc()">
			<div class="container">
				<article id="main" class="special">
					<header>
						<h2 class="title_ko" lang="ko">
							<a>회원가입</a>
						</h2>
					</header>
					<section>
					
						<!-- content -->
						<div id="content">
							<div class="insert_rorw" id="id_area">
								<span class="input_box"> 
									<input type="text" id="id" placeholder="아이디" maxlength="20" ng-model="memberBean.mId" ng-change="idCheckProc()" ng-required="true">@
									<input type="text" id="email" placeholder="이메일" maxlength="25" ng-model="memberBean.mEmail" ng-change="idCheckProc()" ng-required="true"> 
									<input type="hidden" ng-model="memberBean.memberId" />
										
									<select id="emailselect" ng-model="selectEmail" ng-change="settingEmail();idCheckProc();">
										<option value="" selected="selected">직접입력</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
									</select>
								</span>
								<br>
								<label class="checkList" ng-model="idCheck" ng-if="memberBean.memberId!=''">{{idCheck}}</label>
							</div>
							
							<div class="insert_rorw" id="pw_area">
								<span class="input_box"> 
									<input type="password" id="pw" placeholder="비밀번호" maxlength="20" ng-model="memberBean.mPw" ng-required="true">
								</span>
							</div>
							
							<div class="insert_rorw" id="pw_area">
								<span class="input_box"> 
									<input type="password" id="pw" placeholder="비밀번호재확인" maxlength="20" ng-model="memberBean.mPwCheck" ng-required="true"> 
									<input type="hidden" ng-model="memberBean.memberPw" />
								</span>
							</div>
						</div>
						
						<div class="insert_rorw" id="pw_area">
							<span class="input_box"> 
								<input id="pw" type="text" placeholder="닉네임" maxlength="16" ng-model="memberBean.memberName" ng-required="true">
							</span>
						</div>
						
						<div class="phoneselect" id="phon">
							<span class="phoneselectbox"> 
								<select id="phonenum" ng-model="memberBean.hp1">
										<option value="010" selected="selected">010</option>
										<option value="011">011</option>
										<option value="017">017</option>
										<option value="070">070</option>
								</select>
							</span> 
							
							<input id="phonnum" type="number" maxlength="8" placeholder=" ' - ' 없이 입력" ng-model="memberBean.hp2" ng-change="hpCheckProc()" ng-required="true"> 
							<input type="hidden" ng-model="memberBean.memberHp" />
							<br>
							<label class="checkList" ng-model="hpCheck" ng-if="memberBean.memberHp!=''">{{hpCheck}}</label>
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
								<input type="text" id="anserinput" maxlength="20" placeholder="질문의 답을 입력하세요." ng-model="memberBean.memberAnswer" ng-required="true">
							</span>
						</div>
						
						<button type="button" class="btn_insert" ng-click="insertMemberProc()">회원가입하기</button>
					</section>
				</article>
				<hr />
			</div>
		</div>
	
</body>
</html>