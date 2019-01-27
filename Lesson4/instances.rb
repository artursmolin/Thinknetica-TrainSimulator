module Instances

  module ClassMethods
    attr_accessor :instances

    def self.instances
      @@instances
    end
  end

  module InstanceMethods
      def register_instances
        @@instances ||= 0
        @@instances += 1
      end
  end
end
