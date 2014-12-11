require 'minitest/autorun'
require 'shopping_basket'

describe ShoppingBasket do
  before do
    @shopping_basket = ShoppingBasket.new
  end

  describe "when getting a total for an empty basket" do
    it "must return 0.00 for a total" do
      @shopping_basket.total.must_equal(BigDecimal.new("0.00"))
    end
  end
end
