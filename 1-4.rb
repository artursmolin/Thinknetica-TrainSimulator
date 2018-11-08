puts "Введите a"
a = gets.chomp
puts "Введите b"
b = gets.chomp
puts "Введите c"
c = gets.chomp
d = b.to_i*2 - 4*a.to_i*c.to_i
if d > 0 
x = (-b.to_i + c.to_i)/(2*a.to_i)
y = (-b.to_i - c.to_i)/(2*a.to_i)
puts "Дискриминант: #{d}, x:#{x}, y:#{y}"
elsif d == 0 
x = -b.to_i/(2*a.to_i)
y = x
puts "Дискриминант: #{d}, x,y:#{x} "
else 
puts "Дискриминант < 0"
end


