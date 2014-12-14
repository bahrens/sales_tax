require 'bigdecimal'

class Item
  attr_accessor :price

  def initialize(price, tax_exempt:false, imported:false)
    @price = price
    @tax_exempt = tax_exempt
    @imported = imported
  end

  def tax_exempt?
    @tax_exempt
  end

  def imported?
    @imported
  end
end
