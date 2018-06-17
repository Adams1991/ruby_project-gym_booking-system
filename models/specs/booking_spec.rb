require("minitest/autorun")
require_relative("../fitness_class")
require_relative("../boxer")
require_relative("../booking")

class TestFitnessClass < MiniTest::Test

  def setup
    options = {"id" => 1, "boxer_id" => 2, "fitness_class_id" => 4}

    @booking = Booking.new(options)
  end


end
