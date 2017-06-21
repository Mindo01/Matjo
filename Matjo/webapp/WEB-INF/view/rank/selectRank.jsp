<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>맛조::랭크보기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />

<script type="text/javascript" src="/js/rank/rankApp.js"></script>
<script type="text/javascript" src="/js/rank/rankController.js"></script>

</head>
<body class="no-sidebar">
		
		<div id="page-wrapper" ng-modules="rankApp" ng-controller="RankController" ng-init="selectRankProc();selectRestaRankProc();">
		
			<!-- Main -->
				<div class="wrapper style1">

					<div class="container">
						<article id="main" class="special">
							<header>
								<h2 class="title_ko" lang="ko"><a href="#">랭크보기</a></h2>
								<p lang="ko">
									각종 부문별/전체 랭크!!! 두구두구두구~☆
								</p>
							</header>
							<section>
                                <div id="tab_area">

                                <!-- 탭 기능을 위한 안보이는 라디오 버튼 -->
                                <input id="tab_group" type="radio" name="tab" checked="checked" />
                                <input id="tab_resta" type="radio" name="tab" />
                                <!-- 라벨 : 화면에 표시되는 탭 제목 -->
                                <label for="tab_group">모임</label>
                                <label for="tab_resta">맛집</label>
                                <!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->
                                <!-- 모임 탭버튼 클릭 시 화면 -->
                                <div class="tab_group_content">
                                  <h3>:■ 부문별 랭크</h3>
                                   <div class="rank_box_area">
                                    <article>
                                        <h4 class="rank_type" ng-click="changeList(1)">리뷰수</h4>
                                        <p class="ranker" ng-model="ReviewRankList"><a href="#">{{ReviewRankList[0].groupName}}</a></p>
                                    </article>
                                    <article>
                                        <h4 class="rank_type" ng-click="changeList(2)">참여율</h4>
                                        <p class="ranker" ng-model="ReviewRankList"><a href="#">{{ReviewRankList[0].groupName}}</a></p>
                                    </article>
                                    <article>
                                        <h4 class="rank_type" ng-click="changeList(3)">좋아요 수</h4>
                                        <p class="ranker" ng-model="LikeRankList"><a href="#">{{LikeRankList[0].groupName}}</a></p>
                                    </article>
                                    </div>
                                    <br/>
                                    <!-- 모임 전체랭킹 -->
                                    <h3>:■ 전체 랭크</h3>
                                    모임의 전체 랭크 - 달리기
                                    <br/>
                                    <div class="background" mg-model="DetailList">
                                       <div class="running_area" >
                                           <div class="running_man">
                                        <img ng-src="{{DetailList[0].groupImg}}"/>
                                            <p>{{DetailList[0].groupName}}</p>
                                           </div>
                                       </div>
                                       <div class="running_area">
                                           <div class="running_man">
                                        <img ng-src="{{DetailList[1].groupImg}}"/>
                                            <p>{{DetailList[1].groupName}}</p>
                                           </div>
                                       </div>
                                       <div class="running_area">
                                            <div class="running_man">
                                        <img ng-src="{{DetailList[2].groupImg}}"/>
                                            <p>{{DetailList[2].groupName}}</p>
                                           </div>
                                       </div>
                                    </div>
                                </div>
                                <!-- 맛집 탭버튼 클릭 시 화면 -->
                                <div class="tab_resta_content">
                                   <h3>:■ 부문별 랭크</h3>
                                    <div class="rank_box_area">
                                    <article>
                                        <h4 class="rank_type" ng-click="changeRestaList(1)">한식</h4>
                                        <p class="ranker" ng-model="KoreaRankList"><a href="#">{{KoreaRankList[0].restaTitle}}</a></p>
                                    </article>
                                    <article>
                                        <h4 class="rank_type" ng-click="changeRestaList(2)">중식</h4>
                                        <p class="ranker" ng-model="ChinaRankList"><a href="#">{{ChinaRankList[0].restaTitle}}</a></p>
                                    </article>
                                    <article>
                                        <h4 class="rank_type" ng-click="changeRestaList(3)">일식</h4>
                                        <p class="ranker" ng-model="JapanRankList"><a href="#">{{JapanRankList[0].restaTitle}}</a></p>
                                    </article>
                                    <article>
                                        <h4 class="rank_type" ng-click="changeRestaList(4)">양식</h4>
                                        <p class="ranker" ng-model="UsaRankList"><a href="#">{{UsaRankList[0].restaTitle}}</a></p>
                                    </article>
                                    <article>
                                        <h4 class="rank_type" ng-click="changeRestaList(5)">치킨</h4>
                                        <p class="ranker" ng-model="ChickenRankList"><a href="#">{{ChickenRankList[0].restaTitle}}</a></p>
                                    </article>
                                    </div>
                                    <br/>
                                     <!-- 맛집 전체 랭킹 -->
                                     <h3>:■ 전체 랭크</h3>
                                     맛집의 전체 랭크 - 달리기
                                     <br/>
                                    <div class="background" mg-model="DetailList">
                                       <div class="running_area">
                                           <div class="running_man">
                                        <img ng-src="{{DetailList[0].restaImg}}"/>
                                            <p>{{DetailList[0].restaTitle}}</p>
                                           </div>
                                       </div>
                                       <div class="running_area">
                                           <div class="running_man">
                                        <img ng-src="{{DetailList[1].restaImg}}"/>
                                            <p>{{DetailList[1].restaTitle}}</p>
                                           </div>
                                       </div>
                                       <div class="running_area">
                                            <div class="running_man">
                                        <img ng-src="{{DetailList[2].restaImg}}"/>
                                                <p>{{DetailList[2].restaTitle}}</p>
                                           </div>
                                       </div>
                                    </div>
                                </div>
                                 </div>
							</section>
						</article>
                       
						<hr />
					</div>

				</div>

		</div>

	</body>
</html>