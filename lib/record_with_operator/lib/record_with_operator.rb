require "record_with_operator/version"
require 'record_with_operator/active_record_permissions'

module RecordWithOperator
  def record_with_operator(options = {})
    ActionController::Base.class_eval {
      include ActiveRecordPermissions::ModelUserAccess::Controller
    }
    ActiveRecord::Base.class_eval {
      include ActiveRecordPermissions::ModelUserAccess::Model
    }

    include InstanceMethods
    extend ClassMethods
  end

  module InstanceMethods
    def set_with_operator
      if self.respond_to?(:modified_by) && self.modified_by.present?
        if self.new_record?
          self.created_operator_at = Time.now
          self.created_operator_id = self.modified_by.id
          self.updated_operator_at = Time.now
          self.updated_operator_id = self.modified_by.id
        else
          self.updated_operator_at = Time.now
          self.updated_operator_id = self.modified_by.id
        end
      end
    end
  end

  module ClassMethods
    def self.extended(base)
      base.set_callback :save, :before, :set_with_operator
      base.skip_time_zone_conversion_for_attributes << :created_operator_at
      base.skip_time_zone_conversion_for_attributes << :updated_operator_at
    end
  end
end

ActiveRecord::Base.send :extend, RecordWithOperator
