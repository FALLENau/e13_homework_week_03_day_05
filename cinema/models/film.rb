require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{ @title }', '#{ @price }') RETURNING id"
    film = SqlRunner.run( sql ).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (
    title, price
    ) = (
      '#{@title}','#{@price}'
    ) WHERE is = #{@id}"
    film = SqlRunner.run(sql)
    return film.map{|movie| Film.new(movie)}
  end

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = #{id}"
    results = SqlRunner.run(sql)[0]
    return results
  end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id = #{@id}"
    return Customer.map_items(sql)[0]
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end


end
