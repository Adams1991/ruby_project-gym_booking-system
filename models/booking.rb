require_relative('../db/sql_runner')

class Booking

attr_reader(:id, :boxer_id, :fitness_class_id)

  def initialize(options)
    @id = options['id'].to_i
    @boxer_id = options['boxer_id'].to_i
    @fitness_class_id = options['fitness_class_id'].to_i
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

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |hash| Booking.new( hash ) }
  end

  def boxer()
    sql = "SELECT *
    FROM boxers
    WHERE id = $1"
    values = [@boxer_id]
    boxer = SqlRunner.run(sql, values).first
    return Boxer.new(boxer)
  end

  def fitness_class()
    sql = "SELECT *
    FROM fitness_classes
    WHERE id = $1"
    values = [@fitness_class_id]
    fitness_class = SqlRunner.run(sql, values).first
    return FitnessClass.new(fitness_class)
  end

  def self.find( id )
    sql = "SELECT * FROM bookings
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Booking.new( results.first )
  end


end
