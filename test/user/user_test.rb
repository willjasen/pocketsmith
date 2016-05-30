require './test/test_helper'

class PocketsmithUserTest < Minitest::Test
  def test_exists
    assert Pocketsmith::User
  end

  def test_it_gives_back_a_single_user
    VCR.use_cassette('one_user') do
      user = Pocketsmith::User.me
      assert_equal Pocketsmith::User, user.class

      # Check that the fields are accessible by our model
      assert_operator user.id, :>, 0
      #assert_equal "login", user.login
      #assert_equal "name", user.name
      #assert_equal "email", user.email
      #assert_equal "avatar_url", user.avatar_url
      #assert_equal "beta_user", user.beta-user
      #assert_equal "time_zone", user.time_zone
      #assert_equal "week_start_day", user.week_start_day
      #assert_equal "base_currency_code", user.base_currency_code
      #assert_equal "always_show_base_currency", user.always_show_base_currency
      #assert_equal "using_multiple_currencies", user.using_multiple_currencies
    end
  end 

end
