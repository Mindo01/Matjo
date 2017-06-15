'use strict';

var mainApp = angular.module('mainApp', []);

//게시판 서비스 정의
mainApp.factory("MainService", function($http) {
	
	var service = {};
	
	service.selectRestaListProc = selectRestaListProc;
	service.selectGroupList = selectGroupList;
	
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
	
	//모임 목록 조회
    function selectGroupList(objParam) {
	    return $http({
	 	   url: "/group/selectGroupListProc.do",
	 	   method: "post",
	 	   data : json2PostParams(objParam),
	 	   headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	    }).then(handleSuccess, handleError);
    }
	
	function handleSuccess(res) {
		return res.data;
	}
	
	function handleError(res) {
		return res.data;
	}
	
});