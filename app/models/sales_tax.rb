class SalesTax

  CURRENCY_DROPDOWN = [['EUR', 'EUR'], ['INR', 'INR'], ['USD', 'USD']]

  ITEM_CATEGORIES = ["book", "food", "medicine"]

  def initialize(qty, item_description, price)
    @qty              = qty
    @item_description = item_description
    @price            = price
  end

  def calculate
    tax_on_price    = 0;
    tax_on_imported = 0;
    updated_price   = []
    sales_tax       = []

    @qty.each_with_index do |item, index|
      description = @item_description[index].downcase
      price       = @price[index].to_f * item.to_f

      if description.include?('imported')
        tax_on_imported = (price * 5) / 100
      end

      is_item_exempt = false

      ITEM_CATEGORIES.each do |category|
        if description.include?(category)
          is_item_exempt = true
          break
        end
      end

      if is_item_exempt
        updated_price << price + tax_on_imported
        sales_tax     << tax_on_imported
      else
        tax_on_price = (price * 10) / 100

        updated_price << price + tax_on_imported + tax_on_price
        sales_tax     << tax_on_imported + tax_on_price
      end
    end

    return updated_price, sales_tax
  end

end
