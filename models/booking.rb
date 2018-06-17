require_relative('../db/sql_runner')

class Booking

attr_reader(:id, :boxer_id, :fitness_class_id)

  def initialize(options)
    @id = options['id'].to_i
    @boxer_id = options['boxer_id']
    @fitness_class_id = options['fitness_class_id']
  end



end
