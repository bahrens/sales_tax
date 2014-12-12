require 'bigdecimal'

class ShoppingBasket
  def initialize(items=[], tax_rate=0.0)
    @items = items
    @tax_rate = tax_rate
  end

  def total
    sum = BigDecimal.new("0.00")

    @items.each do |item|
      sum = sum + item.price
    end

    sum
  end

  def total_tax
    (total * @tax_rate) / 100
  end
end
