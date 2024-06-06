class Item
    BASIC_SALES_TAX_RATE = 10
    IMPORT_DUTY_RATE = 5

    def initialize(quantity:, imported:, name:, price:, exempt:)
      @quantity = quantity
      @imported = imported
      @name = name
      @price = price
      @exempt = exempt
    end
  
    def total_price
      (@price * @quantity + sales_taxes).round(2)
    end
  
    def sales_taxes
      tax_percentaje = @exempt ? 0 :  BASIC_SALES_TAX_RATE
      tax_percentaje += IMPORT_DUTY_RATE if @imported

      total_tax = (tax_percentaje * @price) / 100
      ((total_tax / 0.05).ceil * 0.05) * @quantity
    end

    def summary
      "#{@quantity} #{@imported ? 'imported ' : ''}#{@name}: #{format('%.2f', total_price)}"
    end
  end
