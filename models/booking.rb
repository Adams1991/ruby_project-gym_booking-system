require_relative('../db/sql_runner')

class Booking

attr_reader(:id, :boxer_id, :fitness_class_id)

  def initialize(options)
    @id = options['id'].to_i
    @boxer_id = options['boxer_id']
    @fitness_class_id = options['fitness_class_id']
  end

  def save()
    sql = "INSERT INTO bookings
    (
      boxer_id,
      fitness_class_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@boxer_id, @fitness_class_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end


end
