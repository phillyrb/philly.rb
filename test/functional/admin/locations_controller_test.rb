require 'test_helper'

class Admin::LocationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_location
    assert_difference('Location.count') do
      post :create, :location => { :name => "Comcast",
                                   :address_1 => "17th & JFK",
                                   :city => "Philadelphia",
                                   :state => "PA",
                                   :zip => "19103" }
    end

    assert_redirected_to admin_location_path(assigns(:location))
  end

  def test_should_show_location
    get :show, :id => locations(:flannerys).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => locations(:flannerys).id
    assert_response :success
  end

  def test_should_update_location
    put :update, :id => locations(:flannerys).id, :location => { }
    assert_redirected_to admin_location_path(assigns(:location))
  end

  def test_should_destroy_location
    assert_difference('Location.count', -1) do
      delete :destroy, :id => locations(:flannerys).id
    end

    assert_redirected_to admin_locations_path
  end
end
