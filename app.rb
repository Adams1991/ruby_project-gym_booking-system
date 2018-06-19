require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/trainers_controller')
require_relative('controllers/boxers_controller')
require_relative('controllers/fitness_classes_controller')
require_relative('controllers/bookings_controller')


get '/' do
  erb( :index )
end
