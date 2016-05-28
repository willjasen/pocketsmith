require './test/test_helper'

class PocketsmithUserTest < Minitest::Test
  def test_exists
    assert Pocketsmith::User
  end
end
