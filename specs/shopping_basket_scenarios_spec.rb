require 'minitest/autorun'
require 'shopping_basket'
require 'item'

describe ShoppingBasket do
  describe "Exempt, and non-exempt, no imports" do
    it "must calculate the correct tax and total" do
      book = Item.new(
        BigDecimal.new("12.49"),
        tax_exempt: true,
        imported: false)

      music_cd = Item.new(
        BigDecimal.new("14.99"),
        tax_exempt: false,
        imported: false)

      chocolate_bar = Item.new(
        BigDecimal.new("0.85"),
        tax_exempt: true,
        imported: false)

      shopping_basket = ShoppingBasket.new(
        [book, music_cd, chocolate_bar],
        tax_rate: 10.0,
        import_tax_rate: 5.0)

      shopping_basket.total_tax.must_equal(BigDecimal.new("1.50"))
      shopping_basket.total.must_equal(BigDecimal.new("29.83"))
    end
  end

  describe "Exempt, and non-exempt, all imports" do
    it "must calculate the correct tax and total" do
      chocolates = Item.new(
        BigDecimal.new("10.00"), 
        tax_exempt: true, 
        imported: true)

      perfume = Item.new(
        BigDecimal.new("47.50"),
        tax_exempt: false,
        imported: true)

      shopping_basket = ShoppingBasket.new(
        [chocolates, perfume],
        tax_rate: 10.0,
        import_tax_rate: 5.0)

      shopping_basket.total_tax.must_equal(BigDecimal.new("7.65"))
      shopping_basket.total.must_equal(BigDecimal.new("65.15"))
    end
  end

  describe "Exempt, and non-exempt, imports and non-imports" do
    it "must calculate the correct tax and total" do
      imported_perfume = Item.new(
        BigDecimal.new("27.99"),
        tax_exempt: false,
        imported: true)

      perfume = Item.new(
        BigDecimal.new("18.99"),
        tax_exempt: false,
        imported: false)

      pills = Item.new(
        BigDecimal.new("9.75"),
        tax_exempt: true,
        imported: false)

      chocolates = Item.new(
        BigDecimal.new("11.25"),
        tax_exempt: true,
        imported: true)

      shopping_basket = ShoppingBasket.new(
        [imported_perfume, perfume, pills, chocolates],
        tax_rate: 10.0,
        import_tax_rate: 5.0)

      shopping_basket.total_tax.must_equal(BigDecimal.new("6.70"))
      shopping_basket.total.must_equal(BigDecimal.new("74.68"))
    end
  end
end
