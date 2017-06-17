<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>맛조::맛조-멤버</title>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
		<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
		<script type="text/javascript" src="/Example.Modal.js"></script>
	<style type="text/css">
		#imagesource:hover{
		    -webkit-transition: .3s ease-in-out;
		    transition: .3s ease-in-out;
		    -webkit-transform: scale(0.9);
		    transform: scale(0.9);
		}
		#modal {
			display:none;
			background-color:#FFFFFF;
			position:absolute;top:300px;
			left:200px;padding:10px;
			border:2px solid #E2E2E2;
			z-Index:9999
		}
	</style>
	<script type="text/javascript">
	 $(document).ready(function() {
			  $("#imagesource").click(function() {
		          $('div.modal').modal();
		      });
	 });
	</script>
</head>
<body class="no-sidebar">
			<!-- 모달창 -->
			<div id="modal">
			    <h3>Test Modal</h3>
			    <p>이 창은 모달창입니다.</p>
			    <button id="confirm_button">확인</button>
			    <button class="js_close">닫기</button>
			</div>
		<div id="page-wrapper">
		<!-- Header -->
				<div id="header">
					<!-- Inner -->
						<div class="inner"></div>
	</div>
	<!-- Main -->
				<div class="wrapper style1">
					<div class="container">
					<article id="main" class="special">
					<div style="border:5px solid #FF3300">
                                <h1 style="text-align: center; font-weight:bold; color:orange;"><img src= "/resources/images/logo.png"/>의 개발자들</h1>
						            <div id="introduce" style="text-align:center; margin-bottom: 50px;">
							             <h2 style="text-align: center; margin-bottom: 40px; font-weight:bold; color:orange;">멤버소개&nbsp;<img src= "/resources/images/l.png" ></h2><br/>
							            <img id = "imagesource" src= "/resources/images/minjuda.png" width="15%"height="25%" style="margin-bottom: 40px; margin-right: 20px;" />
							            <img id="imagesource" src= "/resources/images/deahee.png" width="15%"height="35%" style="margin-bottom: 40px; margin-right: 20px;" />
							            <img id="imagesource" src= "/resources/images/deahyoung.png" width="15%"height="35%" style="margin-bottom: 40px;  margin-right: 20px;" />
							            <img id="imagesource" src= "/resources/images/jihye2.png" width="15%"height="35%" style="margin-bottom: 40px;  margin-right: 20px;" />
<!-- 						            	 <div id="introduce" style="text-align:center; margin-bottom: 50px;"> -->
<!-- 								             <img src= "/resources/images/l.png" style="text-align: center; margin-bottom: 50px;"> -->
<!-- 						             	</div> -->
						             	<div>
						             		<img src= "/resources/images/memberlist.png" width="70%"height="70%" />	
						             </div>
                             </div>
                             </div>
						</article>
						<hr>
					</div>
					</div>
				</div>
	
</body>
</html>