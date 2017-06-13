'use strict';

rankApp.controller('RankController', RankController);

RankController.$inject = ['$rootScope', '$scope', 'RankService'];

function RankController($rootScope, $scope, RankService) {
    
    // 모임 순위 조회 list
    $scope.ReviewRankList = [];
    $scope.LikeRankList = [];
    
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
    
    $scope.changeList = function(num) {
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
    
}; //end of Controller