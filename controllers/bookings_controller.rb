require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/boxer.rb' )
require_relative( '../models/fitness_class.rb' )
require_relative( '../models/booking.rb' )
# also_reload( '../models/*' )

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
  if @fitness_class.create_booking(@booking.boxer_id())
    @fitness_class.update()
    @booking.save()
    erb ( :"bookings/create" )
  else
    erb ( :"bookings/not_created" )
  end
end

# DELETE
get('/bookings/:id/delete') do
  @booking = Booking.find(params[:id].to_i)
  @fitness_class = FitnessClass.find(@booking.fitness_class_id())
  @fitness_class.increase_capacity()
  @fitness_class.update()
  @booking.delete()
  erb( :"bookings/destroy" )
end

#DELETE VIA BOXER
post('/bookings/:fitness_class_id/:boxer_id') do
  @fitness_class = FitnessClass.find(params[:fitness_class_id])
  @fitness_class.increase_capacity()
  @fitness_class.update()
  Booking.delete_by_details(params[:fitness_class_id],params[:boxer_id] )
  redirect to '/boxers'
end
