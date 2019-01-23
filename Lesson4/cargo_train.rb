class CargoTrain < Train
  def initialize(number,carriage)
    super(number, :cargo, carriage)
  end
end
