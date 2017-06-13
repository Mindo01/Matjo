<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>맛조::맛집 상세보기</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!-- <script src="../assets/js/jquery.min.js"></script> -->
<link rel="stylesheet" href="/resources/assets/css/selectRestaDetailSub.css"
	type="text/css" />

<script type="text/javascript" src="/js/resta/restaApp.js"></script>
<script type="text/javascript" src="/js/resta/restaController.js"></script>
<script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>

<!-- jQuery 별점 모듈(Rate Yo!) -->
<link rel="stylesheet" href="/resources/assets/css/jquery.rateyo.min.css">
<script src="/js/common/jquery.rateyo.min.js"></script>

<!-- Floting side bar -->
<script>
        $(function(){
            var width_size = window.outerWidth;
            if (width_size <= 800) {
                return;
            }
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
                yPosition = $win.scrollTop() - 400; //이부분을 조정해서 화면에 보이도록 맞추세요
                if (yPosition < 0)
                {
                    yPosition = 0;
                }
                $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
            });
            
		
			$("#rateYo").rateYo({
				rating : 4.5,
				halfStar: true,
				readOnly: true
			});
		});
</script>

<!-- side bar 제거 옵션-->
<script>
	$(document).ready(function() {
	    $(window).scroll(function() {
	        $(this).scrollTop() < 1500 ? $("#sidebar").fadeIn() : $("#sidebar").fadeOut()
	    });
	    $(".login").click(function() {
	        $('div.modal').modal();
	    });
	    
	});
</script>

<style type="text/css">
	#main .review_detail {
		display: none;
	}
</style>

</head>
<body class="left-sidebar" onload="init()">
	<div id="page-wrapper" ng-modules="restaApp" ng-controller="RestaController" ng-init="selectRestaProc('${dlBean.restaId}')">
		<!-- Main -->
		<div class="wrapper style1" lang="ko">
			<div class="container">
				<div class="row 200%">
					<div class="4u 12u(mobile)" id="sidebar" lang="ko">
						<hr class="first" />
						
						<!-- 좌측 업소정보 -->
						<section>
							<!-- 업소 명 -->
							<span id="sidebar_resta_title" >${dlBean.restaTitle }</span> <br />
							<!-- 업소 한줄 설명 -->
							<span id="sidebar_resta_info">까르보나라 치킨과 시원한 맥주</span> <br /><!-- 업소설명 제공안됨. 사용불가 예상 -->
							
							
							<!-- 업소 평점-->
							<span id="sidebar_resta_score">
							<div>
								<div id="rateYo"></div>
								&nbsp;4.5
							</div>
							</span> 
							<br/> 
							<!-- 업소 대표 이미지 -->
							<!-- TODO 지우자 -->
							<img width="200px" height="200px" src="${dlBean.restaImgUrl}" class="resta_detail_img" /><br/>
							<!-- 업소 연락처 -->
							<span>${dlBean.restaPhone }</span> <br/>
							<!-- 업소 홈페이지 -->
							<span><a href="${dlBean.restaUrl}">${dlBean.restaUrl}</a></span>
							<br />
							<!-- 업소 주소 -->
							<span id="sidebar_resta_address">${dlBean.restaAddr}</span> <br/>
							<!-- 업소 지도 -->
							<div id="map_div"></div>
						</section>
						<hr />
					</div>
					<div class="8u 12u(mobile) important(mobile)" id="content">
						<article id="main">
							<!-- 리뷰 내용-->
							<section id="review" ng-repeat="review in reviewList">
								<table>
									<!-- 1행 -->
									<tr>
										<td id="review_group_img"><img src="/resources/images/group.PNG" /></td>
										<td colspan="2">
											<span id="review_group_name">
												{{review.reviewGroupName}}<br/>
											</span>
											<br /> 
											<span id="review_group_write">04명의 인원이 함께 작성하였습니다.</span>
										</td>
										<td id="review_td_like"><img id="review_like_img"
											src="images/heart_1.png"> <span id="review_like">37</span><br />
											<span>등록일시:2017년 5월 22일</span></td>
									</tr>

									<!-- 2행 -->
									<tr>
										<td rowspan="4" id="review_avg_score">
											<span>평균 평점</span><br />
											<span><rate-yo rating="review.avgRating"></rate-yo></span>
											<span>{{review.avgRating}}</span>
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
								<div class="review_detail" id="review_detail1">
									<table ng-repeat="pereview in review.pereviewList">
										<tr>
											<td id="review_detail_member_img">
												<img src="pereview.pereviewImgUrl" />
											</td>
											<td id="review_detail_member_name">
												<span>{{pereview.pereviewMemId}}</span>
											</td>
											<td>
												<span>{{pereview.pereviewContent}}</span>
											</td>
											<td>
												<rate-yo rating="pereview.pereviewRating"></rate-yo>{{pereview.pereviewRating}}
											</td>
										</tr>
										<tr>
											<td></td>
											<td colspan="2"><img src="pereview.pereviewImgUrl" /></td>
										</tr>
									</table>
								</div>
								<button type="button" ng-click="doAccordian()">상세보기</button>
							</section><!-- 리뷰 한개 아이템 마지막 -->
							
						</article>
					</div>
				</div>
				<hr />

			</div>

		</div>
	</div>
</body>
</html>