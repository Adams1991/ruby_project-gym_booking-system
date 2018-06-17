require("minitest/autorun")
require_relative("../fitness_class")
require_relative("../boxer")
require_relative("../booking")

class TestFitnessClass < MiniTest::Test

  def setup
    options = {"id" => 1, "boxer_id" => 2, "fitness_class_id" => 4}

    @booking = Booking.new(options)
  end

  def test_id()
    result = @booking.id()
    assert_equal(1, result)
  end

  def test_boxer_id()
    result = @booking.boxer_id()
    assert_equal(2, result)
  end

  def test_fitness_class_id()
    result = @booking.fitness_class_id()
    assert_equal(4, result)
  end


end
