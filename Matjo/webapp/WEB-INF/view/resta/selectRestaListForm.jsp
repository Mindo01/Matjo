<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색화면</title>
<script type="text/javascript">
	var lat=0; var lng=0;
	
	var search = function() {
		if ($('#searchText').val() == '') return;
		getLoc();
		$.ajax({
			type : 'GET',
			url : '/resta/selectRestaListProc.do?searchText='
					+ $('#searchText').val(),
			/* data : $('#memberForm').serialize(), 이딴 건 넣으면 안된다  ',' 를 만나게 될 것이다.'*/
			dataType : 'json',
			success : function(data) {
				console.log(JSON.stringify(data));
				console.log(data.result);
				if (data.result == 'ok') {
					var list = data.list;
					$('#tableData').text('');
					$.each(list,
							function(i, poiBean) {
								/* [중요] 카테고리에 들어간 '>' 문자가 HTML append 에 영향을 미친다면 아래코드를 주석 제거해야한다. */
								/* var splitArr = poiBean.restaCate.split(' > ');
								poiBean.restaCate = '';
								for (var i=0; i<splitArr.length; i++) {
									poiBean.restaCate += splitArr[i];
								} */
								var str = "";
								str += '<tr>';
								str += '<td>' + poiBean.restaId
										+ '</td>';
								str += '<td>' + 
											'<img src="' + poiBean.restaImgUrl + '" style="width:100px;height:100px;"/>' + 
											'<a href="#" onclick="goDetailPage(\'' + poiBean.restaId + '\',\'' + poiBean.restaTitle + '\',\'' + poiBean.restaCate + '\',\'' + poiBean.restaAddr + '\',\'' + poiBean.restaImgUrl + '\',\'' + poiBean.restaLat + '\',\'' + poiBean.restaLng + '\',\'' + poiBean.restaUrl + '\',\'' + poiBean.restaPhone + '\')">' + 
												poiBean.restaTitle + 
											'</a>' + 
										'</td>';
								str += '<td>'+ poiBean.restaAddr
										+ '</td>';
								str += '<td>' + poiBean.restaCate
										+ '</td>';
								str += '</tr>';
								$('#tableData').append(str);
							});
				} else {
					console.log(data.resultMsg);
					alert(data.resultMsg);
				}
			},
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : "
						+ status + ", error : " + error);
			}
		});
	};
	
	$(function() {
		$("#btnSearch").click(search);
		getLoc();
		search();
	});
	
	/* 파라미터 이슈.. */
	/* var params = {a:1,b:2};
	var str = '<a href="#" onclick="doSomething('
    + JSON.stringify(params)
    + ')">aaaa</a>';
	document.write(str); */
	
	function goDetailPage(restaId, restaTitle, restaCate, restaAddr, restaImgUrl, restaLat, restaLng, restaUrl, restaPhone) {
		/* console.log(restaId + ", " + restaTitle + ", " + restaCate + ", " + restaAddr + ", " + restaImgUrl + ", " + restaLat + ", " + restaLng + ", " + restaUrl + ", " + restaPhone); */
		document.getElementById("restaId").value = restaId;
		document.getElementById("restaTitle").value = restaTitle;
		document.getElementById("restaCate").value = restaCate;
		document.getElementById("restaAddr").value = restaAddr;
		document.getElementById("restaImgUrl").value = restaImgUrl;
		document.getElementById("restaLat").value = restaLat;
		document.getElementById("restaLng").value = restaLng;
		document.getElementById("restaUrl").value = restaUrl;
		document.getElementById("restaPhone").value = restaPhone;
		
		console.log(document.getElementById("restaId").value);
		
		var sendForm = document.getElementById("sendForm");
		sendForm.action = "/resta/selectRestaForm.do";
		sendForm.method = "post";
		sendForm.submit();
	}
	
	function getLoc() {
		// HTML5의 geolocation을 사용할 수 있는지 확인한다. 
		if (navigator.geolocation) {
		    // GeoLocation을 이용해서 접속 위치를 얻어온다.
		    navigator.geolocation.getCurrentPosition(function(position) {
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		            console.log(lat + ', ' + lon); // 콘솔로 좌표 확인
		      });
		} else { // HTML5의 GeoLocation을 사용할 수 없을때
			// 처리
		}
	}
