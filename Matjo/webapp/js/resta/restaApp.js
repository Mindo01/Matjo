'use strict';

var restaApp = angular.module('restaApp', []);

//게시판 서비스 정의
restaApp.factory("RestaService", function($http) {

	var service = {};

	service.selectRestaListProc = selectRestaListProc;
	service.selectRestaForm = selectRestaForm;
	service.selectRestaProc = selectRestaProc;
	
	// 구독 관련
	service.insertSubsRestaProc = insertSubsRestaProc;
	service.deleteSubsRestaProc = deleteSubsRestaProc;
	service.selectSubsResta = selectSubsResta;
	
	// 좋아요 설정/해제
	service.insertLike = insertLike;
	service.deleteLike = deleteLike;
	
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

	
	
	// 구독 관련 기능 : 민주-groupApp.js 참조
	function insertSubsRestaProc(objParam) {
		return $http({
			url: "/resta/insertSubsRestaProc.do",
			method: "post",
			data: json2PostParams(objParam),
			headers : {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	}

	// 모임 구독 해제
	function deleteSubsRestaProc(objParam) {
		return $http({
			url: "/resta/deleteSubsRestaProc.do",
			method: "post",
			data: json2PostParams(objParam),
			headers : {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	}

	// 내 구독 모임 조회
	function selectSubsResta(objParam) {
		return $http({
			url: "/resta/selectSubsRestaProc.do",
			method: "post",
			data: json2PostParams(objParam),
			headers : {'Content-Type': 'application/x-www-form-urlencoded'}
		}).then(handleSuccess, handleError);
	}
	
	

	// 좋아요 관련 기능 : 민주-groupApp.js 참조
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

/*restaApp.directive("rateYo", function() {
return {
    restrict: "E",
    scope: {
        rating: "="
    },
    template: "<div id='rateYo'></div>",
    link: function( scope, ele, attrs ) {
        console.log("scope.reviewRatingAvg : " + scope.$root.reviewRatingAvg);

        //scope.rating = scope.$root.reviewRatingAvg;

//        $(ele).rateYo({
//            rating: scope.rating,
//            starWidth: "20px",      
//            ratedFill: "#ffce59",
//            readOnly: true       
//            
//        });
        scope.$watch('rating', function(newVal, oldVal){
            console.log('바뀌었다 !! ==> ' + oldVal + ' to ' + newVal);
            $(ele).rateYo({
                rating: newVal,
                starWidth: "20px",      
                ratedFill: "#ffce59",
                readOnly: true       

            });
        });  
    }
};
});
 */

restaApp.directive("rateYo", function() {
	return {
		restrict: "E",
		scope: {
			rating: "="
		},
		template: "<div id='rateYo'></div>",
		link: function( scope, ele, attrs, modelController ) {
			console.log("scope.reviewRatingAvg : " + scope.$root.reviewRatingAvg);

			scope.$watch('rating', function(newVal, oldVal){
				console.log('바뀌었다 !! ==> ' + oldVal + ' to ' + newVal);

				$(ele).rateYo({
					rating: newVal,
					starWidth: "10px",      
					ratedFill: "#ffce59",
					readOnly: true       

				});

			});  
		}
	};
});



restaApp.directive("rateYoAvg", function() {
	return {
		restrict: "E",
		scope: {
			rating: "="
		},
		template: "<div id='rateYo'></div>",
		link: function( scope, ele, attrs) {
			console.log("scope.reviewRatingAvg : " + scope.$root.reviewRatingAvg);

			setTimeout(function() {
				$(ele).rateYo({
					rating: scope.$root.reviewRatingAvg,
					starWidth: "20px",      
					ratedFill: "#ffce59",
					readOnly: true       

				});

			}, 500);
		}
	};
});