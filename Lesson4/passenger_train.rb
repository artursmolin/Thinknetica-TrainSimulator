class PassengerTrain < Train
  def initialize(number,quantity)
    super(number, :passenger, quantity)
  end
end
