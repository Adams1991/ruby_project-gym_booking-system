require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/fitness_class.rb' )
also_reload( '../models/*' )


# INDEX
get('/fitness_classes') do
  @fitness_classes = FitnessClass.all()
  erb ( :"fitness_classes/index" )
end

# NEW
get('/fitness_classes/new') do
  erb( :"fitness_classes/new" )
end

#SHOW
get('/fitness_classes/:id') do
  @fitness_class = FitnessClass.find(params['id'].to_i)
  erb(:"fitness_classes/show")
end

#CREATE
post('/fitness_classes') do
  @fitness_class = FitnessClass.new(params)
  @fitness_class.save()
  erb ( :"fitness_classes/create" )
end

# DELETE
get('/fitness_classes/:id/delete') do
  fitness_class = FitnessClass.find(params[:id].to_i)
  fitness_class.delete()
  erb( :"fitness_classes/destroy" )
end

# EDIT
get('/fitness_classes/:id/edit') do
  @fitness_class = FitnessClass.find(params[:id].to_i)
  erb( :"fitness_classes/edit" )
end

#UPDATE
post('/fitness_classes/:id') do
  @fitness_class = FitnessClass.new(params)
  @fitness_class.update()
  erb( :"fitness_classes/update")
end

#BOXERS IN CLASS
get('/fitness_classes/:id/boxers') do
  @fitness_class = FitnessClass.find(params[:id].to_i)
  @boxers = @fitness_class.boxers()
  erb( :"fitness_classes/boxers" )
end
