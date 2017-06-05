'use strict';

restaApp.controller('RestaController', RestaController);

RestaController.$inject = ['$rootScope', '$scope', 'RestaService'];

function RestaController($rootScope, $scope, RestaService) {

	// DaumLocalBean 빈객체 생성
	$scope.daumLocalBean = {
		// Default Value 정의
	};
	
	// 페이징빈 빈객체 생성
	$scope.pagingBean = {
	};
	
	
	// 음식점 목록을 조회한다.
	$scope.selectRestaListProc = function() {
		console.log($scope.pagingBean);
		RestaService.selectRestaListProc($scope.pagingBean).then(function(data) {
			console.log( JSON.stringify(data) );
			console.log(data);
			console.log( data.resultMsg );   
			$scope.restaList = data.list;
			$scope.pagingBean = data.pagingBean;
		});
	};

	// 더보기 클릭시 아이템 추가 (단위: API 의 Default Value ==> 15)
	$scope.addRestaItem = function() {
		RestaService.selectRestaListProc($scope.pagingBean).then(function(data) {
			console.log(data);
			angular.forEach(data.list, function(restaItem) {
				$scope.restaList.push(restaItem);
			});
		});
	};
	
	// 배열 생성 함수
	$scope.getArr = function(num) {
		return new Array(num);
	}

} // end of Controller





