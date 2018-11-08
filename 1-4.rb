puts "Введите a"
a = gets.chomp.to_f
puts "Введите b"
b = gets.chomp.to_f
puts "Введите c"
c = gets.chomp.to_f
d = b * 2 - 4 * a * c
if d > 0 
	x = ( - b + c) / (2 * a)
	y = (- b - c) / (2 * a)
	puts "Дискриминант: #{d}, x:#{x}, y:#{y}"
elsif d == 0 
	x = - b.to_i / (2 * a)
	y = x
	puts "Дискриминант: #{d}, x,y:#{x} "
else 
	puts "Дискриминант < 0"
end