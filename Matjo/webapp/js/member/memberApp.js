'use strict';

var memberApp = angular.module('memberApp', []);

//게시판 서비스 정의
memberApp.factory("MemberService", function($http) {
	
	var service = {};
	
	service.loginMemberProc = loginMemberProc;
	service.logoutMemberProc = logoutMemberProc;
	service.insertMemberProc = insertMemberProc;
	service.updateMemberProc = updateMemberProc;
	service.selectMember = selectMember;
	service.selectHp = selectHp;
	service.findMemberProc = findMemberProc;
	service.searchAddressCityProc = searchAddressCityProc;
	service.searchAddressLocalProc = searchAddressLocalProc;
	
	return service;
	
	// 로그인
	function loginMemberProc(objParam) {
		return $http({
			url: "/member/loginMemberProc.do",
			method: "post",
			data : json2PostParams(objParam),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	};
	
	// 로그아웃
	function logoutMemberProc() {
		return $http({
			url: "/member/logoutMemberProc.do"
		}).then(handleSuccess, handleError);
	};
	
	// 회원가입
	function insertMemberProc(objParam) {
		return $http({
			url: "/member/insertMemberProc.do",
			method: "post",
			data :  json2PostParams(objParam),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	};
	
	// 회원정보수정
	function updateMemberProc(objParam) {
		return $http({
			url: "/member/updateMemberProc.do",
			method: "post",
			data :  json2PostParams(objParam),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	};
	
	// 회원조회 1명
	function selectMember(objParam) {
		return $http({
			url: "/member/selectMemberProc.do",
			method: "post",
			data : json2PostParams(objParam),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	};
	
	// 휴대폰 번호 조회
	function selectHp(objParam) {
		return $http({
			url: "/member/selectHpProc.do",
			method: "post",
			data : json2PostParams(objParam),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	};
	
	// 비밀번호 찾기
	function findMemberProc(objParam) {
		return $http({
			url: "/member/findMemberProc.do",
			method: "post",
			data : json2PostParams(objParam),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	};
	
	// 광역시/도 조회
	function searchAddressCityProc() {
		return $http({
			url: "/searchAddressCityProc.do"
		}).then(handleSuccess, handleError);
	};
	
	// 시/군/구 조회
	function searchAddressLocalProc(objParam) {
		return $http({
			url: "/searchAddressLocalProc.do",
			method: "post",
			data : json2PostParams(objParam),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	};
	
	function handleSuccess(res) {
		return res.data;
	}
	
	function handleError(res) {
		return res.data;
	}
	
});