require("minitest/autorun")
require_relative("../boxer")

class TestBoxer < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "John", "last_name" => "Adams"}

    @boxer = Boxer.new(options)
  end

  def test_first_name()
    result = @boxer.first_name()
    assert_equal("John", result)
  end

  def test_last_name()
    result = @boxer.last_name()
    assert_equal("Adams", result)
  end

  def test_id()
    result = @boxer.id()
    assert_equal(1, result)
  end

  def test_full_name
    result = @boxer.full_name()
    assert_equal("John Adams", result)
  end



end
