module Strut
  module Controller
    module Filter
      def strut_controller_filter clazz,table_name,file_name,actions
        # before_filter
        class_eval do
          before_filter :find_one, :only => actions.find_names(:show,:edit,:update,:destroy)
          before_filter :new_one,  :only => actions.find_names(:new,:create)
          actions.find_names(:index).each do |index|
            before_filter "find_#{index}", :only => [index]
          end
        end

        # find_one
        define_method :find_one do
          instance_variable_set("@#{file_name}",clazz.send(:find_by_param,params[:id]))
        end

        # new_one
        define_method :new_one do
          instance_variable_set("@#{file_name}",clazz.send(:new,params[file_name.to_sym]))
        end

        # find_all
        actions.find(:index).each do |a|
          define_method "find_#{a.name}" do
            instance_variable_set("@#{table_name}",clazz.send(:desc,:created_at).send(:page,params[:page]))
          end
        end
      end
    end
  end
end
