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
    tax = (total_for_non_exempt * @tax_rate) / 100
    round_to_nearest_five_cents(tax)
  end

  private

  def total_for_non_exempt
    non_exempt_items = @items.select { |item| item.tax_exempt? == false }
    non_exempt_items.reduce(BigDecimal.new("0")) { |sum, item| sum += item.price }
  end

  def round_to_nearest_five_cents(number)
    ((number / 0.05).ceil * 0.05)
  end
end
