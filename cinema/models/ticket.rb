require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :ticket_number, :customer_id, :film_id

  def initialize( options )
    @id = options['id'].to_i
    @ticket_number = options['ticket_number'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (ticket_number, customer_id, film_id) VALUES ('#{ @ticket_number }', '#{ @customer_id }', '#{ @film_id }') RETURNING id"
    ticket = SqlRunner.run( sql ).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (
    ticket_number, customer_id, film_id
    ) = (
      '#{@ticket_number}','#{@customer_id}''#{@film_id}'
    ) WHERE is = #{@id}"
    customer = SqlRunner.run(sql)
    return customer.map{|person| Customer.new(person)}
  end


  def self.find(id)
    sql = "SELECT * FROM films WHERE id = #{id}"
    results = SqlRunner.run(sql)[0]
    return results
  end

  # def customers()
  #   sql = "SELECT films.* FROM films
  #   INNER JOIN tickets
  #   ON films.id = tickets.film_id
  #   WHERE tickets.customer_id = #{@id}"
  #   return Customer.map_items(sql)[0]
  # end #Note:broken might need Customer.map_items tobe fixed.
  # def locations()
  #     sql = "SELECT locations.* FROM locations
  #     INNER JOIN visits
  #     ON locations.id = visists.location_id
  #     WHERE visits.user_id = #{@id}"
  #     return User.map_items(sql)
  # end note: locations = films, visits = tickets, user = customer


  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
