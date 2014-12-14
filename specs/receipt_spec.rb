require 'minitest/autorun'
require 'receipt'
require 'shopping_basket_helper'
require 'receipt_helper'

describe Receipt do
  include ReceiptHelper, ShoppingBasketHelper
  describe "when printing a shopping basket for scenario 1" do
    it "must print line items, total tax, and total" do
      shopping_basket = scenario1
      receipt = Receipt.new(shopping_basket)
      receipt.print.must_equal(receipt_for_scenario1)
    end
  end

  include ReceiptHelper, ShoppingBasketHelper
  describe "when printing a shopping basket for scenario 2" do
    it "must print line items, total tax, and total" do
      shopping_basket = scenario2
      receipt = Receipt.new(shopping_basket)
      receipt.print.must_equal(receipt_for_scenario2)
    end
  end

  include ReceiptHelper, ShoppingBasketHelper
  describe "when printing a shopping basket for scenario 3" do
    it "must print line items, total tax, and total" do
      shopping_basket = scenario3
      receipt = Receipt.new(shopping_basket)
      receipt.print.must_equal(receipt_for_scenario3)
    end
  end
end
