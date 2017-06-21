'use strict';

rankApp.controller('RankController', RankController);

RankController.$inject = ['$rootScope', '$scope', 'RankService'];

function RankController($rootScope, $scope, RankService) {
    
    // 모임 순위 조회 list
    $scope.ReviewRankList = [];
    $scope.LikeRankList = [];
    
    //맛집 순위 조회 list
    $scope.KoreaRankList = [];
    $scope.ChinaRankList = [];
    $scope.JapanRankList = [];
    $scope.UsaRankList = [];
    $scope.ChickenRankList = [];
    
    $scope.DetailList = [];
    
    // 랭크 리스트 조회 처리
    $scope.selectRankProc = function() {
    	RankService.selectRankProc().then(function(data) {
    		if(data.result == "success") {
    			$scope.ReviewRankList = data.ReviewRankList;
    			$scope.LikeRankList = data.LikeRankList;
    			
    			$scope.DetailList = $scope.ReviewRankList;
    		} else {
    			alert(data.resultMsg);
    		}
    	});
    	
    };
    
    // 모임 카테 변경 처리
    $scope.changeList = function(num) {
    	$scope.DetailList = [];
    	switch (num) {
    	case 1:
    		$scope.DetailList = $scope.ReviewRankList;
    		break;
    	case 2:
    		$scope.DetailList = $scope.ReviewRankList;
    		break;
    	case 3:
    		$scope.DetailList = $scope.LikeRankList;
    		break;
    	default:	
    		break;
    	}
    };
    
    // 맛집 랭크 리스트 조회 처리
    $scope.selectRestaRankProc = function() {
    	RankService.selectRestaRankProc().then(function(data) {
    		if(data.result == "success") {
    			// 한식 중식 일식 양식 치킨
    			$scope.KoreaRankList = data.KoreaRankList;
    			$scope.ChinaRankList = data.ChinaRankList;
    			$scope.JapanRankList = data.JapanRankList;
    			$scope.UsaRankList = data.UsaRankList;
    			$scope.ChickenRankList = data.ChickenRankList;
    			
    			$scope.DetailList = $scope.KoreaRankList;
    		} else {
    			alert(data.resultMsg);
    		}
    	});
    	
    };
    
    // 맛집 카테 변경 처리
    $scope.changeRestaList = function(num) {
    	$scope.DetailList = [];
    	switch (num) {
    	case 1:
    		$scope.DetailList = $scope.KoreaRankList;
    		break;
    	case 2:
    		$scope.DetailList = $scope.ChinaRankList;
    		break;
    	case 3:
    		$scope.DetailList = $scope.JapanRankList;
    		break;
    	case 4:
    		$scope.DetailList = $scope.UsaRankList;
    		break;
    	case 5:
    		$scope.DetailList = $scope.ChickenRankList;
    		break;
    	default:
    		break;
    	}
    };
    
}; //end of Controller