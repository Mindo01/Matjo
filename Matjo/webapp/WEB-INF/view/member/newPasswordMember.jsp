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
	<h1 align="center">새 비밀번호 설정</h1>
	
		<table border="1" cellpadding="0" cellspacing="10" align="center">
			<tr>
				<td>새비밀번호 입력</td>
				<td><input type="password" maxlength="20" ng-model="memberBean.memberPw" required /></td>
			</tr>
			<tr>
				<td>새비밀번호 확인</td>
				<td><input type="password" maxlength="20" ng-model="memberBean.mPwCheck" required /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" ng-click="newPassword('${param.memberId}')">새 비밀번호 설정</button></td>
			</tr>
			
		</table>
	</div>
</body>
</html>