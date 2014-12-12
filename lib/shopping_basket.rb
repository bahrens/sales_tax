require 'bigdecimal'

class ShoppingBasket
  def initialize(items=[], tax_rate=0.0)
    @items = items
    @tax_rate = tax_rate
  end

  def total
    sub_total = @items.reduce(BigDecimal.new("0")) { |sum, item| sum += item.price }
    sub_total + total_tax
  end

  def total_tax
    (total_for_non_exempt * @tax_rate) / 100
  end

  private

  def total_for_non_exempt
    non_exempt_items = @items.select { |item| item.tax_exempt? == false }
    non_exempt_items.reduce(BigDecimal.new("0")) { |sum, item| sum += item.price }
  end
end
