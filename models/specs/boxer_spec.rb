require("minitest/autorun")
require_relative("../boxer")

class TestBoxer < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "John Adams"}

    @boxer = Boxer.new(options)
  end

  def test_name()
    result = @boxer.name()
    assert_equal("John Adams", result)
  end

  def test_id()
    result = @boxer.id()
    assert_equal(1, result)
  end



end
