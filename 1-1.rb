puts "Как тебя зовут?"
first_name = gets.chomp
puts "Какой у тебя рост?"
height = gets.chomp
weight = height.to_i - 110
if weight > 0 
puts "#{first_name}, ваш идеальный вес #{weight}"
else puts "#{first_name}Ваш вес уже оптимальный"
end