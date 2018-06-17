require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/boxer.rb' )
also_reload( '../models/*' )

get '/boxers' do
  @boxers = Boxer.all()
  erb ( :"boxers/index" )
end

get '/boxers/:id' do
  @boxer = Boxer.find(params['id'].to_i)
  erb(:"boxers/show")
end
