'use strict';

var groupApp = angular.module('groupApp', []);

//모임 서비스 정의
groupApp.factory("GroupService", function($http) {
   
   var service = {};
   
   service.selectGroupList = selectGroupList;
   
   return service;
   
   //예시 로그인
   function loginProcAjax(objParam) {
      return $http({
         url: "/member/loginProcAjax.do",
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