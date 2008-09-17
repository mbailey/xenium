require 'test_helper'

class SlicesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:slices)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_slice
    assert_difference('Slice.count') do
      post :create, :slice => { }
    end

    assert_redirected_to slice_path(assigns(:slice))
  end

  def test_should_show_slice
    get :show, :id => slices(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => slices(:one).id
    assert_response :success
  end

  def test_should_update_slice
    put :update, :id => slices(:one).id, :slice => { }
    assert_redirected_to slice_path(assigns(:slice))
  end

  def test_should_destroy_slice
    assert_difference('Slice.count', -1) do
      delete :destroy, :id => slices(:one).id
    end

    assert_redirected_to slices_path
  end
end
