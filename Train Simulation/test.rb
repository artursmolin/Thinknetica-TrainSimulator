module ClassMethods
  def instances=(qty)
    @instances = qty
  end

  def instances
    @instances ||= 0
  end

  def increase_instances
    @instances ||= 0
    @instances += 1
  end
end
module InstanceMethods
  def register_instances
    self.class.increase_instances
  end
end

class Test
  extend ClassMethods
  include InstanceMethods

  def initialize
    register_instances
  end
end
