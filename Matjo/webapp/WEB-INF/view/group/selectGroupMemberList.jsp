<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 소속 회원 목록</title>
<link href="/resources/assets/css/mj-custom.css" rel="stylesheet" type="text/css"/>
<link href="/resources/assets/css/mj-responsive.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		img.member_small_profile {
			width:30px !important;
			height:30px !important;
		}
	</style>
	<script type="text/javascript" src="/js/group/groupApp.js"></script>
	<script type="text/javascript" src="/js/group/groupController.js"></script>
</head>
<body class="no-sidebar">
<div ng-modules="groupApp" ng-controller="GroupController" ng-init="selectGroupMemberProc(${ gBean.groupNo })">
<div id="page-wrapper">

<!-- Main -->
	<div class="wrapper style1">
		<div class="container">
			<article id="main" class="special">
				<header>
				<h2 class="title_ko" lang="ko">
				<a href="#">[${ gBean.groupName }] 회원 목록</a>
				</h2>
				</header>
			</article>
			<section>
                  <div class="notice" style="width:60%; text-align:center;">
                      <table>
                          <colgroup>
                              <col width="30%">
                              <col width="*">
                              <col width="20%">
                          </colgroup>
                          <tr ng-if="searchText != ''" ng-repeat="mem in memberList track by $index">
								<td><img class="member_small_profile" 
									ng-src="{{ mem.memberImg == 'null' || mem.memberImg == null || mem.memberImg == ''? '/resources/images/profile.png':'/upload/'+mem.memberImg}}"/></td>
								<td>{{ mem.memberName }}</td>
								<td><span ng-if="$index == 0">모임장</span></td>
						  </tr>
						  <tr>
                      </table>
                      <button type="button" style="width:70% !important;" class="sch_smit" onclick="javascript:window.close();">닫기</button>
			     </div>
			</section>
		</div>
	</div>
</div>
</div>
</body>
</html>