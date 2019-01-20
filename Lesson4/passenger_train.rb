class PassengerTrain < Train
super
  def type_validation?(carriage)
    carriage.class == PassengerCarriage
  end
end
