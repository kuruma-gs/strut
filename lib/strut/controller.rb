require File.join(File.dirname(__FILE__),'controller/filter.rb')
require File.join(File.dirname(__FILE__),'controller/action.rb')

module Strut
  module Controller
    
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      include Strut::Controller::Filter
      include Strut::Controller::Action
      def strut_controller clazz, options={}
        table_name = clazz.to_s.titleize
        file_name = clazz.to_s.underscore

        actions = Strut::Model::Holder.new options

        # define_before_filter
        strut_controller_filter table_name, file_name, actions

        # define_action
        strut_controller_action table_name, file_name, actions
      end
    end

  end
end
