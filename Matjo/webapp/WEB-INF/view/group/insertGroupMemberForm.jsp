<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 가입 신청 화면</title>
<link href="/resources/assets/css/mj-custom.css" rel="stylesheet" type="text/css"/>
<link href="/resources/assets/css/mj-responsive.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		#insertGroupMember input {
			width:73% !important;
			display: inline-block !important;
		}
		#insertGroupMember button {
			width:25% !important;
			display: inline-block !important;
		}
	</style>
	<script type="text/javascript">
		function insertGroupMemberFunc() {
			var groupForm = document.getElementById("insertGroupMember");
			groupForm.method = "post";
			groupForm.action = "/group/insertGroupMemberProc.do";
			groupForm.submit();
		};
		
		function searchGroup() {
			window.open("/group/selectGroupToApply.do", "", 
					"top=200, left=100, width=750, height=450, directories=yes, location=no, resizable=no, status=yes, toolbar=no");
		};
	</script>
</head>
<body class="no-sidebar">
<div id="page-wrapper">
<!-- Header -->
	<div id="header">
	    <!-- Inner -->
	    <div class="inner">
	    </div>
	</div>
<!-- Main -->
	<div class="wrapper style1">
		<div class="container">
			<article id="main" class="special">
				<header>
				<h2 class="title_ko" lang="ko">
				<a href="#">모임 가입 화면</a>
				</h2>
				<p lang="ko">
				내가 원하는 모임에 가입합시다!
				</p>
				</header>
			</article>
			<div class="notice">
				<form name="insertGroupMember" id="insertGroupMember" enctype="multipart/form-data">
				<table>
					<tr>
						<th colspan="2">모임 가입 신청</th>
					</tr>
					<tr>
						<td>모임 이름</td>
						<td>
							<input type="hidden" name="groupNo"/>
							<input type="text" name="groupName" maxlength="20" placeholder="찾기로 검색하세요" readonly required>
							<button class="sch_smit" type="button" onclick="javascript:searchGroup();">찾기</button>
						</td>
					</tr>
					<tr>
						<td>모임장</td>
						<td><input style="width:99% !important;" type="text" name="groupLeader" maxlength="20" readonly required></span></td>
					</tr>
					<tr>					
						<td>가입신청자</td>
						<td>
						<input type="hidden" name="memberNo" value="${ sessionScope.memberLoginBean.memberNo }" />
						${ sessionScope.memberLoginBean.memberName }</td>
					</tr>
					<tr>
						<td style="vertical-align: middle;">가입 신청 내용</td>
						<td><textarea name="applyContent" style="width:100%;" cols="30" rows="7" maxlength="120" required></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
						<button class="sch_smit" type="button" onclick="javascript:insertGroupMemberFunc();">가입하기</button>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
