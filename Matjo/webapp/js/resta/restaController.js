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
			radius: 0,
			searchText: ""
	};
	
	$rootScope.reviewRatingAvg = "1.0";
	
	$scope.slideArr = [];
	
	// 초기화
	$scope.initValues = function(searchText) {
		$scope.pagingBean.searchText = searchText;
		if($scope.pagingBean.searchText != ''){
			$scope.selectRestaListProc();
		}
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
			$scope.dlBean = data.dlBean;
			//$scope.reviewRatingAvg = data.reviewRatingAvg;
			$rootScope.reviewRatingAvg = data.reviewRatingAvg;
			console.log("data.reviewRatingAvg : " + data.reviewRatingAvg);
			console.log("$scope.reviewRatingAvg : " + $scope.reviewRatingAvg);
		});
	};
	
	// 아코디언 메뉴 : 여기서는 안썼음 TODO 지우기!
	var num = 0;
	$scope.doAccordian = function(ind) {
		console.log(ind);
		// 리뷰항목 아코디언 구현
		var btn = $('#main button:nth-of-type(1)');
	    if(!btn.prev().is(':visible')) {
	    	btn.prev().slideDown();
	            console.log('안보여서 다운함');
		} else {
	        if(btn.prev().is(':visible')) {
	        	btn.prev().slideUp();
	        	console.log('보여서 업함');
	        }
	    }
	};
	
	// ANGULAR 이용한 아코디언 메뉴
	$scope.setAccordian = function(ind) {
		console.log('뭐냐' + ind);
		console.log('뭐냐ㅇㅇ' + $scope.slideArr[ind]);
		// 닫기
		if ($scope.slideArr[ind] == 1) {
			console.log("닫아주세욤");
			$scope.slideArr[ind] = 0;
			return ;
		}
		// 나머지 닫고 나만 열기
		console.log(ind+"가 들어왔고, 길이는 "+$scope.slideArr.length);
		for (var i = 0; i < $scope.slideArr.length; i++) {
			$scope.slideArr[i] = 0;
			console.log("초기화 - "+$scope.slideArr[i]);
		}
		$scope.slideArr[ind] = 1;
		console.log("리뷰["+ind+"]만 "+$scope.slideArr[ind]+"로 설정");
	}
	
	// 좋아요 설정/해제
	$scope.likeClicked = function(ind) {
		HoldOn.open();
		$scope.lBean = {};
		$scope.lBean.likeReview = $scope.reviewList[ind].reviewNo;
		if ($scope.reviewList[ind].reviewHasLike == 1) {
			// 좋아요 해제
			console.log($scope.reviewList[ind].reviewRestaName+" 좋아요 해제!");
			// 좋아요 해제 서비스 호출
	    	RestaService.deleteLike( $scope.lBean ).then(function(data) {
	    		console.log(JSON.stringify(data));
				HoldOn.close();
				if(data.result == 'success') {
					$scope.reviewList[ind].reviewHasLike = 0;
					// 좋아요 개수 갱신
					$scope.reviewList[ind].reviewLike--;
				} else {
					// 정보 조회 실패
					alert("로그인한 상태에서만 좋아요가 가능합니다!");
				}
	    	});
		} else {
			// 좋아요
			console.log($scope.reviewList[ind].reviewRestaName+" 좋아요 설정!");
			// 좋아요 설정 서비스 호출
	    	RestaService.insertLike( $scope.lBean ).then(function(data) {
	    		console.log(JSON.stringify(data));
				HoldOn.close();
				if(data.result == 'success') {
					$scope.reviewList[ind].reviewHasLike = 1;
					// 좋아요 개수 갱신
					$scope.reviewList[ind].reviewLike++;
				} else {
					// 정보 조회 실패
					alert("로그인한 상태에서만 좋아요가 가능합니다!");
				}
	    	});
		}
	}
	
	
	
	// 음식점 구독 관련
	// 음식점 구독 시도
    $scope.subsRestaTry = function(hasSubsResta) {
    	if (hasSubsResta == 'true') {
    		// 구독 해제 처리
    		$scope.deleteSubsRestaProc();
    	} else if (hasSubsResta == 'false') {
    		// 구독 처리
    		$scope.insertSubsRestaProc();
    	}
    }
    
    // 모임 구독
    $scope.insertSubsRestaProc = function() {
    	HoldOn.open();
    	RestaService.insertSubsRestaProc( $scope.dlBean ).then(function(data) {
    		console.log(JSON.stringify(data));
    		
			HoldOn.close();
			
			if(data.result == 'success') {
				console.log("구독 정보 : "+data.dlBean.hasSubsResta);
				$scope.dlBean.hasSubsResta = data.dlBean.hasSubsResta;
			} else {
				// 정보 조회 실패
				alert(data.resultMsg);
			}
    	});
    }
    
    // 무조건 구독 해제 : 내 구독모임 목록에서 사용
    $scope.deleteSubsRestaStrict = function(restaId) {
    	if ($scope.dlBean == undefined) {
    		$scope.dlBean = {};
    	}
    	$scope.dlBean.restaId = restaId;
    	$scope.deleteSubsRestaProc();
    	
    	$scope.selectSubsResta();
    }
    
    // 모임 구독 해제
    $scope.deleteSubsRestaProc = function() {
    	HoldOn.open();
    	RestaService.deleteSubsRestaProc( $scope.dlBean ).then(function(data) {
    		console.log(JSON.stringify(data));
    		
			HoldOn.close();
			
			if(data.result == 'success') {
				console.log("구독 정보 : "+data.dlBean.hasSubsResta);
				$scope.dlBean.hasSubsResta = data.dlBean.hasSubsResta;
			} else {
				// 정보 조회 실패
				alert(data.resultMsg);
			}
    	});
    }
    
    // 내 구독 모임 조회
    $scope.selectSubsResta = function() {
    	HoldOn.open();
    	RestaService.selectSubsResta().then(function(data) {
    		console.log(JSON.stringify(data));
    		
			HoldOn.close();
			
			if(data.result == 'success') {
				$scope.restaList = data.restaList;
			} else {
				// 정보 조회 실패
				alert(data.resultMsg);
			}
    	});
    }
	
	

	// 배열 생성 함수
	$scope.getArr = function(num) {
		return new Array(num);
	}
	
} // end of Controller





