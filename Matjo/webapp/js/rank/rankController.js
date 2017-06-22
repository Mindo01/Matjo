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
    $scope.RestaRankList = [];
    
    $scope.DetailList = [];
    
    $scope.DetailCate1 = "";
    $scope.DetailCate2 = "";
    
    // 랭크 리스트 조회 처리
    $scope.selectRankProc = function() {
    	RankService.selectRankProc().then(function(data) {
    		if(data.result == "success") {
    			console.log("랭크 리스트 조회 처리 성공 - 모임");
    			$scope.ReviewRankList = data.ReviewRankList;
    			$scope.LikeRankList = data.LikeRankList;
    			
    			for (var i = 0; i < 3; i++) {
        			if ($scope.ReviewRankList[i].groupImg != null && $scope.ReviewRankList[i].groupImg != "") {
        				$scope.ReviewRankList[i].groupImg = "http://ldh66210.cafe24.com/upload/"+$scope.ReviewRankList[i].groupImg;
        			} else {
        				$scope.ReviewRankList[i].groupImg = "http://ldh66210.cafe24.com/upload/ic_group.png";
        			}
        		}
    			for (var i = 0; i < 3; i++) {
        			if ($scope.LikeRankList[i].groupImg != null && $scope.LikeRankList[i].groupImg != "") {
        				$scope.LikeRankList[i].groupImg = "http://ldh66210.cafe24.com/upload/"+$scope.LikeRankList[i].groupImg;
        			} else {
        				$scope.LikeRankList[i].groupImg = "http://ldh66210.cafe24.com/upload/ic_group.png";
        			}
        		}
    			
    			$scope.DetailList = $scope.ReviewRankList;
    			$scope.DetailCate1 = "리뷰수";
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
    		$scope.DetailCate1 = "리뷰수";
    		break;
    	case 2:
    		$scope.DetailList = $scope.ReviewRankList;
    		$scope.DetailCate1 = "참여율";
    		break;
    	case 3:
    		$scope.DetailList = $scope.LikeRankList;
    		$scope.DetailCate1 = "좋아요수";
    		break;
    	default:	
    		break;
    	}
    	
    };
    
    // 맛집 랭크 리스트 조회 처리
    $scope.selectRestaRankProc = function() {
    	RankService.selectRestaRankProc().then(function(data) {
    		if(data.result == "success") {
    			console.log("랭크 리스트 조회 처리 성공 - 맛집");
    			// 한식 중식 일식 양식 치킨
    			$scope.KoreaRankList = data.KoreaRankList;
    			$scope.ChinaRankList = data.ChinaRankList;
    			$scope.JapanRankList = data.JapanRankList;
    			$scope.UsaRankList = data.UsaRankList;
    			$scope.ChickenRankList = data.ChickenRankList;
    			// 전체 랭크 조회
    			$scope.RestaRankList = data.RestaRankList;
    			
    			$scope.DetailList = $scope.KoreaRankList;
    			$scope.DetailCate2 = "한식";
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
    		$scope.DetailCate2 = "한식";
    		break;
    	case 2:
    		$scope.DetailList = $scope.ChinaRankList;
    		$scope.DetailCate2 = "중식";
    		break;
    	case 3:
    		$scope.DetailList = $scope.JapanRankList;
    		$scope.DetailCate2 = "일식";
    		break;
    	case 4:
    		$scope.DetailList = $scope.UsaRankList;
    		$scope.DetailCate2 = "양식";
    		break;
    	case 5:
    		$scope.DetailList = $scope.ChickenRankList;
    		$scope.DetailCate2 = "치킨";
    		break;
    	default:
    		break;
    	}
    };
    
}; //end of Controller