class CargoTrain < Train
  def initialize(number,quantity)
    super(number, :cargo, quantity)
  end
end
