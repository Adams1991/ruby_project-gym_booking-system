require("minitest/autorun")
require_relative("../fitness_class")

class TestFitnessClass < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "General Fitness", "start_time" => "19:00"}

    @fitness_class = FitnessClass.new(options)
  end

  def test_name()
    result = @fitness_class.name()
    assert_equal("General Fitness", result)
  end


end
