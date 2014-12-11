require 'minitest/autorun'
require 'shopping_basket'
require 'item'

describe ShoppingBasket do
  before do
  end

  describe "when getting a total for an empty basket" do
    it "must return 0.00 for a total" do
      shopping_basket = ShoppingBasket.new()
      shopping_basket.total.must_equal(BigDecimal.new("0.00"))
    end
  end

  describe "when getting a total for multiple items" do
    describe "when tax rates are zero" do
      it "must return a sum of the totals" do
        items = [
          Item.new(BigDecimal.new("12.49")), 
          Item.new(BigDecimal.new("14.99")), 
          Item.new(BigDecimal.new("0.85"))
        ]

        tax_rate = 0.0
        shopping_basket = ShoppingBasket.new(items, tax_rate)

        shopping_basket.total.must_equal(BigDecimal.new("28.33"))

      end
    end
  end
end
