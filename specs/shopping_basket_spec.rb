require 'minitest/autorun'
require 'shopping_basket'
require 'item'

describe ShoppingBasket do
  before do
    @items = [
      Item.new(BigDecimal.new("12.49")), 
      Item.new(BigDecimal.new("14.99")), 
      Item.new(BigDecimal.new("0.85"))
    ]
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
        tax_rate = 0.0
        shopping_basket = ShoppingBasket.new(@items, tax_rate)
        shopping_basket.total.must_equal(BigDecimal.new("28.33"))
      end
    end
  end

  describe "when getting tax for a single item" do
    describe "when tax rates are not zero" do
      it "must return the total tax" do
        tax_rate = 10.0
        item = Item.new(BigDecimal.new("12.50"))
        shopping_basket = ShoppingBasket.new([item], tax_rate)
        shopping_basket.total_tax.must_equal(BigDecimal.new("1.25"))
      end
    end

    describe "when the item is tax exempt" do
      it "must return a total tax of zero" do
        tax_rate = 10.0
        item = Item.new(BigDecimal.new("12.50"), true)
        shopping_basket = ShoppingBasket.new([item], tax_rate)
        shopping_basket.total_tax.must_equal(BigDecimal.new("0.00"))
      end
    end
  end

  describe "when getting tax for both exempt and non-exempt items" do
    describe "when tax rates are not zero" do
      it "must return the total with tax" do
        tax_rate = 10.0
        exempt_item = Item.new(BigDecimal.new("12.50"), true)
        non_exempt_item = Item.new(BigDecimal.new("15.00"), false)
        shopping_basket = ShoppingBasket.new([exempt_item, non_exempt_item], tax_rate)
        shopping_basket.total.must_equal(BigDecimal.new("29"))
      end
    end
  end
end
