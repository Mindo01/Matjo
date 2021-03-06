<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 가입 신청 화면</title>
<link href="/resources/assets/css/mj-custom.css" rel="stylesheet" type="text/css"/>
<link href="/resources/assets/css/mj-responsive.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		input {
			width:73% !important;
			display: inline-block !important;
		}
		button {
			width:25% !important;
			display: inline-block !important;
		}
	</style>
	<script type="text/javascript" src="/js/group/groupApp.js"></script>
		<script type="text/javascript" src="/js/group/groupController.js"></script>
</head>
<body class="no-sidebar">
<div ng-modules="groupApp" ng-controller="GroupController">
<div id="page-wrapper">

<!-- Main -->
	<div class="wrapper style1">
		<div class="container">
			<article id="main" class="special">
				<header>
				<h2 class="title_ko" lang="ko">
				<a href="#">모임 검색</a>
				</h2>
				<p lang="ko">
				가입을 원하는 모임을 검색하세요!
				</p>
				</header>
			</article>
			<div class="notice">
				<form name="formData" method="get">
			        <input type="text" name="searchGroup" ng-model="pBean.searchText"/>
			        <button class="sch_smit" type="button" ng-click="selectGroupToApply()">확인</button>
			    </form>
			</div>
			<section>
                  <div class="notice">
                      <table>
                          <colgroup>
                              <col width="*">
                          </colgroup>
                          <tr>
                              <th>모임명</th>
                          </tr>
                          <tr ng-if="searchText != ''" ng-repeat="grp in gList">
								<td><a style="cursor:pointer;" ng-click="sendSelectedGroup(grp)">{{ grp.groupName }}</a></td>
						  </tr>
                      </table>
			     </div>
			</section>
		</div>
	</div>
</div>
</div>
</body>
</html>