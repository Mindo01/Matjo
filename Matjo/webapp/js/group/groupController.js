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
    
    // 페이징빈 빈객체 생성
	$scope.pBean = {
			pageNo: 1,
			searchType: "",
			searchText: ""
	};
	
    $scope.whatToSearch = "전체";
    // 초기화
	$scope.initValues = function(searchText) {
		$scope.pBean.searchType = 'all';
		$scope.pBean.searchText = searchText;
			$scope.selectGroupList(1);
	};
	
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
    
    // 모임 가입을 위한 모임명 조회
    $scope.selectGroupToApply = function() {
    	if ($scope.pBean == undefined) {
    		return;
    	}
    	$scope.pBean.searchType="group_name";
    	GroupService.selectGroupToApply( $scope.pBean ).then(function(data) {
    		console.log(JSON.stringify(data));
    		$scope.gList = data.gList;		// 모임 목록
    		$scope.pBEan = data.pBean;		// 페이징 정보
    	});
    }
    
    // 모임 상세정보 화면으로 이동
    $scope.selectGroupDetailView = function(groupNo) {
    	location.href = "/group/selectGroupDetailView.do?groupNo="+groupNo;
    };
    
    // 모임 상세정보 처리
    $scope.selectGroupDetailProc = function(groupNo) {
    	console.log("groupNo : "+groupNo);
    	HoldOn.open();
    	
    	if ($scope.gBean == undefined) {
			$scope.gBean = {
    		};
    	}
		$scope.gBean.groupNo = groupNo;
    	
    	GroupService.selectGroupDetailProc( $scope.gBean ).then(function(data) {
    		console.log(JSON.stringify(data));
    		
			HoldOn.close();
			
			if(data.result == 'success') {
				alert(data.resultMsg);
				$scope.gBean = data.gBean;
				$scope.mBeanList = data.mBeanList;
				if ($scope.gBean.groupImg != null && $scope.gBean.groupImg != "") {
					$scope.gBean.groupImg = "/upload/"+$scope.gBean.groupImg;
				} else {
					$scope.gBean.groupImg = "/resources/images/group_1.png";
				}
			} else {
				// 정보 조회 실패
				alert(data.resultMsg);
				// 뒤로가기
				history.back();
			}
    	});
    };
    
    // 모임 구독 시도
    $scope.subsGroupTry = function(hasSubsGroup) {
    	if (hasSubsGroup == 'true') {
    		// 구독 해제 처리
    		$scope.deleteSubsGroupProc();
    	} else if (hasSubsGroup == 'false') {
    		// 구독 처리
    		$scope.insertSubsGroupProc();
    	}
    }
    
    // 모임 구독
    $scope.insertSubsGroupProc = function() {
    	HoldOn.open();
    	GroupService.insertSubsGroupProc( $scope.gBean ).then(function(data) {
    		console.log(JSON.stringify(data));
    		
			HoldOn.close();
			
			if(data.result == 'success') {
				console.log("구독 정보 : "+data.gBean.hasSubsGroup);
				$scope.gBean.hasSubsGroup = data.gBean.hasSubsGroup;
			} else {
				// 정보 조회 실패
				alert(data.resultMsg);
			}
    	});
    }
    
    // 모임 구독 해제
    $scope.deleteSubsGroupProc = function() {
    	HoldOn.open();
    	GroupService.deleteSubsGroupProc( $scope.gBean ).then(function(data) {
    		console.log(JSON.stringify(data));
    		
			HoldOn.close();
			
			if(data.result == 'success') {
				console.log("구독 정보 : "+data.gBean.hasSubsGroup);
				$scope.gBean.hasSubsGroup = data.gBean.hasSubsGroup;
			} else {
				// 정보 조회 실패
				alert(data.resultMsg);
			}
    	});
    }
    
    // 모임 소속 회원 목록 창 띄우기
//    $scope.selectGroupMemberForm = function() {
//    	
//    }
    
    // 모임 소속 회원 목록 조회
    $scope.selectGroupMemberProc = function(groupNo) {
    	
    	HoldOn.open();
    	if ($scope.gBean == undefined) {
			$scope.gBean = {
    		};
    	}
    	$scope.gBean.groupNo = groupNo;
    	GroupService.selectGroupMemberProc( $scope.gBean ).then(function(data) {
    		console.log(JSON.stringify(data));
    		
			HoldOn.close();
			
			if(data.result == 'success') {
				$scope.grp = data.gBean;
				$scope.memberList = data.memberList;
			} else {
				// 정보 조회 실패
				alert(data.resultMsg);
			}
    	});
    }
    
    // 모임 가입 - 부모창으로 돌아가기
    $scope.sendSelectedGroup = function(group) {
    	opener.document.insertGroupMember.groupNo.value=group.groupNo;
		opener.document.insertGroupMember.groupName.value=group.groupName;
		opener.document.insertGroupMember.groupLeader.value=group.groupLeader;
        window.close();
    };
    
    // 
   
};// end controller