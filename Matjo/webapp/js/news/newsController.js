'use strict';

newsApp.controller('NewsController', NewsController);

NewsController.$inject = ['$rootScope','$scope','NewsService'];

// 모임 컨트롤러
function NewsController($rootScope, $scope, NewsService){
   
    //모임 빈객체 생성
    $scope.groupBean = {
    	groupNo : "",
    	groupName : "",
    	memberNo : "",
    	groupLeader : "",
    	groupInfo : "",
    	groupImg : "",
    	groupSize : ""
    };
    
    // 뉴스피드 목록 조회
    $scope.selectNewsFeedProc = function() {
    	$scope.pBean = {
    		pageNo: -1
    	};
    	// 조회하기
    	NewsService.selectNewsFeedProc($scope.pBean).then(function(data) {
    		console.log( JSON.stringify(data));
    		$scope.newsFeedList = data.newsFeedList;
    	});
    };
    
};// end controller