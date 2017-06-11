<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 모임 등록</title>
<link href="/resources/assets/css/mj-custom.css" rel="stylesheet" type="text/css"/>
<link href="/resources/assets/css/mj-responsive.css" rel="stylesheet" type="text/css"/>
	
	<script type="text/javascript">
		function insertGroup() {
			var groupForm = document.getElementById("insertGroup");
			groupForm.method = "post";
			groupForm.action = "/group/insertGroupProc.do";
			groupForm.submit();
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
				<a href="#">모임 등록 화면</a>
				</h2>
				<p lang="ko">
				모임을 새로 등록합시다!
				</p>
				</header>
			</article>
			<div class="notice">
				<form id="insertGroup" enctype="multipart/form-data">
				<table>
					<tr>
						<th colspan="2">모임 등록 폼</th>
					</tr>
					<tr>
						<td>모임 이름</td>
						<td><input type="text" name="groupName" maxlength="10" style="height:25px; width:100%;" required/></td>
					</tr>
					<tr>
						<td>모임장</td>
						<td>
						<input type="hidden" name="memberNo" value="${ sessionScope.memberLoginBean.memberNo }" />
						${ sessionScope.memberLoginBean.memberName }</td>
					</tr>
					<tr>
						<td style="vertical-align: middle;">모임 설명</td>
						<td><textarea name="groupInfo" style="width:100%;" cols="30" rows="7" maxlength="120" required></textarea></td>
					</tr>
					<tr>
						<td>모임 이미지 첨부</td>
						<td><input type="file" name="imgFile"/></td>
					</tr>
					<tr>
						<td colspan="2">
						<button class="sch_smit" type="button" onclick="insertGroup();">등록하기</button>
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