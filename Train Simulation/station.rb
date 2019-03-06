require_relative 'instances.rb'
require_relative 'validation.rb'
require_relative 'accessors.rb'

class Station
  attr_reader :train
  extend Instances::ClassMethods
  include Instances::InstanceMethods
  include Validation
  extend Accessors

  validate :name, :presence
  validate :name, :type, String

  def self.all
    puts @@stations
  end

  def initialize(station_name)
    @station_name = station_name
    @trains = []
    @stations = []
    @stations << self
    validate!
    register_instances
    puts 'Станция создана!'
  end

  def validate!
    raise 'Station name must be 3 and more characters' if
    @station_name.nil? || (@station_name.length < 3)
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

  def each_train
    @trains.each { |train| yield(train) }
  end
end
