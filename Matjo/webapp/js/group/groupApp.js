'use strict';

var groupApp = angular.module('groupApp', []);

//모임 서비스 정의
groupApp.factory("GroupService", function($http) {
   
   var service = {};
   
   service.selectGroupList = selectGroupList;
   service.selectGroupToApply = selectGroupToApply;
   service.selectGroupDetailProc = selectGroupDetailProc;
   service.insertSubsGroupProc = insertSubsGroupProc;
   service.deleteSubsGroupProc = deleteSubsGroupProc;
   service.selectGroupMemberProc = selectGroupMemberProc;
   
   // 좋아요 설정/해제
   service.insertLike = insertLike;
   service.deleteLike = deleteLike;
   return service;
   
   //모임 목록 조회
   function selectGroupList(objParam) {
	   return $http({
		   url: "/group/selectGroupListProc.do",
		   method: "post",
		   data : json2PostParams(objParam),
		   headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	   }).then(handleSuccess, handleError);
   }
   
   //모임 가입 신청 시 가입할 모임 조회
   function selectGroupToApply(objParam) {
	   return $http({
		   url: "/group/selectGroupToApplyProc.do",
		   method: "post",
		   data: json2PostParams(objParam),
		   headers : {'Content-Type': 'application/x-www-form-urlencoded'}
	   }).then(handleSuccess, handleError);
   }
   
   // 모임 상세정보 불러오기
   function selectGroupDetailProc(objParam) {
	   return $http({
		   url: "/group/selectGroupDetailProc.do",
		   method: "post",
		   data: json2PostParams(objParam),
		   headers : {'Content-Type': 'application/x-www-form-urlencoded'}
	   }).then(handleSuccess, handleError);
   }
   
   // 모임 소속 회원 목록 불러오기
   function selectGroupMemberProc(objParam) {
	   return $http({
		   url: "/group/selectGroupMemberProc.do",
		   method: "post",
		   data: json2PostParams(objParam),
		   headers : {'Content-Type': 'application/x-www-form-urlencoded'}
	   }).then(handleSuccess, handleError);
   }
   
   // 모임 구독하기
   function insertSubsGroupProc(objParam) {
	   return $http({
		   url: "/group/insertSubsGroupProc.do",
		   method: "post",
		   data: json2PostParams(objParam),
		   headers : {'Content-Type': 'application/x-www-form-urlencoded'}
	   }).then(handleSuccess, handleError);
   }
   
   // 모임 구독 해제
   function deleteSubsGroupProc(objParam) {
	   return $http({
		   url: "/group/deleteSubsGroupProc.do",
		   method: "post",
		   data: json2PostParams(objParam),
		   headers : {'Content-Type': 'application/x-www-form-urlencoded'}
	   }).then(handleSuccess, handleError);
   }
   
   // 리뷰 좋아요 설정
   function insertLike(objParam) {
	   return $http({
		   url: "/like/insertLike.do",
		   method: "post",
		   data: json2PostParams(objParam),
		   headers : {'Content-Type': 'application/x-www-form-urlencoded'}
	   }).then(handleSuccess, handleError);
   }
   
   // 리뷰 좋아요 해제
   function deleteLike(objParam) {
	   return $http({
		   url: "/like/deleteLike.do",
		   method: "post",
		   data: json2PostParams(objParam),
		   headers : {'Content-Type': 'application/x-www-form-urlencoded'}
	   }).then(handleSuccess, handleError);
   }
   
   function handleSuccess(res) {
      return res.data;
   }
   
   function handleError(res) {
      return res.data;
   }
   
});

groupApp.directive("rateYo", function() {
	return {
		restrict: "E",
		scope: {
			rating: "="
		},
		template: "<div id='rateYo'></div>",
		link: function( scope, ele, attrs ) {
			$(ele).rateYo({
				rating: scope.rating,
				starWidth: "10px",      
				ratedFill: "#ffce59",
				readOnly: true          
			});
		}
	};
});