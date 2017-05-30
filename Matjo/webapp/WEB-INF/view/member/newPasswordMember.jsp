<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맛조</title>
<script type="text/javascript">
		$(function() {
			
			// 새 비밀번호 설정
			$("#btnNewPassword").click(function() {
				if(!($("#memberPw").val()==$("#memberPwCheck").val())){
					alert("새 비밀번호 확인이 일치하지 않습니다.");
					return;
				}
				
		        $.ajax({
		            type:"POST",
		            url:"/member/updateMemberProc.do",
		            data: $("#memberForm").serialize(),
		            dataType:'json',
		            success:function(data) {
				        if(data.result == "success"){
				        	alert(data.resultMsg);
				        	location.replace("/member/loginMemberForm.do");
				  			return;
				        } else {
				        	alert(data.resultMsg);
				        }
				    },
			        error:function(xhr, status, error) {
			            alert("error\nxhr : "+xhr+" status : "+status+" error : "+error);
			       	}
			    });
			});
			
		});
</script>

</head>
<body>
	<h1 align="center">새 비밀번호 설정</h1>
	
	<form id="memberForm" method="post">
		<table border="1" cellpadding="0" cellspacing="10" align="center">
			<tr>
				<td>새비밀번호 입력<input type="hidden" name="memberId" value="${param.memberId}"/></td>
				<td><input type="password" id="memberPw" name="memberPw" maxlength="20" required /></td>
			</tr>
			<tr>
				<td>새비밀번호 확인</td>
				<td><input type="password" id="memberPwCheck" name="memberPwCheck" maxlength="20" required /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" id="btnNewPassword">새 비밀번호 설정</button></td>
			</tr>
			
		</table>
	</form>

</body>
</html>