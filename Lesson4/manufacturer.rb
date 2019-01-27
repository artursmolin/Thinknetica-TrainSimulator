module Manufacturer
<<<<<<< HEAD
  def set_manufacturer(name)
    @manufacturer = name
  end

  def manufacturer_name
    puts "Производитель: #{@manufacturer}"
=======
  def get_info
    puts "Укажите производителя:"
    manufacturer = gets.chomp
>>>>>>> 840f7a1a8c87e79c7dea95c264348a28d8fe2d96
  end
end
