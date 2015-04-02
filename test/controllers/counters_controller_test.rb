require 'test_helper'

class CountersControllerTest < ActionController::TestCase
  setup do
    @counter = counters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:counters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create counter" do
    assert_difference('Counter.count') do
      post :create, counter: { belongs_to: @counter.belongs_to, cold_water: @counter.cold_water, comment: @counter.comment, electro: @counter.electro, gas: @counter.gas, hot_water: @counter.hot_water, tariff_id: @counter.tariff_id }
    end

    assert_redirected_to counter_path(assigns(:counter))
  end

  test "should show counter" do
    get :show, id: @counter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @counter
    assert_response :success
  end

  test "should update counter" do
    patch :update, id: @counter, counter: { belongs_to: @counter.belongs_to, cold_water: @counter.cold_water, comment: @counter.comment, electro: @counter.electro, gas: @counter.gas, hot_water: @counter.hot_water, tariff_id: @counter.tariff_id }
    assert_redirected_to counter_path(assigns(:counter))
  end

  test "should destroy counter" do
    assert_difference('Counter.count', -1) do
      delete :destroy, id: @counter
    end

    assert_redirected_to counters_path
  end
end
