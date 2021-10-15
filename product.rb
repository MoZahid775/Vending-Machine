class Product
    attr_accessor :id, :name, :quantity, :price

    def initialize(id, name, quantity, price)
        @id = id
        @name = name
        @quantity = quantity
        @price = price
    end

    def self.all
        ObjectSpace.each_object(self).to_a
    end

    def self.find(id)
        all.find { |product| product.id == id }
    end

    def self.drop(product_id, quantity, price_denomination)
        price_denomination.each do |pd|
            MachineCurrencyStock.add_quantity(pd['value'], pd['quantity'])
        end
        total = 0
        price_denomination.each do |denomination|
            total += denomination['value'] * denomination['quantity']
        end
        
        product = Product.find(product_id)
        change_amt = total - (product.price * quantity)
        if change_amt.zero?
            product.quantity -= quantity
            return true 
        end

        change_details = MachineCurrencyStock.change_details(change_amt)

        if(change_details.empty?)
            price_denomination.each do |pd|
                MachineCurrencyStock.remove_quantity(pd['value'], pd['quantity'])
            end

            raise 'Change Not Available'
        else
            product.quantity -= quantity
            change_details.each {|change_demo| MachineCurrencyStock.remove_quantity(change_demo[:value], change_demo[:qty])}
        end
        change_details
    end

    def as_json
        {id: id, name: name, quantity: quantity, price: price}
    end
end

