puts "Введите сторону А"
a = gets.chomp.to_f
puts "Введите сторону B"
b = gets.chomp.to_f
puts "Введите сторону C"
c = gets.chomp.to_f
c2 = c**2
if c2 == a**2 + b**2
	puts "Ваш треугольник является прямоугольным"
else 
	puts "Ваш треугольник не является прямоугольным"
end
if a == b || b == c || c == a 
	puts "Ваш треугольник является равнобедренным"
else 
end