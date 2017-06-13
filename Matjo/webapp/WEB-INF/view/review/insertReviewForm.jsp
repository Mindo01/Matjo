<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임리뷰 등록</title>
<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
<script>
	$(document).ready(function() {
		$('#btnInsert').click(function() {
			$.ajax({
				type : 'POST',
				url: '/review/insertReviewProc.do',
				data : $('#reviewForm').serialize(),
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
	진미통닭<br/>
	14083392<br/>
	음식점 > 치킨<br/><br/>
	만석닭강정 본점<br/>
	17362743<br/>
	음식점 > 치킨<br/><br/>
	8688860<br/>
	거인통닭<br/>
	음식점 > 치킨<br/><br/>
	<br/><br/><br/>
	
	<form id="reviewForm" method="post">
		모임번호 <input name="reviewGroupNo"/><br/>
		음식점번호 <input name="reviewRestaNo"/><br/>
		음식점이름 <input name="reviewRestaName"/><br/>
		카테고리 <input name="reviewRestaCate" value="음식점 > 치킨"/><br/>
	</form>
	<button type="button" id="btnInsert">등록</button>
	
</body>
</html>
