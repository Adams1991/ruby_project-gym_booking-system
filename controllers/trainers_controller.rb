require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/trainer.rb' )
also_reload( '../models/*' )


# INDEX
get('/trainers') do
  @trainers = Trainer.all()
  erb ( :"trainers/index" )
end

# NEW
get('/trainers/new') do
  erb( :"trainers/new" )
end

#SHOW
get('/trainers/:id') do
  @trainer = Trainer.find(params['id'].to_i)
  erb(:"trainers/show")
end

#CREATE
post('/trainers') do
  @trainer = Trainer.new(params)
  @trainer.save()
  erb ( :"trainers/create" )
end

# DELETE
get('/trainers/:id/delete') do
  trainer = Trainer.find(params[:id].to_i)
  trainer.delete()
  erb( :"trainers/destroy" )
end

# EDIT
get('/trainers/:id/edit') do
  @trainer = Trainer.find(params[:id].to_i)
  erb( :"trainers/edit" )
end

#UPDATE
post('/trainers/:id') do
  @trainer = Trainer.new(params)
  @trainer.update()
  erb( :"trainers/update")
end

#BOXERS IN CLASS
get('/trainers/:id/boxers') do
  @trainer = Trainer.find(params[:id].to_i)
  @boxers = @trainer.boxers()
  erb( :"trainers/boxers" )
end
