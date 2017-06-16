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
    
    $scope.slideArr = [];
    
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
				$scope.gBean = data.gBean;
				$scope.mBeanList = data.mBeanList;
				$scope.reviewList = data.reviewList;
				// 배열 생성 함수
				$scope.slideArr = new Array(data.reviewList.length);
				for (var i = 0; i < $scope.slideArr.length; i++) {
					$scope.slideArr[i] = 0;
				}
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
    
    // 무조건 구독 해제 : 내 구독모임 목록에서 사용
    $scope.deleteSubsGroupStrict = function(groupNo) {
    	if ($scope.gBean == undefined) {
    		$scope.gBean = {};
    	}
    	$scope.gBean.groupNo = groupNo;
    	$scope.deleteSubsGroupProc();
    	
    	$scope.selectSubsGroup();
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
    
    // 내 구독 모임 조회
    $scope.selectSubsGroup = function() {
    	HoldOn.open();
    	GroupService.selectSubsGroup().then(function(data) {
    		console.log(JSON.stringify(data));
    		
			HoldOn.close();
			
			if(data.result == 'success') {
				$scope.gList = data.groupList;
			} else {
				// 정보 조회 실패
				alert(data.resultMsg);
			}
    	});
    }
    
    
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
	    	GroupService.deleteLike( $scope.lBean ).then(function(data) {
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
	    	GroupService.insertLike( $scope.lBean ).then(function(data) {
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
	
   
};// end controller