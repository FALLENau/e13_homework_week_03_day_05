require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{ @name }', '#{ @funds }') RETURNING id"
    customer = SqlRunner.run( sql ).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (
    name
    ) = (
      '#{@name}','#{@funds}'
    ) WHERE is = #{@id}"
    customer = SqlRunner.run(sql)
    return customer.map{|person| Customer.new(person)}
  end


  def self.find(id)
    sql = "SELECT * FROM films WHERE id = #{id}"
    results = SqlRunner.run(sql)[0]
    return results
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    item_hashes = SqlRunner.run(sql)
    result = item_hashes.map {|customer_hash| Customer.new(customer_hash)}
    return result
  end #note: not working yet... but maybe it is ?

end
