require_relative 'manufacturer.rb'
require_relative 'validation.rb'
require_relative 'accessors.rb'

class Wagon
  attr_reader :type
  include Manufacturer
  include Validation
  extend Accessors

  attr_accessor_with_history :color, :floors
  strong_attr_accessor :serial_number, Integer

  def initialize(type, amount)
    @type = type
    @manufacturer = ''
    @amount = amount
  end
end
