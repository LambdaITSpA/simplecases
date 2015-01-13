$(document).on 'ajax:success', 'form[data-remote]', (xhr, data, status) ->
	console.log data
	$('#cause_client_id').val(data.id)
	angular.element('#client_success').text(data.notice).show('slow').delay(1500).hide 'slow', ->
		angular.element('#addclient').modal('hide')
app = angular.module 'SCapp', []
app.controller "GetCausesController", ['$scope', '$http', ($scope, $http) ->
	$http.get('/causes.json').success (data) ->
		console.log data
		$scope.causes = data
	$http.get('/clients.json').success (data) ->
		console.log data
		$scope.clients = data
]
app.controller "GetClientController", ['$scope', '$http', ($scope, $http) ->
	$scope.getClient = -> 
		rut = angular.element('#client_id_number').val()
		$http.get('/clients.json?id_number=' + rut).success (data, status) ->
			console.log 'code: ' + status
			angular.element('#cause_client_id').val(data.id)
		.error (data, status) ->
			$http.get('https://siichile.herokuapp.com/consulta?rut=' + rut).success (data, status) ->
				angular.element('.company_name').val(data.razon_social)
				angular.element('.person_name').val(data.razon_social)
			angular.element('.id_number_company').val(rut)
			angular.element('.id_number_person').val(rut)																																																																								
			angular.element('#addclient').modal('show')
			angular.element('#cause_client_id').val(null)
]
app.controller "CourtController", ['$scope', '$http', ($scope, $http) ->
	$scope.area_select = 1
	console.log(angular.element('#cause_area_id').val())
	$http.get('/courts.json?area_id=' + angular.element('#cause_area_id').val()).success (data, status) ->
		$scope.courts = data
	$scope.getCourts = ->
		$http.get('/courts.json?area_id=' + angular.element('#cause_area_id').val()).success (data, status) ->
			$scope.courts = data
]