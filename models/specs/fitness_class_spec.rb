require("minitest/autorun")
require_relative("../fitness_class")

class TestFitnessClass < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "General Fitness", "capacity" => 30,  "duration" => "2 hours", "start_time" => "2018-08-16 18:00", "premium_members" => "t"}

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

  def test_duration()
    result = @fitness_class.duration()
    assert_equal("2 hours", result)
  end

  def test_premium_members()
    result = @fitness_class.premium_members()
    assert_equal(true, result)
  end

  def test_start_time()
    result = @fitness_class.start_time()
    assert_equal("2018-08-16 18:00", result)
  end

end
