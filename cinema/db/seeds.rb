require_relative '../models/ticket'
require_relative '../models/customer'
require_relative '../models/film'

require "pry-byebug"

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()




customer1 = Customer.new({ 'name' => 'Reece', 'funds' => 20 })
customer2 = Customer.new({ 'name' => 'Eugene', 'funds' => 15 })
customer3 = Customer.new({ 'name' => 'Ross', 'funds' => 25 })
customer4 = Customer.new({ 'name' => 'James', 'funds' => 50 })
customer5 = Customer.new({ 'name' => 'Rachel', 'funds' => 45 })

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()

film1 = Film.new({ 'title' => 'Shazam', 'price' => 12})
film2 = Film.new({ 'title' => 'Black Adam', 'price' => 10.50})
film3 = Film.new({ 'title' => 'Blue Bettle', 'price' => 11})

film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new({
  'ticket_number' => 1,
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket2 = Ticket.new({
  'ticket_number' => 2,
  'customer_id' => customer2.id,
  'film_id' => film2.id
})
ticket3 = Ticket.new({
  'ticket_number' => 3,
  'customer_id' => customer3.id,
  'film_id' => film3.id
})
ticket4 = Ticket.new({
  'ticket_number' => 4,
  'customer_id' => customer4.id,
  'film_id' => film1.id
})
ticket5 = Ticket.new({
  'ticket_number' => 5,
  'customer_id' => customer5.id,
  'film_id' => film1.id
})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()


binding.pry
nil
