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
end
