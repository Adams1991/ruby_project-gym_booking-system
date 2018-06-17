require("minitest/autorun")
require_relative("../boxer")

class TestBoxer < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "John Adams"}

    @boxer = Boxer.new(options)
  end


end
