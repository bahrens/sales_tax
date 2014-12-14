class ShoppingBasketItem
  attr_accessor :item
  attr_accessor :quantity

  def initialize(item, quantity, tax_rate, import_tax_rate)
    @item = item
    @quantity = quantity
    @tax_rate = tax_rate
    @import_tax_rate = import_tax_rate
  end

  def total
    (item.price + total_tax) * quantity
  end

  def total_tax
    total_non_exempt_tax + total_import_tax
  end

  private

  def total_non_exempt_tax
    non_exempt_tax = (total_for_non_exempt * @tax_rate) / BigDecimal.new("100")
    round_to_nearest_five_cents(non_exempt_tax)
  end

  def total_import_tax
    import_tax = (total_for_imported * @import_tax_rate) / BigDecimal.new("100")
    round_to_nearest_five_cents(import_tax)
  end

  def total_for_non_exempt
    item.tax_exempt? == false ? item.price : BigDecimal.new("0.00")
  end

  def total_for_imported
    item.imported? ? item.price : BigDecimal.new("0.00")
  end

  def round_to_nearest_five_cents(number)
    ((number / BigDecimal.new("0.05")).ceil * BigDecimal.new("0.05"))
  end
end
