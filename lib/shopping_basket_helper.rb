require 'item'

module ShoppingBasketHelper
  def self.scenario1
    book = Item.new(
      BigDecimal.new("12.49"),
      name: "book",
      tax_exempt: true,
      imported: false)

    music_cd = Item.new(
      BigDecimal.new("14.99"),
      name: "music CD",
      tax_exempt: false,
      imported: false)

    chocolate_bar = Item.new(
      BigDecimal.new("0.85"),
      name: "chocolate bar",
      tax_exempt: true,
      imported: false)

    shopping_basket = ShoppingBasket.new(
      tax_rate: BigDecimal.new("10.0"),
      import_tax_rate: BigDecimal.new("5.0"))

    shopping_basket.add_item(book)
    shopping_basket.add_item(music_cd)
    shopping_basket.add_item(chocolate_bar)

    shopping_basket
  end

  def self.scenario2
    chocolates = Item.new(
      BigDecimal.new("10.00"),
      name: "imported box of chocolates",
      tax_exempt: true, 
      imported: true)

    perfume = Item.new(
      BigDecimal.new("47.50"),
      name: "imported bottle of perfume",
      tax_exempt: false,
      imported: true)

    shopping_basket = ShoppingBasket.new(
      tax_rate: BigDecimal.new("10.0"),
      import_tax_rate: BigDecimal.new("5.0"))

    shopping_basket.add_item(chocolates)
    shopping_basket.add_item(perfume)

    shopping_basket
  end

  def self.scenario3
    imported_perfume = Item.new(
      BigDecimal.new("27.99"),
      name: "imported bottle of perfume",
      tax_exempt: false,
      imported: true)

    perfume = Item.new(
      BigDecimal.new("18.99"),
      name: "bottle of perfume",
      tax_exempt: false,
      imported: false)

    pills = Item.new(
      BigDecimal.new("9.75"),
      name: "packet of headache pills",
      tax_exempt: true,
      imported: false)

    chocolates = Item.new(
      BigDecimal.new("11.25"),
      name: "box of imported chocolates",
      tax_exempt: true,
      imported: true)

    shopping_basket = ShoppingBasket.new(
      tax_rate: BigDecimal.new("10.0"),
      import_tax_rate: BigDecimal.new("5.0"))

    shopping_basket.add_item(imported_perfume)
    shopping_basket.add_item(perfume)
    shopping_basket.add_item(pills)
    shopping_basket.add_item(chocolates)

    shopping_basket
  end
end
