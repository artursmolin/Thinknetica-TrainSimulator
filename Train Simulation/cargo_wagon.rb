class CargoWagon < Wagon
  attr_reader :type

  def initialize(amount)
    @type = :cargo
    @max_volume = amount
    @load_volume = 0
  end

  def cargo_load(amount)
    @load_volume += amount if @load_volume < @max_volume
  end

  def cargo_loaded
    @load_volume.to_f
  end

  def cargo_empty
    empty_volume = @max_volume.to_f - @load_volume.to_f
    empty_volume
  end
end
