var allProfiles = angular.module("myApp", []);
 
allProfiles.controller("myCtrl", [ '$scope', '$http', function($scope, $http) {
 
    $scope.filterr = {};
    $scope.condition = "or";
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8";
     
        $http({
            url : 'servlet/ShowAllProfilesServlet',
            method : "POST"
        }).then(function(response) {
            console.log(response.data);
            $scope.profiles = response.data;
            $scope.profiles.supporters = Object.values($scope.profiles.supporters);
        }, function(response) {
            //fail case
            console.log(response);
            $scope.profiles = response;
        });
  
     $scope.filterBy = function(x){
         if($scope.condition == "or"){
         return Filter($scope.filterr, x) || NoFilter($scope.filterr);
         } else {
         return FilterAnd($scope.filterr, x) || NoFilter($scope.filterr);
         }
}
 
} ]);

     function NoFilter(filter2){
	 return Object.keys(filter2).every( function(key) { return filter2[key] == false;} );
     }

     function Filter(filter1, x){
         for ([i,j] of Object.entries(filter1)){
             if ( x.disability.includes(i) && (filter1[i]) == true) {
               return true;
             }
         }
         return false;
     }

     function FilterAnd(filter1, x){
         for ([i,j] of Object.entries(filter1)){
             if ( !x.disability.includes(i) && (filter1[i]) == true) {
               return false;
             }
         }
         return true;
     }
