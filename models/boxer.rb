require_relative('../db/sql_runner')

class Boxer

attr_reader(:id, :first_name, :last_name)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

end
