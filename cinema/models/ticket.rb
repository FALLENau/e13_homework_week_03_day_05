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

  # def self.all()
  #   sql = "SELECT * FROM tickets"
  #   tickets = SqlRunner.run(sql)
  #   result = tickets.map { |ticket| Ticket.new( ticket ) }
  #   return result
  # end
  #
  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
