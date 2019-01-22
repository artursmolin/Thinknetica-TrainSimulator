class CargoTrain < Train
  def initialize(number,carriage)
    super(number, :cargo, carriage)
  end




  def type_validation?(carriage)
    carriage.class == CargoCarriage
  end
end
