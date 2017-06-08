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
            HoldOn.open();
            // AJAX 값 받아오기
            $.ajax({
				type: "post",
				url: "/group/selectGroupDetailProc.do",
				dataType: "json",
				data: {
					groupNo:"${gBean.groupNo}"
				},
				success: function(data) {
					printLog( data );
					HoldOn.close();
					
					if(data.result == "success") {
						alert(data.resultMsg);
						var gBean = data.gBean;
						// 화면 정보 수정
						$("#sidebar_group_title").html(gBean.groupName);
						$("#sidebar_group_info").html(gBean.groupInfo);
						var groupSize = gBean.groupSize;
						groupSize*=1;
						groupSize--;
						$("#sidebar_group_members").html("● "+gBean.groupLeader+" 외 "+groupSize+"명");
					} else {
						// 정보 조회 실패
						alert(data.resultMsg);
						// 뒤로가기
						history.back();
					}
					
				},
				error: function(xhr, status, error) {
					console.log(xhr);
					HoldOn.close();
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
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
        </script>
	</head>
	<body class="left-sidebar" onload="init()">
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
                                    <span id="sidebar_group_title">${ gBean.groupName }</span>
                                    <br/>
                                    <!-- 그룹 구성원  -->
                                    <span id="sidebar_group_members">${ gBean.groupLeader }외 ${ gBean.groupSize*1-1 }명</span>
                                    <br/>
                                    <!-- 그룹 소개 -->
                                    <span id="sidebar_group_info">${ gBean.groupInfo }</span>
                                    <br/>
                                    <!-- 그룹 대표 이미지 -->
                                    <img src="${ gBean.groupImg != null && gBean.groupImg != '' ? gBean.groupImg:'/resources/images/group_1.png'}" id="sidebar_img" />
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
								</section>
								<hr />
								
							</div>
							<div class="8u 12u(mobile) important(mobile)" id="content">
								<article id="main">
									<!-- 리뷰 내용-->
									<section id="review">
								        <table>
                                            <!-- 1행 -->
								            <tr>
								                <td id="review_resta_img"><img src="/resources/images/resta_thumbnail.png" /></td>
								                <td colspan="2"><span id="review_resta_name">철파니야 가산디지털단지점</span><br/>
								                <span span id="review_resta_address">서울시 금천구 벚꽃로 286</span></td>
								                <td id="review_td_like"><img id="review_like_img" src="/resources/images/heart_1.png">
								                <span id="review_like">37</span><br/>
								                <span>등록일시:2017년 5월 22일</span></td>
								            </tr>
								            
								            <!-- 2행 -->
								            <tr>
								                <td rowspan="4" id="review_avg_score">
								                    <span>평균 평점</span><br/>
								                    <span>★★★★☆</span><br/>
								                    <span>4.0</span>
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
								            
								            <!-- 5행 -->
								            <tr>
								                <td colspan="3" id="review_button">
								                    <button type="button" onclick="showhide(1);">상세보기</button>            
								                </td>
								                
								            </tr>
								        </table>
								        
								        <div class="review_detail" id="review_detail1"  style="display: none;">
								            <table>
								                <tr>
								                    <td id="review_detail_member_img"><img src="/resources/images/jihye.PNG"/></td>
                                                    <td id="review_detail_member_name"><span>지혜</span></td>
                                                    <td><span>맛있었어</span></td>
								                </tr>
								                
								                <tr>
                                                    <td ></td>
								                    <td colspan="2"><img src="/resources/images/food_1.jpg"/></td>
                                                </tr>
                                                
                                                <tr>
								                    <td id="review_detail_member_img"><img src="/resources/images/minju.PNG"/></td>
                                                    <td id="review_detail_member_name"><span>민주</span></td>
                                                    <td><span>괜찮았어</span></td>
								                </tr>
								                
								                <tr>
                                                    <td ></td>
								                    <td colspan="2"><img src="/resources/images/food_2.jpg"/></td>
                                                </tr>
                                                
                                                <tr>
								                    <td id="review_detail_member_img"><img src="/resources/images/daehee.PNG"/></td>
                                                    <td id="review_detail_member_name"><span>대히</span></td>
                                                    <td><span>다른데 가자</span></td>
								                </tr>
								                
								                <tr>
                                                    <td ></td>
								                    <td colspan="2"><img src="/resources/images/food_3.jpg"/></td>
                                                </tr>
								            </table>
								        </div>
									</section>
									
									<section id="review">
								        <table>
                                            <!-- 1행 -->
								            <tr>
								                <td id="review_resta_img"><img src="/resources/images/resta_thumbnail.png" /></td>
								                <td colspan="2"><span id="review_resta_name">철파니야 가산디지털단지점</span><br/>
								                <span span id="review_resta_address">서울시 금천구 벚꽃로 286</span></td>
								                <td id="review_td_like"><img id="review_like_img" src="/resources/images/heart_1.png">
								                <span id="review_like">37</span><br/>
								                <span>등록일시:2017년 5월 22일</span></td>
								            </tr>
								            
								            <!-- 2행 -->
								            <tr>
								                <td rowspan="4" id="review_avg_score">
								                    <span>평균 평점</span><br/>
								                    <span>★★★★☆</span><br/>
								                    <span>4.0</span>
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
								            
								            <!-- 5행 -->
								            <tr>
								                <td colspan="3" id="review_button">
								                    <button type="button" onclick="showhide(2);">상세보기</button>            
								                </td>
								                
								            </tr>
								        </table>
								        
								        <div class="review_detail" id="review_detail2"  style="display: none;">
								            <table>
								                <tr>
								                    <td id="review_detail_member_img"><img src="/resources/images/jihye.PNG"/></td>
                                                    <td id="review_detail_member_name"><span>지혜</span></td>
                                                    <td><span>맛있었어</span></td>
								                </tr>
								                
								                <tr>
                                                    <td ></td>
								                    <td colspan="2"><img src="/resources/images/food_1.jpg"/></td>
                                                </tr>
                                                
                                                <tr>
								                    <td id="review_detail_member_img"><img src="/resources/images/minju.PNG"/></td>
                                                    <td id="review_detail_member_name"><span>민주</span></td>
                                                    <td><span>괜찮았어</span></td>
								                </tr>
								                
								                <tr>
                                                    <td ></td>
								                    <td colspan="2"><img src="/resources/images/food_2.jpg"/></td>
                                                </tr>
                                                
                                                <tr>
								                    <td id="review_detail_member_img"><img src="/resources/images/daehee.PNG"/></td>
                                                    <td id="review_detail_member_name"><span>대히</span></td>
                                                    <td><span>다른데 가자</span></td>
								                </tr>
								                
								                <tr>
                                                    <td ></td>
								                    <td colspan="2"><img src="/resources/images/food_3.jpg"/></td>
                                                </tr>
								            </table>
								        </div>
									</section>
									
									<section id="review">
								        <table>
                                            <!-- 1행 -->
								            <tr>
								                <td id="review_resta_img"><img src="/resources/images/resta_thumbnail.png" /></td>
								                <td colspan="2"><span id="review_resta_name">철파니야 가산디지털단지점</span><br/>
								                <span span id="review_resta_address">서울시 금천구 벚꽃로 286</span></td>
								                <td id="review_td_like"><img id="review_like_img" src="/resources/images/heart_1.png">
								                <span id="review_like">37</span><br/>
								                <span>등록일시:2017년 5월 22일</span></td>
								            </tr>
								            
								            <!-- 2행 -->
								            <tr>
								                <td rowspan="4" id="review_avg_score">
								                    <span>평균 평점</span><br/>
								                    <span>★★★★☆</span><br/>
								                    <span>4.0</span>
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
								            
								            <!-- 5행 -->
								            <tr>
								                <td colspan="3" id="review_button">
								                    <button type="button" onclick="showhide(3);">상세보기</button>            
								                </td>
								                
								            </tr>
								        </table>
								        
								        <div class="review_detail" id="review_detail3"  style="display: none;">
								            <table>
								                <tr>
								                    <td id="review_detail_member_img"><img src="/resources/images/jihye.PNG"/></td>
                                                    <td id="review_detail_member_name"><span>지혜</span></td>
                                                    <td><span>맛있었어</span></td>
								                </tr>
								                
								                <tr>
                                                    <td ></td>
								                    <td colspan="2"><img src="/resources/images/food_1.jpg"/></td>
                                                </tr>
                                                
                                                <tr>
								                    <td id="review_detail_member_img"><img src="/resources/images/minju.PNG"/></td>
                                                    <td id="review_detail_member_name"><span>민주</span></td>
                                                    <td><span>괜찮았어</span></td>
								                </tr>
								                
								                <tr>
                                                    <td ></td>
								                    <td colspan="2"><img src="/resources/images/food_2.jpg"/></td>
                                                </tr>
                                                
                                                <tr>
								                    <td id="review_detail_member_img"><img src="/resources/images/daehee.PNG"/></td>
                                                    <td id="review_detail_member_name"><span>대히</span></td>
                                                    <td><span>다른데 가자</span></td>
								                </tr>
								                
								                <tr>
                                                    <td ></td>
								                    <td colspan="2"><img src="/resources/images/food_3.jpg"/></td>
                                                </tr>
								            </table>
								        </div>
									</section>
								</article>
							</div>
						</div>
						<hr />
						
					</div>

				</div>

		</div>
	</body>
	
</html>