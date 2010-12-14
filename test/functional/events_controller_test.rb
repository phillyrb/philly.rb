require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  def test_should_show_event
    get :show, :id => events(:one).id
    assert_response :success
  end
end
