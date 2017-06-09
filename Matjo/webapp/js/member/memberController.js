'use strict';

memberApp.controller('MemberController', MemberController);

MemberController.$inject = ['$rootScope', '$scope', 'MemberService'];

function MemberController($rootScope, $scope, MemberService) {
	
	// memberBean 객체 생성
    $scope.memberBean = {
    	memberId: "",
    	memberPw: "",
        memberName : "",
        hp1 : "010",
        memberHp : "",
		memberCity : "",
		memberLocal : "",
		memberQuestion : "0",
		memberAnswer : "",
		memberDate : "",
		memberImg : ""
    };
    
    // 광역시/도 list
    $scope.cityList = [];
    // 시/군/구 list
    $scope.localList = [];
    
    // 로그인 처리
    $scope.loginMember = function() {
    	
    	// 아이디 결합
    	$scope.memberBean.memberId = $scope.memberBean.mId + "@" + $scope.memberBean.mEmail;
    	
    	MemberService.loginMemberProc($scope.memberBean).then(function(data) {
    		if(data.result == "success") {
    			location.replace("/index.do");
    		} else {
    			alert(data.resultMsg);
    		}
    	});
    	
    };
    
    // 로그아웃 처리
    $scope.logoutMember = function() {
    	MemberService.logoutMemberProc().then(function(data) {
    		location.replace("/index.do");
    	});
    };
    
    // 회원가입 화면
    $scope.insertMemberForm = function() {
    	location.href = "/member/insertMemberForm.do";
    };
    
    // 회원 1명 조회
    $scope.selectMember = function() {
    	$scope.isIdCheck = false;
    	MemberService.selectMember($scope.memberBean).then(function(data) {
    		if(data.result == "success"){
    			$scope.isIdCheck = true;
	        	alert(data.resultMsg);
	        } else {
	        	alert(data.resultMsg);
	        }
    	});
    };
    
    // 비밀번호 찾기
    $scope.findMemberProc = function() {
    	MemberService.findMemberProc($scope.memberBean).then(function(data) {
    		if(!$scope.isIdCheck){
        		alert("아이디를 먼저 확인해주세요");
        		return;
        	}
	        if(data.result == "success"){
	        	location.href = "/member/newPasswordMemberForm.do?memberId="+data.mBean.memberId;
	  			return;
	        } else {
	        	alert(data.resultMsg);
	        }
    	});
    };
    
    // 새 비밀번호 설정
    $scope.newPassword = function(mId) {
    	
    	// 비밀번호 확인
    	if($scope.memberBean.memberPw != $scope.memberBean.mPwCheck){
    		alert("비밀번호와 비밀번호 확인이 다릅니다.");
    		return;
    	}
    	$scope.memberBean.memberId = mId;
    	MemberService.updateMemberProc($scope.memberBean).then(function(data) {
    		if(data.result == "success"){
	        	alert(data.resultMsg);
	        	location.replace("/index.do");
	  			return;
	        } else {
	        	alert(data.resultMsg);
	        }
    	});
    	
    };
    
    // 회원가입 처리
    $scope.insertMemberProc = function() {
    	
    	// 아이디 결합
    	$scope.memberBean.memberId = $scope.memberBean.mId + "@" + $scope.memberBean.mEmail;
    	
    	// 비밀번호 확인
    	if($scope.memberBean.mPw != $scope.memberBean.mPwCheck){
    		alert("비밀번호와 비밀번호 확인이 다릅니다.");
    		return;
    	} else {
    		$scope.memberBean.memberPw = $scope.memberBean.mPw;
    	}
    	// 휴대폰 번호 결합
    	$scope.memberBean.memberHp = $scope.memberBean.hp1 + $scope.memberBean.hp2;
    		
    	MemberService.insertMemberProc($scope.memberBean).then(function(data) {
    		if(data.result == "success") {
    			alert(data.resultMsg);
    			location.replace("/index.do");
    		} else {
    			alert(data.resultMsg);
    		}
    	});
    };
    
    // 회원정보수정 화면
    $scope.updateMemberForm = function() {
    	location.href = "/member/updateMemberForm.do";
    };
    
    // 회원정보수정화면 초기화 (시작시)
    $scope.updateMemberInit = function(loginBean) {
    	//세션 아이디 저장
    	$scope.memberBean.memberId = loginBean;
    	
    	MemberService.selectMember($scope.memberBean).then(function(data) {
    		$scope.memberBean = data.mBean;
    	});
    	
    };
    
    // 회원정보수정 처리
    $scope.updateMemberProc = function() {
    	
    	//비밀번호 확인
    	if($scope.memberBean.mPw != $scope.memberBean.mPwCheck){
    		alert("비밀번호와 비밀번호 확인이 다릅니다.");
    		return;
    	} else {
    		$scope.memberBean.memberPw = $scope.memberBean.mPw;
    	}
    	
    	MemberService.updateMemberProc($scope.memberBean).then(function(data) {
    		if(data.result == "success") {
    			alert(data.resultMsg);
    			location.replace("/index.do");
    		} else {
    			alert(data.resultMsg);
    		}
    	});
    	
    };
    
    // 광역시/도 조회
    $scope.searchAddressCityProc = function() {
    	MemberService.searchAddressCityProc().then(function(data) {
    		$scope.cityList = data.list;
    		$scope.searchAddressLocalProc();
    	});
    };
    
    // 시/군/구 조회
    $scope.searchAddressLocalProc = function() {
    	MemberService.searchAddressLocalProc($scope.memberBean).then(function(data) {
    		$scope.localList = data.list;
    	});
    };
    
    // 이메일 세팅
    $scope.settingEmail = function() {
    	$scope.memberBean.mEmail = $scope.selectEmail;
    };
	
    // 비밀번호 찾기 화면
    $scope.findMemberForm = function() {
    	location.href = "/member/findMemberForm.do";
    };
    
    // 배열 생성 함수
    $scope.getArr = function(num) {
    	return new Array(num);
    };
    
}; //end of Controller