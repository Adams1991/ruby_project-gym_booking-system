require_relative('../db/sql_runner')

class Boxer

attr_reader(:id, :first_name, :last_name)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO boxers
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
