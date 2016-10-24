require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validations: user must have an email" do
      user = User.new
      assert_not user.valid?
      assert user.errors.keys.include?(:email), "email is not in the errors hash"
    end

  test "validations: user must have a uid" do
      user = User.new
      assert_not user.valid?
      assert user.errors.keys.include?(:uid), "uid is not in the errors hash"
    end
end
