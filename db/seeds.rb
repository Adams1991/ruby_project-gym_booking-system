require_relative( "../models/boxer.rb" )
require_relative( "../models/fitness_class.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Boxer.delete_all()

boxer1 = Boxer.new({
  "first_name" => "Bob",
  "last_name" => "Smith"
})

boxer1.save()

fitness_class1 = FitnessClass.new({
  "name" => "Beginners Fitness"
})

fitness_class1.save()

binding.pry
nil
