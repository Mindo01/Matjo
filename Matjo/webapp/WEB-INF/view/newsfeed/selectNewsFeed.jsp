<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>맛조::뉴스피드</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
		<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
		<script type="text/javascript" src="/js/news/newsApp.js"></script>
		<script type="text/javascript" src="/js/news/newsController.js"></script>
	</head>
	<body class="no-sidebar">
	<div ng-modules="newsApp" ng-controller="NewsController" ng-init="selectNewsFeedProc()">
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
								<h2 class="title_ko" lang="ko"><a href="#">뉴스피드</a></h2>
							</header>
							<section>
                                 <div class="notice">
                                     <table>
                                         <colgroup>
                                             <col width="10%">
                                             <col width="*">
                                             <col width="20%">
                                             <col width="20%">
                                             <col width="10%">
                                         </colgroup>
                                         <tr>
                                             <th>번호</th>
                                             <th>뉴스피드 메시지</th>
                                             <th>정보1</th>
                                             <th>정보2</th>
                                             <th>일시</th>
                                         </tr>
                                         <tr ng-repeat="nBean in newsFeedList">
                                         	<!-- 고유번호 : 모임번호 -->
											<td>{{ nBean.groupNo }}</td>
											<!-- 메시지 -->
											<td ng-if="nBean.type == 1">
												<a style="cursor:pointer;" ng-click="">
												{{ nBean.typeMsg }} 등록되었습니다.
												</a>
											</td>
											<td ng-if="nBean.type == 2">
												<a style="cursor:pointer;" ng-click="">
												[{{nBean.groupName}}]의 {{ nBean.typeMsg }} 등록되었습니다.
												</a>
											</td>
											<!-- 정보1 -->
											<td ng-if="nBean.type == 1">
												모임 [{{ nBean.groupName}}]
											</td>
											<td ng-if="nBean.type == 2">
												업소 [{{ nBean.restaName}}]
											</td>
											<!-- 정보2 -->
											<td ng-if="nBean.type == 1">
												모임장 {{nBean.groupLeader}}
											</td>
											<td ng-if="nBean.type == 2"></td>
											<!-- 일시 -->
											<td>{{ nBean.regDate }}</td>
										</tr>
                                     </table>
							     </div>
							</section>
						</article>
                        <!-- 페이지 -->
                        
                        
						<hr />
					</div>

				</div>

		</div>
		</div>

	</body>
</html>