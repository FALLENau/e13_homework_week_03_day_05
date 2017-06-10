require_relative("../db/sql_runner")

class Film

  def initialize( options )
    @id = options['id'].to_i
    # @ticket_number = options['ticket_number'].to_i
    # @customer_id = options['customer_id'].to_i
    # @film_id = options['film_id'].to_i
  end

end
