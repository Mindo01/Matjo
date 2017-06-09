<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맛조</title>
<script type="text/javascript" src="/js/common/angular/angular.js"></script>
<script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>
<script type="text/javascript" src="/js/member/memberApp.js"></script>
<script type="text/javascript" src="/js/member/memberController.js"></script>

</head>
<body>
	<div ng-app="memberApp" ng-controller="MemberController" >
	<h1 align="center">비밀번호 찾기</h1>
	
		<table border="1" cellpadding="0" cellspacing="10" align="center">
			<tr>
				<td>아이디</td>
				<td><input type="text" ng-model="memberBean.memberId"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" ng-click="selectMember()">아이디 확인</button></td>
			</tr>
			
			<tr>
				<td>질문 선택</td> 
				<td>
					<select ng-model="memberBean.memberQuestion">
							<option value="0">나의 학창시절 별명은?</option>
							<option value="1">나의 보물 제 1호는?</option>
							<option value="2">나의 가족 수는?</option>
							<option value="3">나의 애완동물 이름은?</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>질문 답</td>
				<td><input type="text" maxlength="50" ng-model="memberBean.memberAnswer"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" ng-click="findMemberProc()">질문 답 확인</button>
				</td>
			</tr>
			
		</table>
	</div>
</body>
</html>