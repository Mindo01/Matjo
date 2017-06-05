<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세정보</title>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=492681c0a9510ba0b05faa8fa5d8a6bb"></script>
<script type="text/javascript">
	var lat = ${dlBean.restaLat};
	var lng = ${dlBean.restaLng};
	var restaId = ${dlBean.restaId};
	console.log(restaId);
	var title = '${dlBean.restaTitle}';

	/* onReady 작성 */
	$(function() {
		viewMap();
		$.ajax({
			type : 'GET',
			url : '/resta/selectRestaProc.do?restaId=' + restaId,
			/* data : $('#memberForm').serialize(), 이딴 건 넣으면 안된다  ',' 를 만나게 될 것이다.'*/
			dataType : 'json',
			success : function(data) {
				console.log(JSON.stringify(data));
				console.log(data.result);
				if (data.result == 'ok') {
					var reviewList = data.reviewList;
					
					/* 모임리뷰 반복 */
					$.each(reviewList, function(i, reviewBean) {
						var str = "";
						str += "<br/>";
						str += "<div style='border: 1px solid #000; width: auto;'>";
							str += "[리뷰정보]";
							str += "<br/>모임리뷰 번호: " + reviewBean.reviewNo;
							str += "<br/>모임번호: " + reviewBean.reviewGroupNo;
							str += "<br/>음식점ID: " + reviewBean.reviewRestaNo;
							str += "<br/>음식점명: " + reviewBean.reviewRestaName;
							str += "<br/>음식점 카테고리: " + reviewBean.reviewRestaCate;
							str += "<br/>리뷰 공개 상태: " + reviewBean.reviewIsOpen;
							str += "<br/>";
						
						/* 개인리뷰 반복 */
						$.each(reviewBean.pereviewList, function(i, pereviewBean) {
							var obj = pereviewBean;
							str += "<br/>"
							str += "<div style='background-color: #00ffff; margin-left: 50px; width: auto;'>"
								str += "[개인리뷰]";
								str += "<br/>개인리뷰 번호: " + pereviewBean.pereviewNo;
								str += "<br/>회원 ID: " + pereviewBean.pereviewMemId;
								str += "<br/>모임리뷰 번호: " + pereviewBean.pereviewReviewNo;
								str += "<br/>내용: " + pereviewBean.pereviewContent;
								str += "<br/>등급: " + pereviewBean.pereviewRating;
								str += "<br/>이미지: " + pereviewBean.pereivewImgUrl;
							str += "</div>"
						});
						str += "</div>"						
						
						$('#reviews').append(str);
					});
				} else {
					/* alert(data.resultMsg); */
					console.log(data.resultMsg);
				}
			},
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : "
						+ status + ", error : " + error);
			}
		});
	});

	function viewMap() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도가 휠 드래그 포커스를 뺏는 것을 방지
		map.setZoomable(false)
		
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// 마커를 표시할 위치입니다 
		var position = new daum.maps.LatLng(lat, lng);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : position
		});

		// 마커를 지도에 표시합니다.
		marker.setMap(map);

		// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;">' + title + '</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			content : iwContent
		});

		/* 항상 노출되도록 변경 */
		infowindow.open(map, marker);
		
		
		
		/* // 마커에 마우스오버 이벤트를 등록합니다
		daum.maps.event.addListener(marker, 'mouseover', function() {
			// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
			infowindow.open(map, marker);
		});

		// 마커에 마우스아웃 이벤트를 등록합니다
		daum.maps.event.addListener(marker, 'mouseout', function() {
			// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
			infowindow.close();
		}); */
	}
</script>
</head>
<body>
	ID : ${dlBean.restaId}
	<br /> 음식점명 : ${dlBean.restaTitle}
	<br /> 카테고리 : ${dlBean.restaCate}
	<br /> 주소 : ${dlBean.restaAddr}
	<br /> 위도 : ${dlBean.restaLat}
	<br /> 경도 : ${dlBean.restaLng}
	<br /> 이미지 :
	<br />
	<img src="${dlBean.restaImgUrl}" />
	<br />
	<div id="map" style="width: 500px; height: 300px;"></div>
	홈페이지 주소 : <a target="blank" href="${dlBean.restaUrl}">${dlBean.restaUrl}</a>
	<br /> 연락처 : ${dlBean.restaPhone}
	<br/>
	<div id="reviews">
	</div>
</body>
</html>