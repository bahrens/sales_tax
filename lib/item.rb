require 'bigdecimal'

class Item
  attr_accessor :price

  def initialize(price)
    @price = BigDecimal.new(price)
  end
end
