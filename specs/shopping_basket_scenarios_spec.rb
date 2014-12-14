require 'minitest/autorun'
require 'shopping_basket'
require 'item'
require 'shopping_basket_helper'

describe ShoppingBasket do
  include ShoppingBasketHelper
  describe "Exempt, and non-exempt, no imports" do
    it "must calculate the correct tax and total" do
      shopping_basket = scenario1
      shopping_basket.total_tax.must_equal(BigDecimal.new("1.50"))
      shopping_basket.total.must_equal(BigDecimal.new("29.83"))
    end
  end

  include ShoppingBasketHelper
  describe "Exempt, and non-exempt, all imports" do
    it "must calculate the correct tax and total" do
      shopping_basket = scenario2
      shopping_basket.total_tax.must_equal(BigDecimal.new("7.65"))
      shopping_basket.total.must_equal(BigDecimal.new("65.15"))
    end
  end

  include ShoppingBasketHelper
  describe "Exempt, and non-exempt, imports and non-imports" do
    it "must calculate the correct tax and total" do
      shopping_basket = scenario3
      shopping_basket.total_tax.must_equal(BigDecimal.new("6.70"))
      shopping_basket.total.must_equal(BigDecimal.new("74.68"))
    end
  end
end
