# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

countersApp = angular.module('countersApp', ['ngResource', 'ng-rails-csrf'])

countersApp.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

countersApp.controller 'countersCtl', ($scope, $http) ->
  $scope.$on '$viewContentLoaded', ->
    console.log('document is ready')
    alert($scope.selected_year)
    $scope.selected_year = $scope.counters[1] # new Date.getFullYear()
    alert($scope.selected_year)
  $scope.counters = [
    {lable : '1975', value : '200,1'},
    {lable : '2015', value : '200,0'} 
  ]
  $scope.years = [2014, 2015]

  $scope.renderTariffForm = () ->
    $('.test_div').html("""
    <form role="form" class="form-horizontal" id="new_tariff" action="/tariffs" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="" />

        <div class="form-group"><label class="control-label col-sm-2" for="tariff_tariff_started">Tariff started</label><div class="col-sm-10"><input class="form-control" type="date" name="tariff[tariff_started]" id="tariff_tariff_started" /></div></div>
        <div class="form-group"><label class="control-label col-sm-2" for="tariff_gas">Gas</label><div class="col-sm-10"><input class="form-control" type="text" name="tariff[gas]" id="tariff_gas" /></div></div>
        <div class="form-group"><label class="control-label col-sm-2" for="tariff_cold_water">Cold water</label><div class="col-sm-10"><input class="form-control" type="text" name="tariff[cold_water]" id="tariff_cold_water" /></div></div>
        <div class="form-group"><label class="control-label col-sm-2" for="tariff_hot_water">Hot water</label><div class="col-sm-10"><input class="form-control" type="text" name="tariff[hot_water]" id="tariff_hot_water" /></div></div>
        <div class="form-group"><label class="control-label col-sm-2" for="tariff_hot_water_sink">Hot water sink</label><div class="col-sm-10"><input class="form-control" type="text" name="tariff[hot_water_sink]" id="tariff_hot_water_sink" /></div></div>
        <div class="form-group"><label class="control-label col-sm-2" for="tariff_electricity">Electricity</label><div class="col-sm-10"><input class="form-control" type="text" name="tariff[electricity]" id="tariff_electricity" /></div></div>
        <div class="form-group"><label class="control-label col-sm-2" for="tariff_comment">Comment</label><div class="col-sm-10"><input class="form-control" type="text" name="tariff[comment]" id="tariff_comment" /></div></div>

      <div class="actions">
        <input type="submit" name="commit" value="Create Tariff" class="btn btn-default" />
      </div>
      </form>
      """)
    return true  

  $scope.chooseYear = () ->
    alert($scope.selected_year)
    #get_table($scope.selected_year)
    $http(
      method: 'POST'
      url: '/ajax'
      data:{year: '2015'}).success((data, status) ->
        counters_array = angular.fromJson(data)
        $('.test_div').html(counters_array)
        for c in counters_array
          console.log(c.comment)
        return
    ).error (data, status) ->
      return

countersApp.filter 'range', ->
  (input, min, max) ->
    min = parseInt(min)
    #Make string input int
    max = new Date().getFullYear()
    i = min
    while i < max
      input.push i
      i++
    input

render_table = (data) ->
  $(".test_div").html(data)  
