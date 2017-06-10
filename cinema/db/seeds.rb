require_relative '../models/ticket'
require_relative '../models/customer'
require_relative '../models/film'

require "pry-byebug"

Ticket.delete_all()
#Film.delete_all()
#Customer.delete_all()

ticket1 = Ticket.new({ 'ticket_number' => 1 })
ticket2 = Ticket.new({ 'ticket_number' => 2 })
ticket3 = Ticket.new({ 'ticket_number' => 3 })

ticket1.save()
ticket2.save()
ticket3.save()


customer1 = Customer.new({ 'name' => 'Reece', 'funds' => 20 })
# customer2 = Customer.new({ 'name' => 'Eugene', 'funds' => 15 })
# customer3 = Customer.new({ 'name' => 'Ross', 'funds' => 25 })
#
customer1.save()
# customer2.save()
# customer3.save()
#
film1 = Film.new({ 'title' => 'Shazam', 'price' => 12})
# film2 = Film.new({ 'title' => 'Black Adam', 'price' => 10.50})
# film3 = Film.new({ 'title' => 'Blue Bettle', 'price' => 11})
#
film1.save()
# film2.save()
# film3.save()

binding.pry
nil
