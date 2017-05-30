<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맛조</title>
<script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript">
	
	$(function() {
    	$("#btnLoginMember").click(function() {
        	$.ajax({
	            type:"POST",
	            url:"/member/loginMemberProc.do",
	            data: {
	               memberId:$("#memberId").val(),
	               memberPw:$("#memberPw").val()
	            },
	            dataType:'json',
	            success:function(data) {
	               if(data.result == "success"){
	            	   location.replace("/index.do");
	            	   return;
	               } else {
	            	   alert(data.resultMsg);
	            	   $("#memberPw").focus();
	               }
	            },
	            error:function(xhr, status, error) {
	               console.log(xhr);
	               alert("error\nxhr : "+xhr+" status : "+status+" error : "+error);
	            }
         	});
      });
      
      // 회원가입 화면으로 이동
      $("#btnInsertMember").click(function() {
    	  location.href = "/member/insertMemberForm.do";
      });
      
   	  // 비밀번호 찾기 화면으로 이동
      $("#btnFindMember").click(function() {
    	  location.href = "/member/findMemberForm.do";
      });
      
   });

</script>
</head>
<body>
		<h1 align="center">로그인 화면</h1>
		<table border="1" cellpadding="0" cellspacing="10" align="center">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="memberId"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="memberPw"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="button" id="btnLoginMember">로그인</button> &nbsp; 
				<button type="button" id="btnInsertMember">회원가입</button> &nbsp;
				<button type="button" id="btnFindMember">비밀번호 찾기</button></td>
			</tr>
		</table>
</body>
</html>