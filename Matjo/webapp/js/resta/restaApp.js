'use strict';

var restaApp = angular.module('restaApp', []);

//게시판 서비스 정의
restaApp.factory("RestaService", function($http) {

	var service = {};

	service.selectRestaListProc = selectRestaListProc;
	service.selectRestaForm = selectRestaForm;
	service.selectRestaProc = selectRestaProc;
	return service;

	// 음식점 목록 조회
	function selectRestaListProc(objParam) {
		return $http({
			url: "/resta/selectRestaListProc.do",
			method: "post",
			data : json2PostParams(objParam),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}  
		}).then(handleSuccess, handleError);
	};

	// 음식점 1개 조회
	function selectRestaForm(objParam) {
		return $http({
			url: "/resta/selectRestaForm.do",
			method: "post",
			data : json2PostParams(objParam),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	};
	
	// 음식점 1개 조회시 해당 리뷰 호출
	function selectRestaProc(objParam) {
		return $http({
			url: "/resta/selectRestaProc.do",
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