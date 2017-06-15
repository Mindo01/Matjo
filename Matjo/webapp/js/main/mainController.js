'use strict';

mainApp.controller('MainController', MainController);

MainController.$inject = ['$rootScope', '$scope', 'MainService'];

function MainController($rootScope, $scope, MainService) {
    
	// 페이징빈 빈객체 생성
	$scope.pagingBean = {
			pageNo: 1,
			location: null,
			radius: 0
	};
	
    // 검색 타입 (맛집/모임)
    $scope.searchType = "resta";
    // 검색어
    $scope.keyword = "";
    // 검색 결과 리스트
    $scope.resultList = [
    	{main: "",sub: "",img: ""}, {main: "",sub: "",img: ""}, {main: "",sub: "",img: ""}, {main: "",sub: "",img: ""},
    	{main: "",sub: "",img: ""}, {main: "",sub: "",img: ""}, {main: "",sub: "",img: ""}, {main: "",sub: "",img: ""}
    ];
    // 검색 타입 토글
    $scope.changeType = function() {
    	if($scope.searchType == "group"){
    		$scope.searchType = "resta";
    	} else {
    		$scope.searchType = "group";
    	}
    };
    // 검색 처리
    $scope.search = function() {
    	// 초기화
    	for(var i=0; i<8; i++){
			$scope.resultList[i].main = "";
			$scope.resultList[i].sub = "";
			$scope.resultList[i].img = "";
		}
    	
    	if($scope.searchType == "group"){
    		// 모임 검색
    		
    		if ( $scope.pBean == undefined ) {
        		// 없으면 새 객체 생성 ( javascript의 new Object(); 와 같다 )
        		$scope.pBean = {
        				searchType:"all",
        				searchText:""
        		};
        	}
    		$scope.pBean.searchText = $scope.keyword;
        	$scope.pBean.pageNo = 1;
        	
        	// 조회하기
        	MainService.selectGroupList( $scope.pBean ).then(function(data) {
        		console.log( JSON.stringify(data));
        		for(var i=0; i<8; i++){
        			$scope.resultList[i].groupNo = data.gList[i].groupNo;
					$scope.resultList[i].main = data.gList[i].groupName;
					$scope.resultList[i].sub = data.gList[i].groupInfo;
					$scope.resultList[i].img = data.gList[i].groupImg;
				}
        		$scope.pBean = data.pBean;		// 페이징 정보
        		$scope.whatToSearch = data.pBean.searchText;
        	});
        	
    	} else {
    		// 맛집 검색
    		$scope.pagingBean.searchText = $scope.keyword;
    		if ($scope.pagingBean == undefined) {
    			$scope.pagingBean = {
    				pageNo: 1
    			}; // new Object();
    		}
    		
    		MainService.selectRestaListProc($scope.pagingBean).then(function(data) {
				console.log( data.resultMsg );
				
				for(var i=0; i<8; i++){
					$scope.resultList[i] = data.list[i];
					$scope.resultList[i].main = data.list[i].restaTitle;
					$scope.resultList[i].sub = data.list[i].restaCate;
					$scope.resultList[i].img = data.list[i].restaImgUrl;
				}
				
				$scope.pagingBean = data.pagingBean;
			});
    	}
    };
    
    // 더보기
    $scope.addView = function() {
    	
    	if($scope.searchType == "group"){
    		// 모임 검색
    		location.href = "/group/selectGroupList.do?searchText="+$scope.keyword;
    	} else {
    		// 맛집 검색
    		location.href = "/resta/selectRestaList.do?searchText="+$scope.keyword;
    	}
    	
    };
    
    // 상세보기
    $scope.goDetailController = function(bean) {
    	
    	if($scope.searchType == "group"){
    		// 모임 검색
    		location.href = "/group/selectGroupDetailView.do?groupNo="+bean.groupNo;
    	} else {
    		// 맛집 검색
    		$scope.goDetailPage(bean);
    	}
    	
    }
    
    // 맛집 상세보기
    $scope.goDetailPage = function(dlBean) {
		console.log(JSON.stringify(dlBean));
		
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
    
}; //end of Controller