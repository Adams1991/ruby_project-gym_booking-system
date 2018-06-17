require("minitest/autorun")
require_relative("../fitness_class")

class TestFitnessClass < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "General Fitness", "start_time" => "19:00"}

    @fitness_class = FitnessClass.new(options)
  end


end
