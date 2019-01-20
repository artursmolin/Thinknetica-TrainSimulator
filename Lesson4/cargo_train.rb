class CargoTrain < Train
super
  def type_validation?(carriage)
    carriage.class == CargoCarriage
  end
end
