app = angular.module 'SCapp', []
app.controller "GetCausesController", ($scope, $http) ->
	$http.get('http://webapp.dev/causes.json').success (data) ->
		console.log data
		$scope.causes = data
	$http.get('http://webapp.dev/clients.json').success (data) ->
		console.log data
		$scope.clients = data
app.controller "GetClientController", ($scope, $http) ->
	$scope.getClient = -> 
		$http.get('http://webapp.dev/clients.json?id_number=' + angular.element('#client_id_number').val()).success (data, status) ->
			if status == 200
				angular.element('#cause_client_id').val(data.id)
			else
				console.log 'No está'
				angular.element('#cause_client_id').val(null)
app.controller "CourtController", ($scope, $http) ->
	$scope.area_select = 1
	console.log(angular.element('#cause_area_id').val())
	$http.get('http://webapp.dev/courts.json?area_id=' + angular.element('#cause_area_id').val()).success (data, status) ->
		$scope.courts = data
	$scope.getCourts = ->
		$http.get('http://webapp.dev/courts.json?area_id=' + angular.element('#cause_area_id').val()).success (data, status) ->
			$scope.courts = data