require_relative('../db/sql_runner')
require_relative('./booking')
require_relative('./fitness_class')
require_relative('./trainer')

class Boxer

attr_accessor(:id, :first_name, :last_name, :premium_member, :trainer_id)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @premium_member = options['premium_member'] == "t" ? true : false
    @trainer_id = options['trainer_id'].to_i
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO boxers
    (
      first_name,
      last_name,
      premium_member,
      trainer_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @premium_member, @trainer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE boxers
    SET first_name = $1, last_name = $2, premium_member =$3, trainer_id = $4
    WHERE id = $5"
    values = [@first_name,@last_name, @premium_member, @trainer_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE
    FROM boxers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = "DELETE FROM boxers"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM boxers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Boxer.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM boxers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Boxer.new( results.first )
  end

  def fitness_classes()
    sql = "SELECT fitness_classes.*
    FROM fitness_classes
    INNER JOIN bookings
    ON bookings.fitness_class_id = fitness_classes.id
    WHERE boxer_id = $1"
    values = [@id]
    fitness_class_data = SqlRunner.run(sql, values)
    return FitnessClass.map_items(fitness_class_data)
  end

  def add_fitness_class(fitness_class)
    Booking.new('fitness_class_id' => @id, "boxer_id" => fitness_class.id ).save()
  end


  def self.map_items(boxer_data)
    result = boxer_data.map { |boxer| Boxer.new(boxer) }
    return result
  end

end
