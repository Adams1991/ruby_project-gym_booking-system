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

#CREATE
post('/bookings') do
  @booking = Booking.new(params)
  @booking.save()
  erb ( :"bookings/create" )
end

# DELETE
get('/bookings/:id/delete') do
  booking = Booking.find(params[:id].to_i)
  booking.delete()
  erb( :"boxers/destroy" )
end
