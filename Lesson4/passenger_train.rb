class PassengerTrain < Train
  def initialize(number,carriage)
    super(number, :passenger, carriage)
  end
end
