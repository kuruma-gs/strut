require File.join(File.dirname(__FILE__),'respond.rb')

module Strut
  module Controller
    module Action
      include Strut::Controller::Respond

      def strut_controller_action clazz,table_name,file_name,actions
        # index
        actions.find(:index).each do |a|
          define_method a.name do
            respond_index instance_variable_get("@#{table_name}")
          end
        end

        # show,new,edit
        actions.find(:show,:new,:edit).each do |a|
          define_method a.name do
            respond_show instance_variable_get("@#{file_name}")
          end
        end

        # create,update,destroy
        actions.find(:create,:update,:destroy).each do |a|
          define_method a.name do
            send("respond_#{a.type}",instance_variable_get("@#{file_name}"))
          end
        end

      end
    end
  end
end
