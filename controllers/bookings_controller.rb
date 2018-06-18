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

# # DELETE
# get('//:id/delete') do
#   boxer = Boxer.find(params[:id].to_i)
#   boxer.delete()
#   erb( :"boxers/destroy" )
# end
#
# # EDIT
# get('/boxers/:id/edit') do
#   @boxer = Boxer.find(params[:id].to_i)
#   erb( :"boxers/edit" )
# end
#
# #UPDATE
# post('/boxers/:id') do
#   @boxer = Boxer.new(params)
#   @boxer.update()
#   erb( :"boxers/update" )
# end

# #ADD TO CLASS
# post('boxers/:id/add_to_class') do
#   @fitness_classes = FitnessClass.all()
#   @boxer = Boxer.find(params[:id].to_i)
#   @boxer.add_fitness_class(params)
# end
