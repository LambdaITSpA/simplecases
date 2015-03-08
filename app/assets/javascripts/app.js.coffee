$(document).on 'ajax:success', 'form[data-remote]', (xhr, data, status) ->
	console.log data
	$('#cause_client_id').val(data.id)
	angular.element('#client_success').text(data.notice).show('slow').delay(1500).hide 'slow', ->
		angular.element('#addclient').modal('hide')
app = angular.module 'SCapp', ['angular-bootstrap-select']
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
angular.module('angular-bootstrap-select', []).directive 'selectpicker', ['$parse', ($parse) ->
    {
      restrict: 'A'
      link: (scope, element, attrs) ->
        element.selectpicker $parse(attrs.selectpicker)()
        element.selectpicker 'refresh'
        scope.$watch attrs.ngModel, (newVal, oldVal) ->
          scope.$parent[attrs.ngModel] = newVal
          scope.$evalAsync ->
            if !attrs.ngOptions or /track by/.test(attrs.ngOptions)
              element.val newVal
            element.selectpicker 'refresh'
            return
          return
        scope.$on '$destroy', ->
          scope.$evalAsync ->
            element.selectpicker 'destroy'
            return
          return
        return

    }
app.factory 'socket', [
  '$rootScope'
  ($rootScope) ->
    socket = io.connect('http://0.0.0.0:5001')
    {
      on: (eventName, callback) ->
        socket.on eventName, ->
          args = arguments
          $rootScope.$apply ->
            callback.apply socket, args
            return
          return
        return
      emit: (eventName, data, callback) ->
        socket.emit eventName, data, ->
          args = arguments
          $rootScope.$apply ->
            if callback
              callback.apply socket, args
            return
          return
        return
    }
]
app.filter 'reverse', ->
  (items) ->
    items.slice().reverse()
app.controller "NotificationsController", ['$scope', '$http', 'socket', ($scope, $http, socket) ->
	$scope.notifications = []
	$http.get('/notifications.json').success (data) ->
		$scope.notifications = data
	$scope.$watch 'user_id', ->
		channel = $scope.user_id+'-n'
		console.log channel
		socket.on channel, (message) ->
			$.gritter.add
				title: message.subject,
				text: message.description,
				#image: 'http://a0.twimg.com/profile_images/59268975/jquery_avatar_bigger.png',
				sticky: false,
				time: 8000,
				class_name: 'my-class'
			$scope.notifications.push message
]