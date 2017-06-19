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
		<script type="text/javascript" src="/js/group/groupApp.js"></script>
		<script type="text/javascript" src="/js/group/groupController.js"></script>
	</head>
	<body class="no-sidebar">
	<div ng-modules="groupApp" ng-controller="GroupController" ng-init="initValues('${param.searchText}')">
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
                                             <col width="20%">
                                             <col width="*">
                                             <col width="10%">
                                             <col width="10%">
                                             <col width="8%">
                                         </colgroup>
                                         <tr>
                                             <th>번호</th>
                                             <th>모임명</th>
                                             <th>모임소개</th>
                                             <th>모임장</th>
                                             <th>인원수</th>
                                         </tr>
                                         <tr ng-repeat="grp in gList">
											<td>{{ grp.groupNo }}</td>
											<td>{{ grp.groupName }}</td>
											<td><a style="cursor:pointer;" ng-click="selectGroupDetailView(grp.groupNo)">{{ grp.groupInfo }}</a></td>
											<td>{{ grp.groupLeader }}</td>
											<td>{{ grp.groupSize }}</td>
										</tr>
                                     </table>
							     </div>
							</section>
						</article>
                        <!-- 페이지 -->
                        <div class="paging">
                            <div class="paging_number">
                                <span ng-if="pBean.groupNo > 1">
									<a ng-if="pBean.groupNo > 1" ng-click="selectGroupList(pBean.startNo-1)">&lt; 이전 </a>
								</span>
								<span ng-repeat="n in [].constructor(pBean.totalPageCount) track by $index">
									<a style="cursor:pointer;" ng-click="selectGroupList($index+1)" >
									[{{ $index + 1 }}]
									</a>
									&nbsp;
								</span>
								<span>
									<a ng-if="pBean.groupNo < pBean.totalGroupCount" ng-click="selectGroupList(pBean.endNo+1)">다음 &gt;</a>
								</span>
                            </div>
                        </div>
                        
						<hr />
					</div>

				</div>

		</div>
		</div>

	</body>
</html>