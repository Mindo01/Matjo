<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>

<html lang="ko">
	<head>
		<title>맛조::프로모션 리스트</title>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
		<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
		
		<link rel="stylesheet" href="/resources/assets/css/jihye.css" />
		<script type="text/javascript">
// 		$(function() {
// 			var myElem3 = document.getElementById('deletePromotionButton');
// 			if("${sessionScope.memberLoginBean.memberId}" == "admin@." ){
// 				myElem3.style.visibility="visible";
// 			}else{
// 				myElem3.style.visibility="hidden";
// 			}
// 			});
		function deletePromo(promoNo){
			if("${sessionScope.memberLoginBean.memberId}" == "admin@."){
					if (confirm("정말 삭제하시겠습니까??") == true){//확인
							deletePromo2(promoNo);
				 		}else{
				 			return;
				 		}
					
					}
		};

		function deletePromo2(promoNo){
			$.ajax({
				type: "post",
				url: "/promotion/deletePromoProc.do",
				data: { 
					promoNo: promoNo
				},
				dataType: "json",
				success: function(data) {
					console.log(data);
					if(data.result == "ok") {
						alert("삭제되었습니다");
						location.replace("/promotion/selectPromo.do");
					} else {
						alert(data.resultMsg);
					}
					
				},
				error: function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
			});
		};
		</script>
	</head>
	<body class="no-sidebar">
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
								<h2 class="title_ko" lang="ko"><a href="#">프로모션</a></h2>
								<p lang="ko">
									각종 맛집에서 제공하는 혜택들! 확인하고 가세요 ^0^
								</p>
							</header>
                        </article>
<!--                         style="visibility:hidden;" -->
<!--                         	 <div id="deletePromotionButton"> -->
<!--                                         <button type="button" class="sch_smit" onclick="deletePromo();">삭제</button> -->
<!--                                </div> -->
                  	<div id="promo" >
                        <div class="promotion_row" >
                        <c:forEach var="bean" items="${promotionList}" varStatus="status">
                         <div id="promoclick1"  onclick="deletePromo(${bean.promoNo})">
                         <img src= "/upload/${bean.promoImg}" width="25%"height="35%" id="restaimage"/>
                           <h6 id="text1">업소명:&nbsp;${bean.promoResta}</h6>
                           <p id="text2"> 
                           		내용:&nbsp;${bean.promoContent}<br/>
                           		날짜:&nbsp;${bean.promoStart}<br/>
                           		&ensp;&emsp;&nbsp;~${bean.promoEnd}<br/>
                            </p>
                        </div>
                        </c:forEach>
                        </div>
                        </div>
                    </div>
            </div>
		</div>
	</body>
</html>