require_relative('../db/sql_runner')
require_relative('./booking')
require_relative('./fitness_class')

class FitnessClass

attr_accessor(:id, :name, :capacity)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO fitness_classes
    (
      name,
      capacity
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE fitness_classes
    SET name = $1, capacity = $2
    WHERE id = $3"
    values = [@name,@capacity, @id]
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

  def self.find_class_with_space
    sql = "SELECT *
           FROM fitness_classes"
    results = SqlRunner.run( sql )
    return results.map { |hash| FitnessClass.new( hash ) if hash["capacity"].to_i > 0 }
  end

  def add_member(boxer)
    Booking.new('fitness_class_id' => @id, "boxer_id" => boxer.id ).save()
  end

  def reduce_capacity
    @capacity -= 1
  end

  def increase_capacity
    @capacity += 1
  end


  def self.map_items(fitness_class_data)
    result = fitness_class_data.map { |fitness_class| FitnessClass.new(fitness_class) }
    return result
  end

end
