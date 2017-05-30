<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맛조</title>
<script type="text/javascript">
		$(function() {
			
			var isIdCheck = false;
			
			// 아이디 확인
			$("#btnIdCheck").click(function() {
		        $.ajax({
		            type:"POST",
		            url:"/member/selectMemberProc.do",
		            data: $("#memberForm").serialize(),
		            dataType:'json',
		            success:function(data) {
				        if(data.result == "success"){
				        	isIdCheck = true;
				        	alert(data.resultMsg);
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
			
			// 질문 확인
			$("#btnQuestionCheck").click(function() {
		        $.ajax({
		            type:"POST",
		            url:"/member/findMemberProc.do",
		            data: $("#memberForm").serialize(),
		            dataType:'json',
		            success:function(data) {
		            	if(!isIdCheck){
		            		alert("아이디를 먼저 확인해주세요");
		            		return;
		            	}
		            	var mBean = data.mBean;
				        if(data.result == "success"){
				        	location.href = "/member/newPasswordMemberForm.do?memberId="+mBean.memberId;
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
	<h1 align="center">비밀번호 찾기</h1>
	
	<form id="memberForm" method="post">
		<table border="1" cellpadding="0" cellspacing="10" align="center">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="memberId" name="memberId"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" id="btnIdCheck">아이디 확인</button></td>
			</tr>
			
			<tr>
				<td>질문 선택</td> 
				<td>
					<select name="memberQuestion">
						<option value="0">나의 보물 1호는?</option>
						<option value="1">잘생긴 사람은?</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>질문 답</td>
				<td><input type="text" name="memberAnswer" maxlength="50" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" id="btnQuestionCheck">질문 답 확인</button></td>
			</tr>
			
			
		</table>
	</form>

</body>
</html>