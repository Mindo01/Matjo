<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <title>맛조::환영합니다! ^0^</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link rel="stylesheet" href="/resources/assets/css/daehee.css" />

    <link href="/resources/assets/css/jquery.bxslider.css" rel="stylesheet" />
        <!-- Scripts -->
    <script src="/js/common/jquery.bxslider.min.js"></script>
	
	<script type="text/javascript" src="/js/rank/rankApp.js"></script>
	<script type="text/javascript" src="/js/rank/rankController.js"></script>

    <script type="text/javascript" language="javascript">

    //이미지 미리보기 기능 구현
	    $(function() {
	        $("#imgFile").on('change', function(){
	            readURL(this);
	        });
	    });
	
	    function readURL(input) {
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	
	        reader.onload = function (e) {
	                $('#blah').attr('src', e.target.result);
	            }
	
	          reader.readAsDataURL(input.files[0]);
	        }
	    }

    
        var searchType = 0;
        $(document).ready(function() {
            $('.bxslider').bxSlider({
                auto: true,
                autoControls: true,
                pager: false
            });
			
            $("#searchToggle").click(function() {
                if (searchType == 0) {
                    $('#header').css('background', 'url(/resources/images/group_background.jpg)');
                    $('#searchType').text('모임 찾기');
                    $('#searchToggle').text('맛집 검색하기');
                    searchType = 1;
                } else {
                    $('#header').css('background', 'url(/resources/images/food_background.jpg)');
                    $('#searchType').text('맛집 찾기');
                    $('#searchToggle').text('모임 검색하기');
                    searchType = 0;
                }
            });
            
            $(".login").click(function() {
                $('div.modal').modal();
            });
        });
   		function insertPromotion() {
   			if("${sessionScope.memberLoginBean.memberId}"!=''){
				var promotionForm = document.getElementById("insertPromotion");
				promotionForm.method = "post";
				promotionForm.action = "/promotion/promotionInsertProcAjax.do";
				promotionForm.submit();
   			}else{
   				alert("로그인하신 후, 프로모션을 등록 해 주세요");
   				return;
   			}
   			
		}
		
    </script>
    <script type="text/javascript" src="/js/main/mainApp.js"></script>
	<script type="text/javascript" src="/js/main/mainController.js"></script>
</head>

