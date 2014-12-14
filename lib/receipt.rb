require 'stringio'

class Receipt
  def initialize(shopping_basket)
    @shopping_basket = shopping_basket
  end

  def print
    string_buffer = StringIO.new

    @shopping_basket.items.each { |basket_item|
      item_total = bigdecimal_to_s(basket_item.total)
      string_buffer << "#{basket_item.quantity} #{basket_item.item.name}: #{item_total}\n"
    }

    taxes = bigdecimal_to_s(@shopping_basket.total_tax)
    string_buffer << "Sales Taxes: #{taxes}\n"

    total = bigdecimal_to_s(@shopping_basket.total)
    string_buffer << "Total: #{total}\n"

    string_buffer.string
  end

  private

  def bigdecimal_to_s(value)
    (value.truncate(2).to_s("F") + '00')[/.*\..{2}/]
  end
end
