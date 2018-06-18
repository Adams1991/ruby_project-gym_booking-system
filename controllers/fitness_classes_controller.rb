require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/fitness_class.rb' )
also_reload( '../models/*' )


# INDEX
get('/fitness_class') do
  @fitness_classes = FitnessClass.all()
  erb ( :"fitness_classes/index" )
end

# NEW
get('/fitness_classes/new') do
  erb( :"fitness_classes/new" )
end

#SHOW
get('/fitness_classes/:id') do
  @fitness_class = Boxer.find(params['id'].to_i)
  erb(:"fitness_classes/show")
end

#CREATE
post('/fitness_classes') do
  @fitness_class = Boxer.new(params)
  @fitness_class.save()
  erb ( :"fitness_classes/create" )
end
