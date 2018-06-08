$: << "../lib"
require "rspec"
require "video_rental_system"

RSpec.describe Rental do
  it "sums the prices of its line items" do
    customer = Customer.new("Bob Slydel")
    movie1 = Movie.new("Blade Runner", RegularPrice.new)
    rental1 = Rental.new(movie1, 5)
    customer.add_rental(rental1)

    expect(customer.statement).to eq "Rental Record for Bob Slydel\n" \
                 "\tBlade Runner\t6.5\n" \
                 "Amount owed is 6.5\n" \
                 "You earned 1 frequent renter points"


    movie2 = Movie.new("The Matrix", ChildrensPrice.new)
    rental2 = Rental.new(movie2, 1)
    customer.add_rental(rental2)

    expect(customer.statement).to eq "Rental Record for Bob Slydel\n" \
                 "\tBlade Runner\t6.5\n" \
                 "\tThe Matrix\t1.5\n" \
                 "Amount owed is 8.0\n" \
                 "You earned 2 frequent renter points"


    movie3 = Movie.new("Memento", NewReleasePrice.new)
    rental3 = Rental.new(movie3, 15)
    customer.add_rental(rental3)

    expect(customer.statement).to eq "Rental Record for Bob Slydel\n" \
                 "\tBlade Runner\t6.5\n" \
                 "\tThe Matrix\t1.5\n" \
                 "\tMemento\t45\n" \
                 "Amount owed is 53.0\n" \
                 "You earned 4 frequent renter points"
  end
end
