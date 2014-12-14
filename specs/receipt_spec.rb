require 'minitest/autorun'
require 'receipt'

module ReceiptHelper
  def receipt_example
<<-RECEIPT
1 book: 12.49
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 29.83
RECEIPT
  end
end

describe Receipt do
  include ReceiptHelper
  describe "when printing a shopping basket" do
    it "must print line items, total tax, and total" do
      item1 = Item.new(
        BigDecimal.new("12.49"), 
        name: "book",
        tax_exempt: true,
        imported: false)

      item2 = Item.new(
        BigDecimal.new("14.99"), 
        name: "music CD",
        tax_exempt: false,
        imported: false)

      item3 = Item.new(
        BigDecimal.new("0.85"), 
        name: "chocolate bar",
        tax_exempt: true,
        imported: false)

      shopping_basket = ShoppingBasket.new(
        tax_rate: 10.0, 
        import_tax_rate: 0.5)

      shopping_basket.add_item(item1)
      shopping_basket.add_item(item2)
      shopping_basket.add_item(item3)

      receipt = Receipt.new(shopping_basket)
      receipt.print.must_equal(receipt_example)
    end
  end
end
