'use strict';

groupApp.controller('GroupController', GroupController);

GroupController.$inject = ['$rootScope','$scope','GroupService'];

// 모임 컨트롤러
function GroupController($rootScope, $scope, GroupService){
   
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
    
    $scope.whatToSearch = "전체";
    
    // 모임 목록 조회 이벤트
    $scope.selectGroupList = function(pageNo) {
    	
    	if ( $scope.pBean == undefined ) {
    		// 없으면 새 객체 생성 ( javascript의 new Object(); 와 같다 )
    		$scope.pBean = {
    				searchType:"all",
    				searchText:""
    		};
    	}
    	$scope.pBean.pageNo = pageNo;
    	
    	// 조회하기
    	GroupService.selectGroupList( $scope.pBean ).then(function(data) {
    		console.log( JSON.stringify(data));
    		$scope.gList = data.gList;		// 모임 목록
    		$scope.pBean = data.pBean;		// 페이징 정보
    		$scope.whatToSearch = data.pBean.searchText;
    	});
    };
    
    // 모임 상세정보 화면으로 이동
    $scope.selectGroupDetailView = function(groupNo) {
    	location.href = "/group/selectGroupDetailView.do?groupNo="+groupNo;
    };
   
};// end controller