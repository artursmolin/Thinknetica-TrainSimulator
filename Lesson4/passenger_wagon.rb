class PassengerWagon
  attr_reader :type

  def initialize(type)
    include Instances
    @type = type
    @type = :passenger
  end
end
