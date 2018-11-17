n = 0
until n <= 100 do
  def fibonacci(n)
    if n < 3
        1
    else
        fibonacci(n - 1) + fibonacci(n - 2)
    end
  end

puts "#{fibonacci(n)} "
