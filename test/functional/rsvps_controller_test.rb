require 'test_helper'

class RsvpsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Rsvp.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Rsvp.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to rsvps_url
  end
  
  def test_edit
    get :edit, :id => Rsvp.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Rsvp.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Rsvp.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Rsvp.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Rsvp.first
    assert_redirected_to rsvps_url
  end
end
