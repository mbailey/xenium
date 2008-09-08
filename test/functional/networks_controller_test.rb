require 'test_helper'

class NetworksControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:networks)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_network
    assert_difference('Network.count') do
      post :create, :network => { }
    end

    assert_redirected_to network_path(assigns(:network))
  end

  def test_should_show_network
    get :show, :id => networks(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => networks(:one).id
    assert_response :success
  end

  def test_should_update_network
    put :update, :id => networks(:one).id, :network => { }
    assert_redirected_to network_path(assigns(:network))
  end

  def test_should_destroy_network
    assert_difference('Network.count', -1) do
      delete :destroy, :id => networks(:one).id
    end

    assert_redirected_to networks_path
  end
end
