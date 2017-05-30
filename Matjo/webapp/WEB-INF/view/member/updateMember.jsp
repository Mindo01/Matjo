<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	$(function() {
		HoldOn.open({
			theme:"sk-cube-grid"
		});
		$.ajax({
			type : "POST",
			url : "/member/selectMemberProc.do?memberId=${sessionScope.memberLoginBean.memberId}",
			dataType : 'json',
			success : function(data) {
				HoldOn.close();
				printLog(data)
				if (data.result == "success") {
					HoldOn.close();
					var mBean = data.mBean;
					
					$("#memberId").text(mBean.memberId);
					$("input[name='memberName']").val( mBean.memberName );
					$("select[name='hp1']").val( mBean.hp1 );
					$("input[name='hp2']").val( mBean.hp2 );
					$("input[name='hp3']").val( mBean.hp3 );
					$("select[name='memberCity']").val( mBean.memberCity );
					$("select[name='memberLocal']").val( mBean.memberLocal );
					$("select[name='memberQuestion']").val( mBean.memberQuestion );
					$("input[name='memberAnswer']").val( mBean.memberAnswer );
					
				} else {
					alert(data.resultMsg);
				}
			},
			error : function(xhr, status, error) {
				HoldOn.close();
				alert("error\nxhr : " + xhr + " status : " + status + " error : " + error);
			}
		});
			
		// 업데이트 처리
		$("#btnUpdateMember").click(function() {
	    	//핸드폰번호를 문자열 결합한다.
			var memberHp = $("#hp1").val() + "-" + $("#hp2").val() + "-" + $("#hp3").val();
		    $("#memberHp").val(memberHp);
			 
	        $.ajax({
	            type:"POST",
	            url:"/member/updateMemberProc.do",
	            data: $("#memberForm").serialize(),
	            dataType:'json',
	            // 성공 시 실행
	            success:function(data) {
			        if(data.result == "success"){
						location.replace("/index.do");
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

	<h1 align="center">회원정보수정</h1>
	
	<form id="memberForm" method="post">
		<table align="center" border="1" cellspacing="0" cellpadding="10">
			
			<tr>
				<td>ID</td>
				<td><span id="memberId"></span><input type="hidden" name="memberId" value="${sessionScope.memberLoginBean.memberId}" /></td>
			</tr>
			
			<tr>
				<td>PW</td>
				<td><input type="password" name="memberPw" maxlength="20" required /></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input type="text" name="memberName" maxlength="20" /></td>
			</tr>
			
			<tr>
				<td>휴대폰번호</td>
				<td>
				<select id="hp1" name="hp1">
					<option value="010">010</option>
					<option value="070">070</option>
				</select>
				- <input type="number" id="hp2" name="hp2" maxlength="4" placeholder="휴대폰 가운데 자리">
				- <input type="number" id="hp3" name="hp3" maxlength="4" placeholder="휴대폰 뒷자리">
				<input type="hidden" id="memberHp" name="memberHp" />
				</td>
			</tr>
			
			<tr>
				<td>지역</td> 
				<td>
				<select name="memberCity">
					<option value="서울">서울</option>
					<option value="부산">부산</option>
				</select>
				
				<select name="memberLocal">
					<option value="가산">가산</option>
					<option value="구로">구로</option>
				</select>
				</td>
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
			
			<tr align="center">
				<td colspan="2">
					<button type="button" id="btnUpdateMember" >회원정보수정</button>
					&nbsp;&nbsp;
					<button type="button" onclick="javascript:history.back();">취소</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>