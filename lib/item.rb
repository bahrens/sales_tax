require 'bigdecimal'

class Item
  attr_accessor :price
  attr_accessor :name

  def initialize(
    price, 
    name:nil, 
    tax_exempt:false, 
    imported:false)

    @price = price
    @name = name
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
