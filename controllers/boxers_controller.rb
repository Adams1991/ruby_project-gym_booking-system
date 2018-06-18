require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/boxer.rb' )
also_reload( '../models/*' )

# INDEX
get('/boxers') do
  @boxers = Boxer.all()
  erb ( :"boxers/index" )
end

# NEW
get('/boxers/new') do
  erb( :"boxers/new" )
end

#SHOW
get('/boxers/:id') do
  @boxer = Boxer.find(params['id'].to_i)
  erb(:"boxers/show")
end

#CREATE
post('/boxers') do
  @boxer = Boxer.new(params)
  @boxer.save()
  erb ( :"boxers/create" )
end

# DELETE
get('/boxers/:id/delete') do
  boxer = Boxer.find(params[:id].to_i)
  boxer.delete()
  erb( :"boxers/destroy" )
end

# EDIT
get('/boxers/:id/edit') do
  @boxer = Boxer.find(params[:id].to_i)
  erb( :"boxers/edit" )
end

#UPDATE
post('/boxers/:id') do
  @boxer = Boxer.new(params)
  @boxer.update()
  erb( :"boxers/update" )
end
