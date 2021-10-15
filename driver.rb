require './vending_machine'
vm = VendingMachine.new
puts 'Product Lists'
puts vm.list_products
puts 'Enter the Product Id'
product_id = gets.chomp.to_i
puts 'Enter the Quantity'
quantity = gets.chomp.to_i

puts "Enter the Money in this format [{'quantity'=> 1, 'value'=> 5}, {'quantity'=> 5, 'value'=> 2}], where value is the dollar value and quantity is number of coins"
demon = eval(gets.chomp)
begin
    if vm.pick(product_id, quantity, demon)
        puts "Product is vending"
    end
rescue => e
    puts "Error: #{e.message}"
end
