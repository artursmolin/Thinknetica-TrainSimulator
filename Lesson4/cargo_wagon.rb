class CargoWagon
  attr_reader :type

  def initialize(type)
    @type = type
    @type = :cargo
    self.class.register_instances
    
  end

end
