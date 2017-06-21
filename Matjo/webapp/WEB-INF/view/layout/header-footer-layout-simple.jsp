<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><decorator:title default="맛조" /></title>
<script type="text/javascript" src="/js/common/angular/angular.js"></script>
<script type="text/javascript" src="/js/common/angular/angular.ng-modules.js"></script>
<script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>
<script type="text/javascript" src="/js/member/memberApp.js"></script>
<script type="text/javascript" src="/js/member/memberController.js"></script>
<c:import url="/WEB-INF/view/layout/header.jsp"></c:import>
<script type="text/javascript">
	//모바일창 빈 네비메뉴 없애기
	$(function() {
		$('#navButton, #navPanel').css('display', 'none');
	});
</script>
<decorator:head />
</head>
<body class="no-sidebar">

			<!-- 내용 -->
			<decorator:body />
		
		<!-- 공통 푸터 -->
		<div id="footer">
				<!-- Copyright -->
				<div class="copyright">
					<ul class="menu">
						<li>&copy; Matjo 2017 05. All rights reserved.</li>
						<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>