<body class="homepage">
    <div id="page-wrapper" >
       	
       	<div class="homepage" id="searchArea" ng-modules="mainApp" ng-controller="MainController">
        <!-- Header -->
        <div id="header">
            <!-- Inner -->
            <div class="inner">
                <header>
                    <h1 id="searchType">맛집 찾기</h1>
                    <br/>
                    <div class="search_form">
                        <input id="searchText" type="text" style="" placeholder="검색어를 입력해주세요" ng-model="keyword" />
                        <button><a href="#banner" class="scrolly" ng-click="search()">찾기</a></button>
                    </div>
                    <hr/>
                    <p><a id="searchToggle" ng-click="changeType()">모임으로 검색하기 !</a></p>
                </header>
                <!--<div width="100">
                                <div class="input-group">
                                      <input type="text" class="form-control" width="100" placeholder="Search for...">
                                      <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">Go!</button>
                                      </span>
                                </div> /input-group 
                            </div>-->
                <!--<footer>
                    <a href="#banner" class="button circled scrolly">찾기</a>
                </footer>-->
            </div>


        </div>

        <!-- Banner -->
        <section id="banner">
            <header>
                <h2><strong ng-model="keyword">{{keyword}}</strong> 으로 검색한 결과입니다.</h2>
                <p>
                    이미지를 클릭하시면 상세내용을 확인할 수 있습니다.
                </p>
            </header>
        </section>

        <!-- Carousel -->
        <section class="carousel">
            <div class="reel" ng-model="resultList">

                <article ng-if="resultList[0].main != ''">
                    <a href="#" class="image featured"><img ng-src="{{resultList[0].img}}" ng-click="goDetailController(resultList[0])"/></a>
                    <header>
                        <h3><a href="#" ng-click="goDetailController(resultList[0])">{{resultList[0].main}}</a></h3>
                    </header>
                    <p>{{resultList[0].sub}}</p>
                </article>

                <article ng-if="resultList[1].main != ''">
                    <a href="#" class="image featured"><img ng-src="{{resultList[1].img}}" ng-click="goDetailController(resultList[1])"/></a>
                    <header>
                        <h3><a href="#" ng-click="goDetailController(resultList[1])">{{resultList[1].main}}</a></h3>
                    </header>
                    <p>{{resultList[1].sub}}</p>
                </article>

                <article ng-if="resultList[2].main != ''">
                    <a href="#" class="image featured"><img ng-src="{{resultList[2].img}}" ng-click="goDetailController(resultList[2])"/></a>
                    <header>
                        <h3><a href="#" ng-click="goDetailController(resultList[2])">{{resultList[2].main}}</a></h3>
                    </header>
                    <p>{{resultList[2].sub}}</p>
                </article>

                <!-- <article ng-if="resultList[3].main != ''">
                    <a href="#" class="image featured"><img ng-src="{{resultList[3].img}}" ng-click="goDetailController(resultList[3])"/></a>
                    <header>
                        <h3><a href="#" ng-click="goDetailController(resultList[3])">{{resultList[3].main}}</a></h3>
                    </header>
                    <p>{{resultList[3].sub}}</p>
                </article>

                <article ng-if="resultList[4].main != ''">
                    <a href="#" class="image featured"><img ng-src="{{resultList[4].img}}" ng-click="goDetailController(resultList[4])"/></a>
                    <header>
                        <h3><a href="#" ng-click="goDetailController(resultList[4])">{{resultList[4].main}}</a></h3>
                    </header>
                    <p>{{resultList[4].sub}}</p>
                </article>

                <article ng-if="resultList[5].main != ''">
                    <a href="#" class="image featured"><img ng-src="{{resultList[5].img}}" ng-click="goDetailController(resultList[5])"/></a>
                    <header>
                        <h3><a href="#" ng-click="goDetailController(resultList[5])">{{resultList[5].main}}</a></h3>
                    </header>
                    <p>{{resultList[5].sub}}</p>
                </article>

                <article ng-if="resultList[6].main != ''">
                    <a href="#" class="image featured"><img ng-src="{{resultList[6].img}}" ng-click="goDetailController(resultList[6])"/></a>
                    <header>
                        <h3><a href="#" ng-click="goDetailController(resultList[6])">{{resultList[6].main}}</a></h3>
                    </header>
                    <p>{{resultList[6].sub}}</p>
                </article>

                <article ng-if="resultList[7].main != ''">
                    <a href="#" class="image featured"><img ng-src="{{resultList[7].img}}" ng-click="goDetailController(resultList[7])"/></a>
                    <header>
                        <h3><a href="#" ng-click="goDetailController(resultList[7])">{{resultList[7].main}}</a></h3>
                    </header>
                    <p>{{resultList[7].sub}}</p>
                </article> -->
                
                <article>
                    <a href="#" class="image featured"><img src="/resources/images/icon_show_more.png" alt="" ng-click="addView()"/></a>
                    <header>
                        <h3><a href="#">더 보기</a></h3>
                    </header>
                    <p>&nbsp;</p>
                </article>
                
                <form id="sendForm" method="post">
					<input type="hidden" id="restaId" name="restaId"> 
					<input type="hidden" id="restaTitle" name="restaTitle">
					<input type="hidden" id="restaCate" name="restaCate"> 
					<input type="hidden" id="restaAddr" name="restaAddr"> 
					<input type="hidden" id="restaImgUrl" name="restaImgUrl">
					<input type="hidden" id="restaLat" name="restaLat">
					<input type="hidden" id="restaLng" name="restaLng">
					<input type="hidden" id="restaUrl" name="restaUrl">
					<input type="hidden" id="restaPhone" name="restaPhone">
				</form>
                
            </div>
        </section>
		</div>
        <div class="high_rank_div" ng-modules="rankApp" ng-controller="RankController" ng-init="selectRankProc()">
            <h1>상위 랭크</h1>
            <ul class="rank_area">
                <li class="rank_item_1">
                    <div class="rank_item_box">
                        <div class="rank_item_left" ng-model="ReviewRankList">
                            <img ng-src="ReviewRankList[0].groupImg" style="border-radius: 100%; width: 150px; height: 150px;" />
                            <p>{{ReviewRankList[0].groupName}}</p>
                            <strong>리뷰 수 : {{ReviewRankList[0].countGroupRank}} </strong>
                        </div>
                        <div class="rank_item_right">
                        {{ReviewRankList[0].groupInfo}}
                        </div>
                    </div>
                </li>
                <li class="rank_item_2">
                    <div class="rank_item_box">
                        <div class="rank_item_left">
                            <img src="/resources/images/item_image_02.jpg" style="border-radius: 100%; width: 150px; height: 150px;" />
                            <p>완전일등맛집</p>
                            <h3 class="rank_star">★ <strong>4.0</strong></h3>
                        </div>
                        <div class="rank_item_right">
                            	맛집 코멘트
                        </div>
                    </div>
                </li>

            </ul>
        </div>

        <!-- Footer -->
        <div id="footer">
            <div class="container">
                <div class="promo">

                    <h1>업소 프로모션을 신청하세요 !</h1>
                    <p>업주님이신가요? 맛조에 프로모션을 등록을 통해 효과적인 업소홍보가 가능합니다 !</p>
                    <br/><br/>
                    
                   <form id="insertPromotion" runat="server" enctype="multipart/form-data">
                    <div class="promo_form">
                        <div class="promo_form_left" >
                            <img src="resources/images/icon_default_image.png" id="blah" alt="your image" style="width:200px; height:200px;"/>
                            <input type="file" name="imgFile" id="imgFile"/>
                        </div>
                        <div class="promo_form_right">
                            <div class="promo_form_right_row1">
                                <p>업소명</p>
                                <input name = "promoResta" id="promoResta" type="text" class="form-control" placeholder="업소명을 입력해주세요" aria-describedby="basic-addon2" >
                            </div>
                            <br/>
                            <div class="promo_form_right_row2">
                                <p>내용</p>
                                <input name = "promoContent" id="promoContent" type="text" class="form-control" placeholder="내용을 입력해주세요 " aria-describedby="basic-addon2">
                            </div>
                            <br/>
                            <div class="promo_form_right_row3">
                            <div>
                             	<p>기간</p>
                             	시작날짜<input type="text" name="promoStart" id="promoStart" class="form-control" placeholder="ex)2017-05-20" aria-describedby="basic-addon2">
                             	종료날짜<input type="text" name="promoEnd" id="promoStart" class="form-control" placeholder="ex)2017-06-20" aria-describedby="basic-addon2">
                                <p>분류</p>
                              		  		<select id = "promoCate" name="promoCate" style="width:100px; padding:0px !important;">
                                                <option selected>카테고리 선택</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                            </select>
                                   </div>
										<br/><br/><br/><br/><br/><br/><br/>
										<br/>
										<button type="button" class="btn btn-default" onclick="insertPromotion();">신청하기</button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <br/>
            <br/>
            <hr/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
        </div>
    </div>

</body>

</html>