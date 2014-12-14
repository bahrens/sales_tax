module ReceiptHelper
  def receipt_for_scenario1
<<-RECEIPT
1 book: 12.49
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 29.83
RECEIPT
  end

  def receipt_for_scenario2
<<-RECEIPT
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
RECEIPT
  end

  def receipt_for_scenario3
<<-RECEIPT
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
1 box of imported chocolates: 11.85
Sales Taxes: 6.70
Total: 74.68
RECEIPT
  end
end
