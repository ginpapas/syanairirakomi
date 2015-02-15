module ActiveRecordPermissions
  module ModelUserAccess
    module Controller
      def assign_modified_by_to_models(v)
        ActiveRecord::Base.modified_by_proc = proc { v }
      end
    end

    module Model
      def self.included(base)
        @@modified_by = nil
        base.extend ClassMethods
      end

      module ClassMethods
        attr_accessor :modified_by_proc

        def modified_by
          ActiveRecord::Base.modified_by_proc.call if ActiveRecord::Base.modified_by_proc
        end
      end

      def modified_by
        @@modified_by || self.class.modified_by
      end

      def modified_by=(v)
        @@modified_by = v
      end
    end
  end
end
