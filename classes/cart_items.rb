class CartItems
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def sales_taxes
    @items.sum(&:sales_taxes).round(2) || 0
  end

  def total
    @items.sum(&:total_price).round(2) || 0
  end

  def generate_receipt
    receipt_lines = @items.map(&:summary) +
    ["Sales Taxes: #{format('%.2f', sales_taxes)}",
     "Total: #{format('%.2f', total)}"]
    
    receipt_lines.join("\n")
  end
end
