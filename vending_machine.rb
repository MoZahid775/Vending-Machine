require './machine_currency_stock'
require './product'
class VendingMachine
    def initialize
        @products = []
        @products << Product.new(1, 'Coca Cola', 2, 2)
        @products << Product.new(2, 'Sprite', 2, 2.5)
        @products << Product.new(3, 'Fanta', 3, 2.70)
        @products << Product.new(4, 'Orange Juice', 1, 3)
        @products << Product.new(5, 'Water', 0, 3.25)
        
        # Initialize Coin/Amount stocks
        @currency = []
        @currency << MachineCurrencyStock.new(5, 5)
        @currency << MachineCurrencyStock.new(3, 5)
        @currency << MachineCurrencyStock.new(2, 5)
        @currency << MachineCurrencyStock.new(1, 5)
        @currency << MachineCurrencyStock.new(0.5, 5)
        @currency << MachineCurrencyStock.new(0.25, 5)

    end

    def list_products
        Product.all.map do |product|
            product.as_json
        end
    end

    def pick(product_id, quantity, price_denomination = [])
        product = Product.find(product_id)
        if(product.quantity.zero?)
            raise 'Out of Stock'
        elsif(product.quantity < quantity)
            raise 'Not Enough Stock'
        elsif(validate_money(price_denomination, (product.price * quantity)))
            Product.drop(product_id, quantity, price_denomination)
        end
    end

    private

    def validate_money(price_denomination, price)
        total = 0
        price_denomination.each do |denomination|
            total += denomination['value'] * denomination['quantity']
        end
        
        raise "Not Enough Money Paid - #{total}" if total < price
        true
    end
end
