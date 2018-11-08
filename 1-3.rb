puts "Введите сторону А"
a = gets.chomp
puts "Введите сторону B"
b = gets.chomp
puts "Введите сторону C"
c = gets.chomp
c2 = c.to_i**2
if c2 == a.to_i**2 + b.to_i**2
puts "Ваш треугольник является прямоугольным"
else puts "Ваш треугольник не является прямоугольным"
end
if a == b || b == c || c == a 
puts "Ваш треугольник является равнобедренным"
else 
end