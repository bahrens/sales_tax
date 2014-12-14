require 'minitest/autorun'
require 'receipt'
require 'shopping_basket_helper'

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
  include ReceiptHelper, ShoppingBasketHelper
  describe "when printing a shopping basket" do
    it "must print line items, total tax, and total" do
      shopping_basket = scenario1
      receipt = Receipt.new(shopping_basket)
      receipt.print.must_equal(receipt_example)
    end
  end
end
