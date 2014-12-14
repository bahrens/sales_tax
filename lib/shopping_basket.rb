require 'bigdecimal'
require 'shopping_basket_item'

class ShoppingBasket
  attr_accessor :items

  def initialize(tax_rate:0.0, import_tax_rate:0.0)
    @items = []
    @tax_rate = tax_rate
    @import_tax_rate = import_tax_rate
  end

  def add_item(item, quantity=1)
    @items.push(
      ShoppingBasketItem.new(
        item,
        quantity,
        @tax_rate,
        @import_tax_rate
      )
    )
  end

  def total
    @items.reduce(BigDecimal.new("0")) { |sum, item| sum += item.total }
  end

  def total_tax
    @items.reduce(BigDecimal.new("0")) { |sum, item| sum += item.total_tax }
  end

end
