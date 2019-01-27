module Manufacturer
  def set_manufacturer(name)
    @manufacturer = name
  end

  def manufacturer_name
    puts "Производитель: #{@manufacturer}"
  end
end
