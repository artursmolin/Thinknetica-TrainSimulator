require_relative 'instances.rb'

  class Station
  attr_reader :train
  include Instances::ClassMethods
  extend Instances::InstanceMethods

  def self.all
    puts @stations
  end

  def initialize(station_name)
    @station_name = station_name
    @trains = []
    self.class.register_instances
    puts "Станция создана!"
  end

  def train_arrive(train)
    @trains << train
  end

  def train_left(train)
	  @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.map { |train| train.type == type }
  end

  def trains
	  puts @trains
  end
end