</script>
</head>
<body>
	<h1>검색 화면</h1>
	<table style="width: 80%;" border="1" cellspacing="0" cellpadding="5">
		<thead>
			<tr>
				<th width="10%">ID</th>
				<th width="40%">업소명</th>
				<th width="30">주소</th>
				<th width="20%">카테고리</th>
			</tr>
		</thead>
		<tbody id="tableData">
		</tbody>
	</table>
	<br />
	<form id="searchForm">
		<select>
			<option>전체</option>
			<option>명칭</option>
			<option>전화번호</option>
		</select> <input id="searchText" type="text" size="20" />
		<button id="btnSearch" type="button">검색</button>
	</form>
	
	<form id="sendForm" method="post" >
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

</body>
</html>









<!-- 
해결하지 못한 이슈..
jQuery 에서 each 문을 돌며 태그안에 값을 넣어 줄때..
예를들어 <a href="#" onclick="aaa(값)"/> 를 반복생성한다고 가정.
인자 값을 객체를 넣어줘야하지만 문제가있어
var obj = {a:1,b:2}; 와같은식으로 먼저 객체를만들고, JSON.stringify(obj) 와 같은 형식으로
json 문자열을 만들어 준뒤 이를 인자값으로 넣어줘여한다.
하지만 문제는 이과정에서. stringify 하는 value 값들 중에 공백이 발견되면 그 첫번째의 문자열 값만을 취하게되고,
첫번째문자열의 마지막글자뒤에 쌍따옴표가찍히며 html 해석이 뒤틀어지고 완전히 깨지게 화면에 표시되게 된다..
일단은 인자값으로필요한 모든 값들을 string으로 일일히 나열하여 파라미터로 보내지만 언젠가 꼭 확인해보자..
<script type="text/javascript">
	var lat=''; var lng='';
	$(function() {
		$("#btnSearch").click(
				function() {
					getLoc();
					$.ajax({
						type : 'GET',
						url : '/resta/selectRestaListProc.do?searchText='
								+ $('#searchText').val(),
						/* data : $('#memberForm').serialize(), 이딴 건 넣으면 안된다  ',' 를 만나게 될 것이다.'*/
						dataType : 'json',
						success : function(data) {
							console.log(JSON.stringify(data));
							console.log(data.result);
							if (data.result == 'ok') {
								var list = data.list;
								$('#tableData').text('');
								$.each(list,
										function(i, poiBean) {
											var params = {
												restaId: poiBean.restaId,
												restaTitle: poiBean.restaTitle
											};
											
											/* var splitArr = params.restaCate.split(" > ");
											console.log(splitArr);
											params.restaCate = '';
											for (var i=0; i<splitArr.length; i++) {
												params.restaCate += splitArr[i];
											} */
											
											var str = "";
											str += '<tr>';
											str += '<td>' + poiBean.restaId
													+ '</td>';
											str += '<td>' + 
														'<img src="' + poiBean.restaImgUrl + '" style="width:100px;height:100px;"/>' + 
														'<a href="#" onclick=goDetailPage(' + JSON.stringify(params, 2) + ')>' + 
															poiBean.restaTitle + 
														'</a>' + 
													'</td>';
											str += '<td>'+ poiBean.restaAddr
													+ '</td>';
											str += '<td>' + poiBean.restaCate
													+ '</td>';
											str += '</tr>';
											$('#tableData').append(str);
										});
							} else {
								alert(data.resultMsg);
							}
						},
						error : function(xhr, status, error) {
							console.log(xhr);
							HoldOn.close();
							alert("error\nxhr : " + xhr + ", status : "
									+ status + ", error : " + error);
						}
					});
				});
	});
	
	/* 파라미터 이슈.. */
	/* var params = {a:1,b:2};
	var str = '<a href="#" onclick="doSomething('
    + JSON.stringify(params)
    + ')">aaaa</a>';
	document.write(str); */
	
	function goDetailPage(params) {
		console.log(params);
	}
	
	function getLoc() {
		// HTML5의 geolocation을 사용할 수 있는지 확인한다. 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어온다.
		    navigator.geolocation.getCurrentPosition(function(position) {
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		            console.log(lat + ', ' + lon); // 콘솔로 좌표 확인
		      });
		} else { // HTML5의 GeoLocation을 사용할 수 없을때
			// 처리
		}
	}
</script>

해결했다...
'<a href="#" onclick="goDetailPage(\'' + poiBean.restaId + '\',\'' + poiBean.restaTitle + '\')">' + 
															poiBean.restaTitle + 
														'</a>' + 
 -->








