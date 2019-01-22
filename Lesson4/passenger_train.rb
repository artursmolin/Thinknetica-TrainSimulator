class PassengerTrain < Train
  def initialize(number,carriage)
    super(number, :passenger, carriage)
  end
  def type_validation?(carriage)
    carriage.class == PassengerCarriage
  end
end
