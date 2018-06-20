require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/boxer.rb' )
require_relative( '../models/trainer.rb' )
require_relative( '../models/fitness_class.rb' )
also_reload( '../models/*' )

# INDEX
get('/boxers') do
  @boxers = Boxer.all()
  erb ( :"boxers/index" )
end

# NEW
get('/boxers/new') do
  @trainers = Trainer.all()
  @boxers = Boxer.all()
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
  @trainers = Trainer.all()
  @boxer = Boxer.find(params[:id].to_i)
  erb( :"boxers/edit" )
end

#UPDATE
post('/boxers/:id') do
  @boxer = Boxer.new(params)
  @boxer.update()
  erb( :"boxers/update" )
end

#CLASSES BOOKED
get('/boxers/:id/fitness_classes') do
  @boxer = Boxer.find(params[:id].to_i)
  @fitness_classes = @boxer.fitness_classes()
  erb( :"boxers/fitness_classes" )
end

#MAKE NEW BOOKING FOR BOXER
get('/boxers/:id/booking') do
  @boxer = Boxer.find(params[:id].to_i)
  @fitness_classes = FitnessClass.all()
  erb( :"boxers/boxer_booking" )
end

#SKILL_MOT
get('/boxers/:id/skill_mot') do
  @boxer = Boxer.find(params[:id].to_i)
  erb( :"boxers/skill_mot" )
end

post('/boxers/:id/skill_mot') do
  @boxer = Boxer.find(params[:id].to_i)
  @skill_array = @boxer.get_skill_array(params)
  @skill_score = @boxer.get_skill_score(@skill_array)
  @boxer.assign_skill_level(@skill_score)
  redirect to '/boxers'
end
