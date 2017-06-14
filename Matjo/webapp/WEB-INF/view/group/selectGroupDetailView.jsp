<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>맛조::모임 상세보기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<link rel="stylesheet" href="/resources/assets/css/selectGroupDetailSub.css" type="text/css" />
                
        <!-- Floating side bar -->
        <script type="text/javascript" src="/js/group/groupApp.js"></script>
        <script type="text/javascript" src="/js/group/groupController.js"></script>
        
        <!-- jQuery 별점 모듈(Rate Yo!) -->
        <link rel="stylesheet" href="/resources/assets/css/jquery.rateyo.min.css">
        <script src="/js/common/jquery.rateyo.min.js"></script>
        
        <script type="text/javascript">
        $(function(){
        	
            var $win = $(window);
            var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.

            /*사용자 설정 값 시작*/
            var speed          = 500;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
            var easing         = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
            var $layer         = $('#sidebar'); // 레이어 셀렉팅
            var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
            $layer.css('position', 'relative').css('z-index', '1');
            /*사용자 설정 값 끝*/

            // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
            if (top > 0 )
                $win.scrollTop(layerTopOffset+top);
            else
                $win.scrollTop(0);

            //스크롤이벤트가 발생하면
            $(window).scroll(function(){
                yPosition = $win.scrollTop() - 150; //이부분을 조정해서 화면에 보이도록 맞추세요
                if (yPosition < 0)
                {
                    yPosition = 0;
                }
                $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
            });
            $(window).scroll(function() {
                $(this).scrollTop() < 1500 ? $("#sidebar").fadeIn() : $("#sidebar").fadeOut()
            });
            
            $("#rateYo").rateYo({
				rating : 4.5,
				halfStar: true,
				readOnly: true
			});
           
        });
        
        
        
        // 리뷰 상세보기 버튼
            function showhide(num) {  // 플래시 또는 html에서 오브젝트id값에 의한 호출
                var review_datail = null;
                if(num == 1){
                    review_detail = document.getElementById("review_detail1");  // 호출된 id값을 review_detail 변수로 치환
                } else if(num == 2) {
                    review_detail = document.getElementById("review_detail2");  // 호출된 id값을 review_detail 변수로 치환
                } else if(num == 3) {
                    review_detail = document.getElementById("review_detail3");  // 호출된 id값을 review_detail 변수로 치환
                }
                
                if ( review_detail.style.display != 'none' ) { // 만약 review_detail가 none이 아니면 즉, 보여지는 상태이면
                    review_detail.style.display = 'none';   // review_detail를 숨기고
                } else {
                    review_detail.style.display = 'block'; // 숨김 상태이면 나타내라
                }
        	}
        
        	// 모임원들 보기 창
        	function showMembers() {
        		var groupName = $("#sidebar_group_title").text();
        		window.open("/group/selectGroupMemberList.do?groupNo=${gBean.groupNo}&groupName="+groupName, "", 
				"top=200, left=100, width=750, height=450, directories=yes, location=no, resizable=no, status=yes, toolbar=no");
        	}
        </script>
        <style type="text/css">
        	.show_member {
        		text-decoration: none;
        		color:black;
        	}
        	.show_member:hover {
        		text-decoration: none;
        		color:white;
        		background-color: #FF3D00;
        	}
			/* #main .review_detail {
				display: none;
			} */
        </style>
	</head>
	<body class="left-sidebar" onload="init()">
	<div ng-modules="groupApp" ng-controller="GroupController" ng-init="selectGroupDetailProc(${gBean.groupNo})">
		<div id="page-wrapper">
		
			<!-- Header -->
				<div id="header">

					<!-- Inner -->
						<div class="inner">
						</div>
				</div>

			<!-- Main -->
				<div class="wrapper style1" lang="ko">

					<div class="container">
						<div class="row 200%">
							<div class="4u 12u(mobile)" id="sidebar">
								<hr class="first" />
								<section>
									<!-- 그룹 명 -->
                                    <span id="sidebar_group_title">{{ gBean.groupName }}</span>
                                    <br/>
                                    <!-- 그룹 구성원  -->
                                    <span id="sidebar_group_members">
                                    <a class="show_member" href="javascript:showMembers();">{{ gBean.groupLeader }}외{{ gBean.groupSize*1-1 }}명</a></span>
                                    <br/>
                                    <!-- 그룹 소개 -->
                                    <span id="sidebar_group_info">{{ gBean.groupInfo }}</span>
                                    <br/>
                                    <!-- 그룹 대표 이미지 -->
                                    <img ng-src="{{gBean.groupImg}}" id="sidebar_img" />
                                    <br/>
                                    <table>
                                        <tr>
                                            <th id="sidebar_table" class="sidebar_border_right">업소 방문 횟수</th>
                                            <th id="sidebar_table" class="sidebar_border_right">리뷰 갯수</th>
                                            <th id="sidebar_table">좋아요</th>
                                        </tr>
                                        
                                        <tr>
                                            <td id="sidebar_table" class="sidebar_border_right">17</td>
                                            <td id="sidebar_table" class="sidebar_border_right">14</td>
                                            <td id="sidebar_table">52</td>
                                        </tr>
                                    </table>
                                    <br/>
                                    <!-- 로그인한 상태에서만 구독하기 버튼이 보이도록 설정 -->
                                    <button class="subs" ng-show="gBean.hasSubsGroup == 'true' || gBean.hasSubsGroup == 'false'" id="subs" 
                                    	value="{{ gBean.hasSubsGroup }}" style="width:100% !important;" type="button" 
                                    	ng-click="subsGroupTry(gBean.hasSubsGroup)">
                                    	{{ gBean.hasSubsGroup == 'true' ? '구독 해제' : '구독' }}
                                    </button>
								</section>
								<hr />
								
							</div>
							<div class="8u 12u(mobile) important(mobile)" id="content">
								<article id="main">
									<!-- 리뷰 내용-->
									<section id="review" ng-repeat="review in reviewList track by $index">
										<table>
											<!-- 1행 -->
											<tr>
								                <td id="review_resta_img"><img src="/resources/images/resta_thumbnail.png" /></td>
								                <td colspan="2">
								                	<span id="review_resta_name">
								                		{{review.reviewRestaName}}<br/>
								                	</span>
								                	<br/>
								                	<span span id="review_resta_address">{{review.reviewRestaCate}}</span>
								                </td>
								                <td style="text-align: right; padding-right: 15px;"id="review_td_like">
									                <img id="review_like_img" src="/resources/images/heart_1.png">
									                <span id="review_like">37</span>
									                <br/>
									                <span>등록일시: {{review.reviewDate}}</span>
								                </td>
								            </tr>
		
											<!-- 2행 -->
											<tr>
												<td rowspan="4" id="review_avg_score">
													<span>평균 평점</span><br />
													<span><rate-yo rating="review.avgRating"></rate-yo></span>
													<span>{{review.avgRating == 'NaN'? '0.0' : review.avgRating}}</span>
												</td>
												<td colspan="3" id="review_content">(훌륭) 다음에 또와요</td>
		
											</tr>
		
											<!-- 3행 -->
											<tr>
												<td colspan="3" id="review_content">(보통) 먹을만 하네요</td>
											</tr>
		
											<!-- 4행 -->
											<tr>
												<td colspan="3" id="review_content">(별로) 다음에 다른데 가요</td>
											</tr>
				
										</table>
										
										<!-- 리뷰 상세 -->
										<div class="review_detail" ng-if="slideArr[$index] == 1" id="review_detail1">
											<table ng-repeat="pereview in review.pereviewList">
												<colgroup>
													<col width="10%">
													<col width="*">
													<col width="30%">
												</colgroup>
												<tr>
													<td id="review_detail_member_img">
														<img style="width:30px !important; height:30px !important;" 
															ng-src="{{ pereview.pereviewMemImg == 'null' || pereview.pereviewMemImg == null || pereview.pereviewMemImg == ''? '/resources/images/profile.png':'/upload/'+pereview.pereviewMemImg}}"/>
													</td>
													<td id="review_detail_member_name">
														<span style="font-weight: bold;">{{pereview.pereviewMemName}}</span>
													</td>
													
													<td>
														<rate-yo rating="pereview.pereviewRating"></rate-yo>{{pereview.pereviewRating}}
													</td>
												</tr>
												<tr>
													<td></td>
													<td colspan="2">
														<span>{{pereview.pereviewContent}}</span>
													</td>
												</tr>
												<tr>
													<td></td>
													<td colspan="2">
														<img style="width:50% !important; height:50% !important;" 
															ng-if="pereview.pereviewImgUrl != 'null' && pereview.pereviewImgUrl != null && pereview.pereviewImgUrl != ''" 
															ng-src="{{'/upload/'+pereview.pereviewImgUrl}}" />
													</td>
												</tr>
											</table>
										</div>
										<button ng-if="review.pereviewList.length > 0" class="smit" type="button" ng-click="setAccordian($index)">
											상세보기 {{slideArr.length}}
										</button>
									</section><!-- 리뷰 한개 아이템 마지막 -->
									
								</article>
							</div>
						</div>
						<hr />
						
					</div>

				</div>

		</div>
		</div>
	</body>
	
</html>