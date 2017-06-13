'use strict';

var rankApp = angular.module('rankApp', []);

//게시판 서비스 정의
rankApp.factory("RankService", function($http) {
	
	var service = {};
	
	service.selectRankProc = selectRankProc;
	
	return service;
	
	// 랭크 리스트 조회
	function selectRankProc() {
		return $http({
			url: "/rank/selectRankProc.do"
		}).then(handleSuccess, handleError);
	};
	
	function handleSuccess(res) {
		return res.data;
	}
	
	function handleError(res) {
		return res.data;
	}
	
});