class RegularPrice
  def charge(days_rented)
  	result = 2
  	result += (days_rented - 2) * 1.5  if days_rented > 2
	result
  end
end

class NewReleasePrice
  def charge(days_rented)
  	days_rented * 3
  end
end

class ChildrensPrice
  def charge(days_rented)
  	result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end

class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_reader :price_code

  def initialize(title, price_code)
    @title, self.price_code = title, price_code
  end

  def price_code=(price_code)
  	@price_code = price_code
  	@price = case price_code
    when REGULAR then RegularPrice.new
    when NEW_RELEASE then NewReleasePrice.new
    when CHILDRENS then ChildrensPrice.new
    end
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end
end
