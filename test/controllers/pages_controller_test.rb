require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test "view should have a flash div" do
    get :home
    assert_select ".alert", "success"
  end

end
