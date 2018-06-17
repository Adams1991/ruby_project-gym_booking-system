require_relative('../db/sql_runner')

class FitnessClass

attr_reader(:id, :name, :start_time)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @start_time = options['start_time']
  end

end
