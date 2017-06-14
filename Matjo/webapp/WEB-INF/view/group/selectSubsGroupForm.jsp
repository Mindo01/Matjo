<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>맛조::모임 검색 결과</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
		<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
		<script type="text/javascript" src="/js/group/groupApp.js"></script>
		<script type="text/javascript" src="/js/group/groupController.js"></script>
	</head>
	<body class="no-sidebar">
	<div ng-modules="groupApp" ng-controller="GroupController" ng-init="selectSubsGroup()">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Inner -->
						<div class="inner">
						</div>

				</div>

			<!-- Main -->
				<div class="wrapper style1">

					<div class="container">
						<article id="main" class="special">
							<header>
								<h2 class="title_ko" lang="ko"><a href="#">내 구독 모임</a></h2>
							</header>
							<section>
                                 <div class="notice">
                                     <table>
                                         <colgroup>
                                             <col width="10%">
                                             <col width="*">
                                             <col width="20%">
                                         </colgroup>
                                         <tr>
                                             <th>번호</th>
                                             <th>모임명</th>
                                             <th>구독해제</th>
                                         </tr>
                                         <tr ng-repeat="grp in gList">
											<td>{{ grp.groupNo }}</td>
											<td><a style="cursor:pointer;" ng-click="selectGroupDetailView(grp.groupNo)">{{ grp.groupName }}</a></td>
											<td>
											<!-- 로그인한 상태에서만 구독하기 버튼이 보이도록 설정 -->
		                                    <button class="sch_smit" id="subs" 
		                                    	value="{{ grp.hasSubsGroup }}" style="width:100% !important;" type="button" 
		                                    	ng-click="deleteSubsGroupStrict(grp.groupNo)">
		                                    	구독 해제
		                                    </button>
                                    		</td>
										</tr>
                                     </table>
							     </div>
							</section>
						</article>
						<hr />
					</div>

				</div>

		</div>
		</div>

	</body>
</html>