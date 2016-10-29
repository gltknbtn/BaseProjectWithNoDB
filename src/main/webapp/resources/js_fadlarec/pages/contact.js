	

function contactController($scope, $http) {
	
	$scope.pageToGet = 0;
    $scope.contactForm = {}
    $scope.displayValidationError = false;
	
    $scope.url = "/fadlarec/contactforms/contactformscreate/";
    
    $scope.createContactForm = function (newContactForm) {
    	

        $scope.lastAction = 'create';

        var url = $scope.url;

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $http.post(url, $.param($scope.contactForm), config)
            .success(function (data) {
            	alert("Your message has been sent. Thank you for your attention");
            })
            .error(function(data, status, headers, config) {
                alert("Contact form failed");
            });
    };
}
	


