puts "Введите число"
day = gets.chomp.to_i

puts "Введите месяц"
month = gets.chomp.to_i

puts "Введите год"
year = gets.chomp.to_i

months =  [	31, 28, 31, 31, 30,	31,	30,	31,	30,	31,	30,	31 ]

months.each_with_index { |d, i| day += d if month - 1 > i }

if ( year % 400 == 0 || year % 4 == 0 && year % 100 != 0 ) && ( month > 2 && day > 28 )
  day += 1
end	

puts "=> #{day}"