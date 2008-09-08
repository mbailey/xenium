require 'test_helper'

class HostsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:hosts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_host
    assert_difference('Host.count') do
      post :create, :host => { }
    end

    assert_redirected_to host_path(assigns(:host))
  end

  def test_should_show_host
    get :show, :id => hosts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => hosts(:one).id
    assert_response :success
  end

  def test_should_update_host
    put :update, :id => hosts(:one).id, :host => { }
    assert_redirected_to host_path(assigns(:host))
  end

  def test_should_destroy_host
    assert_difference('Host.count', -1) do
      delete :destroy, :id => hosts(:one).id
    end

    assert_redirected_to hosts_path
  end
end
