require_relative('../db/sql_runner.rb')

class User
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def self.delete_all
    sql = "Delete from users;"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "Select * from users;"
    values = []
    user_hashes = SqlRunner.run(sql, values)
    user_objects = user_hashes.map { |user_hash| User.new(user_hash) }
    return user_objects
  end

  def save
    sql = "INSERT INTO users (name) VALUES ($1) RETURNING *;"
    values = [@name]
    returned_array = SqlRunner.run(sql, values)
    user_hash = returned_array[0]
    @id = user_hash['id'].to_i
  end
end
