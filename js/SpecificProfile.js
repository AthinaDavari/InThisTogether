var allProfiles = angular.module("myApp", []);
 
allProfiles.controller("myCtrl", [ '$scope', '$http', function($scope, $http) {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    $scope.urlparam = urlParams.get('email');

    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8";
     
        $http({
            url : 'servlet/SpecificProficeServlet',
            method : "POST",
            data : {"email":$scope.urlparam}
        }).then(function(response) {
            console.log(response.data);
            $scope.profile = response.data;
            if (!($scope.profile.isEmailValid)) {
                window.location = 'error.html';
            }
        }, function(response) {
            //fail case
            console.log(response);
            $scope.profile = response;
        });
 
} ]);
