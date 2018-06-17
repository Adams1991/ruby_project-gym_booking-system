require_relative( "../models/boxer.rb" )
require_relative( "../models/fitness_class.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Booking.delete_all()
Boxer.delete_all()
FitnessClass.delete_all()


boxer1 = Boxer.new({
  "first_name" => "Bob",
  "last_name" => "Smith"
})

boxer1.save()

fitness_class1 = FitnessClass.new({
  "name" => "Beginners Fitness"
})

fitness_class2 = FitnessClass.new({
  "name" => "Advance Fitness"
})

fitness_class1.save()
fitness_class2.save()

booking1 = Booking.new({
  "boxer_id" => boxer1.id(),
  "fitness_class_id" => fitness_class1.id()

  })

booking2 = Booking.new({
  "boxer_id" => boxer1.id(),
  "fitness_class_id" => fitness_class2.id()

  })

booking1.save()
booking2.save()

binding.pry
nil
