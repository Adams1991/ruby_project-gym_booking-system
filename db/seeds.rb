require_relative( "../models/trainer.rb" )
require_relative( "../models/boxer.rb" )
require_relative( "../models/fitness_class.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Boxer.delete_all()
Trainer.delete_all()
Booking.delete_all()
FitnessClass.delete_all()

trainer1 = Trainer.new({
  "first_name" => "Abel",
  "last_name" => "Sanchez",
  "premium_trainer" => "t"
  })

trainer1.save


boxer1 = Boxer.new({
  "first_name" => "Shannon",
  "last_name" => "Smith",
  "premium_member" => "t",
  "skill_level" => "Professional",
  "photo" => "/images/Shannons_picture.jpg",
  "trainer_id" => trainer1.id()
})

boxer2 = Boxer.new({
  "first_name" => "Bob",
  "last_name" => "Smith",
  "premium_member" => "f",
  "skill_level" => "Novice",
  "photo" => "/images/Bob_picture.jpg",
  "trainer_id" => trainer1.id()
})

boxer3 = Boxer.new({
  "first_name" => "Lana",
  "last_name" => "Smith",
  "premium_member" => "f",
  "skill_level" => "Professional",
  "photo" => "/images/Lana_picture.jpg",
  "trainer_id" => trainer1.id()
})

boxer1.save()
boxer2.save()
boxer3.save()

fitness_class1 = FitnessClass.new({
  "name" => "Beginners Fitness",
  "capacity" => 34,
  "duration" => "2 hours",
  "start_time" => "2018-08-16 14:00",
  "premium_members" => "t"
})

fitness_class2 = FitnessClass.new({
  "name" => "Advance Fitness",
  "capacity" => 0,
  "duration" => "2 hours",
  "start_time" => "2018-08-16 18:00",
  "premium_members" => "f"
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

booking3 = Booking.new({
  "boxer_id" => boxer2.id(),
  "fitness_class_id" => fitness_class2.id()

  })

booking1.save()
booking2.save()
booking3.save()

binding.pry
nil
