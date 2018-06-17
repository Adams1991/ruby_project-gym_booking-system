require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/boxer.rb' )
also_reload( '../models/*' )

# INDEX
get '/boxers' do
  @boxers = Boxer.all()
  erb ( :"boxers/index" )
end

# NEW
get('/boxers/new') do
  erb( :"boxers/new" )
end

#SHOW
get '/boxers/:id' do
  @boxer = Boxer.find(params['id'].to_i)
  erb(:"boxers/show")
end
