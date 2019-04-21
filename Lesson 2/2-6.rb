products = {}

product_name = ""
product_price = ""
product_count = ""

puts "Введите название товара"	
product_name = gets.chomp

while product_name != "stop"
  puts "Введите цену за единицу товара"
  product_price = gets.chomp.to_f

  puts "Введите количество товара"
  product_count = gets.chomp.to_f

  products[product_name] = { price: product_price, count: product_count }

  puts "Введите название товара"	
  product_name = gets.chomp
end

puts products

total_price = 0

products.each do |name, price_count|
  total_price_item = 0
  total_price_item += price_count[:price] *  price_count[:count]
  total_price += total_price_item
  puts "#{name} => #{total_price_item}"
end

puts "Итого: #{total_price}"