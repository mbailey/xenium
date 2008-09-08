require 'test_helper'

class DomainsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:domains)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_domain
    assert_difference('Domain.count') do
      post :create, :domain => { }
    end

    assert_redirected_to domain_path(assigns(:domain))
  end

  def test_should_show_domain
    get :show, :id => domains(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => domains(:one).id
    assert_response :success
  end

  def test_should_update_domain
    put :update, :id => domains(:one).id, :domain => { }
    assert_redirected_to domain_path(assigns(:domain))
  end

  def test_should_destroy_domain
    assert_difference('Domain.count', -1) do
      delete :destroy, :id => domains(:one).id
    end

    assert_redirected_to domains_path
  end
end
