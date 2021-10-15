class MachineCurrencyStock
  attr_accessor :value, :qty
  def initialize(value, qty)
      @value = value
      @qty = qty
  end

  def self.all
      ObjectSpace.each_object(self).to_a
  end

  def self.add_quantity(value, quantity)
      curr = all.find{|c|  c.value == value}
      curr.qty += quantity
  end

  def self.change_details(amt_value)
      amt_collection = []
      all.sort{|c| c.value}.each do |curr|
          if(amt_value >= curr.value)
              qty = [(amt_value/curr.value).to_i,  curr.qty].min
              amt_collection << {qty: qty, value: curr.value} if qty.positive?
              amt_value -=  qty * curr.value
          end
          return amt_collection if amt_value.zero?
      end
      return amt_collection if amt_value.zero?
      return []
  end

  def self.remove_quantity(value, quantity)
      curr = all.find{|c|  c.value == value}
      curr.qty -= quantity
  end
end

