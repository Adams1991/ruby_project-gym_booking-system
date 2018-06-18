require_relative('../db/sql_runner')
require_relative('./booking')
require_relative('./fitness_class')

class FitnessClass

attr_accessor(:id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO fitness_classes
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE fitness_classes
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE
    FROM fitness_classes
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = "DELETE FROM fitness_classes"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM fitness_classes"
    results = SqlRunner.run( sql )
    return results.map { |hash| FitnessClass.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM fitness_classes
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return FitnessClass.new( results.first )
  end

  def boxers()
    sql = "SELECT boxers.*
    FROM boxers
    INNER JOIN bookings
    ON bookings.boxer_id = boxers.id
    WHERE fitness_class_id = $1"
    values = [@id]
    boxer_data = SqlRunner.run(sql, values)
    return Boxer.map_items(boxer_data)
  end

  def add_member(boxer)
    Booking.new('fitness_class_id' => @id, "boxer_id" => boxer.id ).save()
  end


  def self.map_items(fitness_class_data)
    result = fitness_class_data.map { |fitness_class| FitnessClass.new(fitness_class) }
    return result
  end

end
