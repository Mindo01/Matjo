<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인리뷰 등록</title>
<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
<script>
	$(document).ready(function() {
		$('#btnInsert').click(function() {
			$.ajax({
				type : 'POST',
				url: '/review/insertPereviewProc.do',
				data : $('#pereviewForm').serialize(),
				dataType : 'json',
				success : function(data) {
					console.log(data);
					if (data.result == 'ok') {
						alert(data.resultMsg);
						return;
					} else {
						alert(data.resultMsg);
					}
				},
				error : function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
				}
			});
		});
	});
</script>
</head>
<body>
	<br/><br/><br/><br/><br/>
	
	<form id="pereviewForm" method="post">
		회원번호 <input name="pereviewMemId"/><br/>
		모임리뷰번호 <input name="pereviewReviewNo"/><br/>
		리뷰내용 <input name="pereviewContent"/><br/>
		평점 <input name="pereviewRating" value="3.5"/><br/>
	</form>
	<button type="button" id="btnInsert">등록</button>
	
</body>
</html>
	
	
	
	
	
	
