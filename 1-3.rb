puts "Введите сторону А"
a = gets.chomp.to_f
puts "Введите сторону B"
b = gets.chomp.to_f
puts "Введите сторону C"
c = gets.chomp.to_f
cc = b**2
aa = a**2
bb = c**2
if a > b && a > c 
	aa == c**2 + b**2
	puts "Ваш треугольник является прямоугольным"
else 
end
if b > c && b > a 
	bb == a**2 + c**2
	puts "Ваш треугольник является прямоугольным"
else 
end
if c > a && c > b
	cc == a**2 + b**2
	puts "Ваш треугольник является прямоугольным"
else 
end
if a == b || b == c || c == a 
	puts "Ваш треугольник является равнобедренным"
else 
end