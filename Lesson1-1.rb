puts "Как тебя зовут?"
name = gets.chomp
puts "Какой у тебя рост?"
height = gets.chomp
if weight = height - 110 > 0
puts "#{name}, ваш идеальный вес #{weight}"
else puts "#{name}, Ваш вес уже оптимальный"