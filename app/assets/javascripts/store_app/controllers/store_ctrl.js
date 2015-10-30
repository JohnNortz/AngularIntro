( function() {
  var app = angular.module('StoreApp', [])
  app.controller('StoreController', ['$scope', '$http', function($scope, $http) {
    $scope.products = [];
    $scope.errors = [];

    $scope.index = function () {
      $http.get('gemstones').success(function(data){
        $scope.products = data.gemstones;
      });
    };

    $scope.create = function (gemstone) {
      $http.post('gemstones', { gemstone: gemstone }).success(function(data){
        $scope.products.push(data.gemstone);
        })
        .error(function(data) {
          $scope.errors;
        });
    };

    $scope.update = function (gemstone) {
      $http.patch( "gemstones/" + gemstone.id,
        {gemstone: gemstone} )
      .success(function(data) {
        //console.log(gemstone)
        //gemstone.editing = false;
      })
      .errors(function(data){
        $scope.errors;
      })

    };

  }]);

})();
