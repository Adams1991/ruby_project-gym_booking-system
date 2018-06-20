require_relative('../db/sql_runner')
require_relative('./booking')
require_relative('./fitness_class')
require_relative('./trainer')

class Boxer

attr_accessor(:id, :first_name, :last_name, :premium_member, :skill_level, :trainer_id)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @premium_member = options['premium_member'] =="t" || options['premium_member'] =="true" ? true : false
    @skill_level = options['skill_level']
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
      skill_level,
      trainer_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@first_name, @last_name, @premium_member, @skill_level, @trainer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE boxers
    SET first_name = $1, last_name = $2, premium_member =$3, skill_level = $4, trainer_id = $5
    WHERE id = $6"
    values = [@first_name,@last_name, @premium_member, @skill_level, @trainer_id, @id]
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

  def trainer()
    sql = "SELECT trainers.*
    FROM trainers
    WHERE id = $1"
    values = [@trainer_id]
    trainer_data = SqlRunner.run(sql, values)
    return Trainer.new(trainer_data.first())
  end

  def convert_boolean
    @premium_member == true ? "Yes" : "No"
  end

  def add_fitness_class(fitness_class)
    Booking.new('fitness_class_id' => @id, "boxer_id" => fitness_class.id ).save()
  end

  def get_skill_array(params)
    return params.values_at("footwork", "padwork", "fitness", "power", "defense" )
  end

  def get_skill_score(skill_test_array)
    skill_score = 0
    skill_test_array.each { |attribute| if attribute >= 5 then skill_score += 2 end}
    return skill_score
  end

  def assign_skill_level(skill_score)
    if skill_score == 10
      @skill_level = "Professional"
    elsif skill_score >= 6
      @skill_level = "Amatuer"
    else
      @skill_level = "Novice"
    end
    update()
  end


  def self.map_items(boxer_data)
    result = boxer_data.map { |boxer| Boxer.new(boxer) }
    return result
  end

end
