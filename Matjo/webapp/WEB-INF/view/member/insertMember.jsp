<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
<script type="text/javascript">
		$(function() {
			
			// 주소 조회
			$.ajax({
				type: "post",
				url: "/searchAddressCityProc.do",
				dataType: "json",
				success: function(data) {
					console.log(data);
					HoldOn.close();
					$.each(data.list, function(i, list) {
						var str = "";
						
						str +=	"<option value='"+list.name+"'>"+list.name+"</option>"
						
						$("#memberCity").append(str);
					
					});
				},
				error: function(xhr, status, error) {
					HoldOn.close();
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
			});
			$("#memberCity").change(function() {
				$("#memberLocal").remove();
				var local = "";
				local += "<select id='memberLocal' name='memberLocal'>"
				local += "</select>"
				$("#divLocal").append(local);
				$.ajax({
					type: "post",
					url: "/searchAddressLocalProc.do",
					data: $("#memberForm").serialize(),
					dataType: "json",
					success: function(data) {
						console.log(data);
						HoldOn.close();
						$.each(data.list, function(i, list) {
							var str = "";
							
							str +=	"<option value='"+list.name+"'>"+list.name+"</option>"
							
							$("#memberLocal").append(str);
							
						});
					},
					error: function(xhr, status, error) {
						HoldOn.close();
						console.log(xhr);
						alert("error\nxhr : " + xhr + ", status : " 
								+ status + ", error : " + error);      
					}
				});
			});
			
			$("#btnInsertMember").click(function() {
		    	//휴대폰 번호 결합
				var memberHp = $("#hp1").val() + "-" + $("#hp2").val() + "-" + $("#hp3").val();
		    	$("#memberHp").val(memberHp);
							    	  
		        $.ajax({
		            type:"POST",
		            url:"/member/insertMemberProc.do",
		            data: $("#memberForm").serialize(),
		            dataType:'json',
		            success:function(data) {
				        if(data.result == "success"){
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

	<h1 align="center">회원가입</h1>
	
	<form id="memberForm">
		<table align="center" border="1" cellspacing="0" cellpadding="10">
		
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" maxlength="13" required /></td>
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
				<div id="divLocal">
					<select id="memberCity" name="memberCity">
					</select>
				
					<select id="memberLocal" name="memberLocal">
					</select>
				</div>
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
			
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnInsertMember">회원가입하기</button> &nbsp;&nbsp;
					<button type="button" onclick="javascript:history.back();">취소</button>
				</td>
			</tr>
		</table>
	</form>
	<br>

</body>
</html>