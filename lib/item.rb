require 'bigdecimal'

class Item
  attr_accessor :price

  def initialize(price, tax_exempt=false)
    @price = BigDecimal.new(price)
    @tax_exempt = tax_exempt
  end

  def tax_exempt?
    @tax_exempt
  end
end
