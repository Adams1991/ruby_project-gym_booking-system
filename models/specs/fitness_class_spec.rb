require("minitest/autorun")
require_relative("../fitness_class")

class TestFitnessClass < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "General Fitness", "capacity" => 30}

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

  def test_capacity()
    result = @fitness_class.capacity()
    assert_equal(30, result)
  end

end
