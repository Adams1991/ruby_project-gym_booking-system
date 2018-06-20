require_relative('../db/sql_runner')
require_relative('./booking')
require_relative('./fitness_class')
require_relative('./boxer')

class FitnessClass

attr_accessor(:id, :name, :capacity, :duration,:start_time, :premium_members)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @capacity = options['capacity'].to_i
    @duration = options['duration']
    @start_time = options['start_time']
    @premium_members = options['premium_members'] == "t" || options['premium_members'] == "true" ? true : false
  end

  def save()
    sql = "INSERT INTO fitness_classes
    (
      name,
      capacity,
      duration,
      start_time,
      premium_members
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @capacity, @duration,@start_time, @premium_members]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE fitness_classes
    SET name = $1, capacity = $2, duration = $3, start_time = $4, premium_members =$5
    WHERE id = $6"
    values = [@name,@capacity,@duration, @start_time, @premium_members, @id]
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
    reduce_capacity()
    Booking.new('fitness_class_id' => @id, "boxer_id" => boxer.id ).save()
  end

  def is_full?
    return @capacity <= 0
  end

  def reduce_capacity
    @capacity -= 1
  end

  def increase_capacity
    @capacity += 1
  end

  def create_booking(boxer_id)
  @boxer = Boxer.find(boxer_id)
    if !is_full? && ((@premium_members && @boxer.premium_member) || (!@premium_members))
      reduce_capacity()
      return true
    end
    return false
  end

  def convert_boolean
    @premium_members == true ? "Yes" : "No"
  end


  def self.map_items(fitness_class_data)
    result = fitness_class_data.map { |fitness_class| FitnessClass.new(fitness_class) }
    return result
  end

end
