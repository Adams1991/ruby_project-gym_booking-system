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

  def test_id()
    result = @fitness_class.id()
    assert_equal(1, result)
  end

  def test_start_time()
    result = @fitness_class.start_time()
    assert_equal("19:00", result)
  end


end
