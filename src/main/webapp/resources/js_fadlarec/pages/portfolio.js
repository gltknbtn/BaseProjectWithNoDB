
function portfolioController($scope, $http, $location) {

	$scope.pageToGet = 0;

	$scope.searchFor = "";

	$scope.selectedImage = {};

	$scope.selectedIndex = 0;
	
	$scope.showProgress = false;

	$scope.selectImage = function(child) {
		var img = angular.copy(child);
		$scope.selectedImage = img;
	}

	// /////////////////////////////////////

	$scope.getParentImages = function() {

		var url = "/fadlarec/mainpage";

		var config = {
			params : {
				page : $scope.pageToGet
			}
		};
		$http.get(url, config).success(function(data) {
			//$scope.finishAjaxCallOnSuccess(data, null, false);
			
			$scope.imageList = data;
		}).error(function() {
			$scope.state = 'error';
			alert("error");
		});
	};

	$scope.finishAjaxCallOnSuccess = function(data, modalId, isPagination) {

		$scope.populateTable(data);

	}

	$scope.populateTable = function(data) {
		if (data.pagesCount > 0) {
			$scope.state = 'list';

			$scope.page = {
				source : data.parentImages,
				currentPage : $scope.pageToGet,
				pagesCount : data.pagesCount,
				totalParentImages : data.totalParentImages
			};

			if ($scope.page.pagesCount <= $scope.page.currentPage) {
				$scope.pageToGet = $scope.page.pagesCount - 1;
				$scope.page.currentPage = $scope.page.pagesCount - 1;
			}

		} else {
			$scope.state = 'noresult';

			if (!$scope.searchFor) {
			}
		}

		if (data.actionMessage || data.searchMessage) {
			$scope.displayMessageToUser = $scope.lastAction != 'search';

			$scope.page.actionMessage = data.actionMessage;
			$scope.page.searchMessage = data.searchMessage;
		} else {
			$scope.displayMessageToUser = false;
		}
	}
	

	
	
    $scope.clearDetectedFace = function () {
    	$scope.croppedTempFaceList = {}
    };
	
	
	$scope.getParentImages();

	
	$('.carousel').bcSwipe({
		threshold : 50
	});
	

}
