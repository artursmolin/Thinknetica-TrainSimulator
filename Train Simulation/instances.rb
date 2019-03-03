module Instances
  module ClassMethods
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
end
