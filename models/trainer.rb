require_relative('../db/sql_runner')
require_relative('./booking')
require_relative('./boxer')

class Trainer

attr_accessor(:id, :first_name, :last_name, :premium_trainer)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @premium_trainer = options['premium_trainer'] == "t" ? true : false
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO trainers
    (
      first_name,
      last_name,
      premium_trainer
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @premium_trainer]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE trainers
    SET first_name = $1, last_name = $2, premium_trainer =$3
    WHERE id = $4"
    values = [@first_name,@last_name, @premium_trainer, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE
    FROM trainers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = "DELETE FROM trainers"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM trainers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Trainer.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM boxers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Trainers.new( results.first )
  end


  def self.map_items(trainer_data)
    result = trainer_data.map { |trainer| Trainer.new(trainer) }
    return result
  end

end
