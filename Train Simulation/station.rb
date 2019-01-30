require_relative 'instances.rb'
require_relative 'valid.rb'

class Station
  attr_reader :train
  extend Instances::ClassMethods
  include Instances::InstanceMethods

  def self.all
    puts @stations
  end

  def initialize(station_name)
    @station_name = station_name
    @trains = []
    validate!
    register_instances
    puts "Станция создана!"
  end

  def validate!
    raise "Station name can't be nil" if @station_name.nil? or @station_name.length.zero?
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
