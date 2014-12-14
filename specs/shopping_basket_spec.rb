require 'minitest/autorun'
require 'shopping_basket'
require 'item'

describe ShoppingBasket do
  describe "when getting a total for an empty basket" do
    it "must return 0.00 for a total" do
      shopping_basket = ShoppingBasket.new()
      shopping_basket.total.must_equal(BigDecimal.new("0.00"))
    end
  end

  describe "when getting a total for multiple items" do
    describe "when tax rates are zero" do
      it "must return a sum of the totals" do
        item1 = Item.new(BigDecimal.new("12.49"))
        item2 = Item.new(BigDecimal.new("14.99"))
        item3 = Item.new(BigDecimal.new("0.85"))
        shopping_basket = ShoppingBasket.new(tax_rate:0.0)
        
        shopping_basket.add_item(item1)
        shopping_basket.add_item(item2)
        shopping_basket.add_item(item3)

        shopping_basket.total.must_equal(BigDecimal.new("28.33"))
      end
    end
  end

  describe "when getting tax for a single item" do
    describe "when tax rates are not zero" do
      it "must return the total tax" do
        item = Item.new(BigDecimal.new("12.50"))
        shopping_basket = ShoppingBasket.new(tax_rate:10.0)
        shopping_basket.add_item(item)
        shopping_basket.total_tax.must_equal(BigDecimal.new("1.25"))
      end
    end

    describe "when the item is tax exempt" do
      it "must return a total tax of zero" do
        item = Item.new(BigDecimal.new("12.50"), tax_exempt:true)
        shopping_basket = ShoppingBasket.new(tax_rate:10.0)
        shopping_basket.add_item(item)
        shopping_basket.total_tax.must_equal(BigDecimal.new("0.00"))
      end
    end
  end

  describe "when getting tax for both exempt and non-exempt items" do
    describe "when tax rates are not zero" do
      it "must return the total with tax" do
        exempt_item = Item.new(BigDecimal.new("12.50"), tax_exempt:true)
        non_exempt_item = Item.new(BigDecimal.new("15.00"), tax_exempt:false)
        shopping_basket = ShoppingBasket.new(tax_rate:10.0)
        shopping_basket.add_item(exempt_item)
        shopping_basket.add_item(non_exempt_item)
        shopping_basket.total.must_equal(BigDecimal.new("29"))
      end
    end
  end

  describe "when rounding taxes" do
    describe "when tax ends with .00" do
      it "must not round up to nearest .05" do
        item = Item.new(BigDecimal.new("10.00"), tax_exempt:false)
        shopping_basket = ShoppingBasket.new(tax_rate:10.0)
        shopping_basket.add_item(item)
        shopping_basket.total_tax.must_equal(BigDecimal.new("1.00"))
      end
    end

    describe "when tax ends with a number between .00 and .05" do
      it "must round up to nearest .05" do
        item = Item.new(BigDecimal.new("10.10"), tax_exempt:false)
        shopping_basket = ShoppingBasket.new(tax_rate:10.0)
        shopping_basket.add_item(item)
        shopping_basket.total_tax.must_equal(BigDecimal.new("1.05"))
      end
    end

    describe "when tax ends with .05" do
      it "must not round up to nearest .05" do
        item = Item.new(BigDecimal.new("10.50"), tax_exempt:false)
        shopping_basket = ShoppingBasket.new(tax_rate:10.0)
        shopping_basket.add_item(item)
        shopping_basket.total_tax.must_equal(BigDecimal.new("1.05"))
      end
    end

    describe "when tax ends with a number between .05 and .00" do
      it "must round up to nearest .05" do
        item = Item.new(BigDecimal.new("10.60"), tax_exempt:false)
        shopping_basket = ShoppingBasket.new(tax_rate:10.0)
        shopping_basket.add_item(item)
        shopping_basket.total_tax.must_equal(BigDecimal.new("1.10"))
      end
    end
  end

  describe "when an item is not imported" do
    it "must not apply the import tax rate" do

      item = Item.new(
        BigDecimal.new("10.00"), 
        tax_exempt:false, 
        imported:false)

      shopping_basket = ShoppingBasket.new(tax_rate:10.0, import_tax_rate:10.0)
      shopping_basket.add_item(item)
      shopping_basket.total_tax.must_equal(BigDecimal.new("1.00"))
    end
  end

  describe "when an item is imported" do
    it "must include the import tax rate" do

      item = Item.new(
      BigDecimal.new("10.0"),
      tax_exempt:false,
      imported:true)

      shopping_basket = ShoppingBasket.new(tax_rate:10.0, import_tax_rate:10.0)
      shopping_basket.add_item(item)
      shopping_basket.total_tax.must_equal(BigDecimal.new("2.00"))
    end
  end
end
