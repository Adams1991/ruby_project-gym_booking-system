require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/boxer.rb' )
require_relative( '../models/fitness_class.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

# INDEX
get('/bookings') do
  @bookings = Booking.all()
  erb ( :"bookings/index" )
end

# NEW
get('/bookings/new') do
  @boxers = Boxer.all()
  @fitness_classes = FitnessClass.all()
  erb( :"bookings/new" )
end

#SHOW
get('/bookings/:id') do
  @booking = Booking.find(params['id'].to_i)
  erb(:"booking/show")
end

#CREATE
post('/bookings') do
  @booking = Booking.new(params)
  @fitness_class = FitnessClass.find(@booking.fitness_class_id())
  @fitness_class.reduce_capacity()
  @fitness_class.update()
  @booking.save()
  erb ( :"bookings/create" )
end

# DELETE
get('/bookings/:id/delete') do
  @booking = Booking.find(params[:id].to_i)
  @fitness_class = FitnessClass.find(@booking.fitness_class_id())
  @fitness_class.increase_capacity()
  @fitness_class.update()
  @booking.delete()
  erb( :"boxers/destroy" )
end

post('/bookings/:boxer_id/:fitness_class_id') do
  Booking.delete_by_details(params[:boxer_id], params[:fitness_class_id])
end
