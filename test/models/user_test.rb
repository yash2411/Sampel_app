require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Yash', email: 'yash@gmail.com')
  end
  
  test "name should be present" do
    @user=""
    assert_not @user.valid?
  end
end
