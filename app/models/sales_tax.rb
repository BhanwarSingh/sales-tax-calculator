class SalesTax

  CURRENCY_DROPDOWN  = [['EUR', 'EUR'], ['INR', 'INR'], ['USD', 'USD']]
  
  TAX_EXEMPTED_PRODUCT = ["book", "food", "medicine"]

  def initialize(item)
    @quantity    = item["quantity"].to_i
    @description = item["description"].downcase
    @price       = item["price"].to_f
  end

  def calculate
    total_price = @price * @quantity

    is_item_exempt = false

    TAX_EXEMPTED_PRODUCT.each do |product|
      is_item_exempt = @description.include?(product)

      break if is_item_exempt
    end

    tax_on_item = is_item_exempt ? 0 : ((total_price * 10) / 100)
    import_duty = @description.include?('imported') ? ((total_price * 5) / 100) : 0

    total_tax      = tax_on_item + import_duty
    price_with_tax = total_price + total_tax

    return total_tax, price_with_tax
  end

end
