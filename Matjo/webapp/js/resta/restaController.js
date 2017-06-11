'use strict';

restaApp.controller('RestaController', RestaController);

RestaController.$inject = ['$rootScope', '$scope', 'RestaService'];

function RestaController($rootScope, $scope, RestaService) {

	// DaumLocalBean 빈객체 생성
	$scope.daumLocalBean = {
			// Default Value 정의
	};

	// 페이징빈 빈객체 생성
	$scope.pagingBean = {
			pageNo: 1,
			location: null,
			radius: 0
	};


	// 음식점 목록을 조회한다.
	$scope.selectRestaListProc = function() {
		console.log($scope.pagingBean);
		console.log($scope.searchType);
		
		if ($scope.pagingBean == undefined) {
			$scope.pagingBean = {
				pageNo: 1
			}; // new Object();
		}

		// 검색 필터가 위치기반 검색일 경우 위치값 받아오기
		if ($scope.searchType == "location") {
			
			// HTML5의 geolocation을 사용할 수 있는지 확인한다. 
			if (navigator.geolocation) {
				// GeoLocation을 이용해서 접속 위치를 얻어온다.
				navigator.geolocation.getCurrentPosition(function(position) {
					// 성공시 처리
					var lat = position.coords.latitude; // 위도
					var lon = position.coords.longitude; // 경도
					console.log(lat + ',' + lon); // 콘솔로 좌표 확인

					$scope.pagingBean.location = lat + ',' + lon; // pagingBean 에 주입 
					
					/**
					 * 위치를 받아오는 건 콜백이다 따라서 이하코드가 이 위치로부터 벗어나면 위치값이 누락되는 경우가 생긴다.
					 */
					RestaService.selectRestaListProc($scope.pagingBean).then(function(data) {
						/*console.log( JSON.stringify(data) );
						console.log(data);*/
						console.log( data.resultMsg );
						$scope.restaList = data.list;
						$scope.pagingBean = data.pagingBean;
						
						document.getElementById("textKeyword").innerHTML = $scope.pagingBean.searchText + '에 대한 검색 결과입니다'; 
					});
				},
				function errorControl() {
					// 에러시 처리
				},
				{timeout:10000});
				/*navigator.geolocation.getCurrentPosition(function(position) {
					var lat = position.coords.latitude; // 위도
					var lon = position.coords.longitude; // 경도
					console.log(lat + ',' + lon); // 콘솔로 좌표 확인

					$scope.pagingBean.location = lat + ',' + lon; // pagingBean 에 주입 
				});*/
			} else { // HTML5의 GeoLocation을 사용할 수 없을때
				// 처리
			}

		} // end of if
		else{ // 위치기반X, 일반검색일경우
			// 동일 로직 수행
			RestaService.selectRestaListProc($scope.pagingBean).then(function(data) {
				/*console.log( JSON.stringify(data) );
				console.log(data);*/
				console.log( data.resultMsg );
				$scope.restaList = data.list;
				$scope.pagingBean = data.pagingBean;
				
				document.getElementById("textKeyword").innerHTML = $scope.pagingBean.searchText + '에 대한 검색 결과입니다'; 
			});
		}
		
	};

	// 더보기 클릭시 아이템 추가 (단위: API 의 Default Value ==> 15)
	$scope.addRestaItem = function() {
		if ($scope.pagingBean != undefined) {
			if ($scope.pagingBean.pageNo <= 2) {
				$scope.pagingBean.pageNo += 1;
			} else { // API 가 제공하는 최대 페이지는 3페이지임
				alert("마지막 페이지입니다.");
				return;
			}
		}
		RestaService.selectRestaListProc($scope.pagingBean).then(function(data) {
			console.log(data);
			angular.forEach(data.list, function(restaItem) {
				$scope.restaList.push(restaItem);
			});
		});
	};

	$scope.goDetailPage = function(dlBean) {
		console.log(JSON.stringify(dlBean));
//		RestaService.selectRestaForm(dlBean).then(function(data) {
//			console.log(data); // 이렇게 작성하면 화면이동을 하지않고 결과내용을 받아와 버린다..
//		});
		
		// 해결 ==> 폼객체 만들고
		// 폼객체에 dlBean안에 있는 내용을 만들어서
		// submit 호출
		
		document.getElementById("restaId").value = dlBean.restaId;
		document.getElementById("restaTitle").value = dlBean.restaTitle;
		document.getElementById("restaCate").value = dlBean.restaCate;
		document.getElementById("restaAddr").value = dlBean.restaAddr;
		document.getElementById("restaImgUrl").value = dlBean.restaImgUrl;
		document.getElementById("restaLat").value = dlBean.restaLat;
		document.getElementById("restaLng").value = dlBean.restaLng;
		document.getElementById("restaUrl").value = dlBean.restaUrl;
		document.getElementById("restaPhone").value = dlBean.restaPhone;

		console.log(document.getElementById("restaId").value);

		var sendForm = document.getElementById("sendForm");
		sendForm.action = "/resta/selectRestaDetail.do";
		sendForm.method = "post";
		sendForm.submit();
	};
	
	
	$scope.selectRestaProc = function(restaId) {
		$scope.daumLocalBean = {
			restaId: restaId
		};
		RestaService.selectRestaProc($scope.daumLocalBean).then(function(data) {
			console.log(JSON.stringify(data));
			$scope.reviewList = data.reviewList;
		});
	};
	
	var num = 0;
	$scope.doAccordian = function() {
		
		// 리뷰항목 아코디언 구현
	    $("#main button").click(function(){
	        /*$("#main .review_detail").slideUp();*/
	        if(!$(this).prev().is(":visible")) {
	            $(this).prev().slideDown();
	            console.log('안보여서 다운함');
	        }
	    });
	};

	// 배열 생성 함수
	$scope.getArr = function(num) {
		return new Array(num);
	}
	
} // end of Controller





