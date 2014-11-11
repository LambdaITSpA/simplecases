app = angular.module 'SCapp', []
app.controller "GetCausesController", ($scope, $http) ->
	$http.get('http://webapp.dev/causes.json').success (data) ->
		console.log data
		$scope.causes = data
	$http.get('http://webapp.dev/clients.json').success (data) ->
		console.log data
		$scope.clients = data