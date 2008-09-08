require 'test_helper'

class IpsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ips)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_ip
    assert_difference('Ip.count') do
      post :create, :ip => { }
    end

    assert_redirected_to ip_path(assigns(:ip))
  end

  def test_should_show_ip
    get :show, :id => ips(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => ips(:one).id
    assert_response :success
  end

  def test_should_update_ip
    put :update, :id => ips(:one).id, :ip => { }
    assert_redirected_to ip_path(assigns(:ip))
  end

  def test_should_destroy_ip
    assert_difference('Ip.count', -1) do
      delete :destroy, :id => ips(:one).id
    end

    assert_redirected_to ips_path
  end
end
