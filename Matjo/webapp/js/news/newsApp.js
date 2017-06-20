'use strict';

var newsApp = angular.module('newsApp', []);

//모임 서비스 정의
newsApp.factory("NewsService", function($http) {
   
   var service = {};
   
   service.selectNewsFeedProc = selectNewsFeedProc;
   service.selectNewsFeedDetail = selectNewsFeedDetail;
   return service;
   
   //뉴스피드 목록 조회
   function selectNewsFeedProc(objParam) {
	   return $http({
		   url: "/newsfeed/selectNewsFeedProc.do",
		   method: "post",
		   data : json2PostParams(objParam),
		   headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	   }).then(handleSuccess, handleError);
   }
   
   // 뉴스피드 상세 보기
   function selectNewsFeedDetail(objParam) {
	   return $http({
		   url: "/newsfeed/selectNewsFeedDetail.do",
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

newsApp.directive("rateYo", function() {
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