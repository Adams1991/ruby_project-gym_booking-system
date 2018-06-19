require("minitest/autorun")
require_relative("../trainer")

class TestTrainer < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "Baba", "last_name" => "Gouch", "premium_trainer" => true}

    @trainer= Trainer.new(options)
  end

  def test_first_name()
    result = @trainer.first_name()
    assert_equal("Baba", result)
  end

  def test_last_name()
    result = @trainer.last_name()
    assert_equal("Gouch", result)
  end

  def test_id()
    result = @trainer.id()
    assert_equal(1, result)
  end

  def test_premium_member()
    result = @trainer.premium_trainer()
    assert_equal(true, result)
  end

  def test_full_name
    result = @trainer.full_name()
    assert_equal("Baba Gouch", result)
  end



end
