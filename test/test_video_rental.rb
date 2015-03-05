$: << './lib'
require 'video_rental'

class TestVideoRental < Minitest::Test

  def test_statement
    customer = Customer.new('Bob Slydel')
    movie1 = Movie.new('Blade Runner', Movie::REGULAR)
    rental1 = Rental.new(movie1, 5)
    customer.add_rental(rental1)

    assert_equal "Rental Record for Bob Slydel\n"          +
                 "\tBlade Runner\t6.5\n"   +
                 "Amount owed is 6.5\n"              +
                 "You earned 1 frequent renter points", customer.statement


    movie2 = Movie.new('The Matrix', Movie::CHILDRENS)
    rental2 = Rental.new(movie2, 1)
    customer.add_rental(rental2)

    assert_equal "Rental Record for Bob Slydel\n"          +
                 "\tBlade Runner\t6.5\n"   +
                 "\tThe Matrix\t1.5\n"     +
                 "Amount owed is 8.0\n"              +
                 "You earned 2 frequent renter points", customer.statement


    movie3 = Movie.new('Memento', Movie::NEW_RELEASE)
    rental3 = Rental.new(movie3, 15)
    customer.add_rental(rental3)

    assert_equal "Rental Record for Bob Slydel\n"          +
                 "\tBlade Runner\t6.5\n"   +
                 "\tThe Matrix\t1.5\n"     +
                 "\tMemento\t45\n"           +
                 "Amount owed is 53.0\n"             +
                 "You earned 4 frequent renter points", customer.statement
  end
end
