module Strut
  module Model
    # Holder is action array model
    # @author KURUMA
    # @version 0.1
    class Holder
      attr_accessor :actions

      # @param [Hash] options controller methods
      # @option options [Array] :only restrict methods from CRUD
      # @option options [Array] :except except methods from CRUD
      # @option options [Array] :index add methods as index
      # @option options [Array] :show add methods as show
      # @option options [Array] :new add methods as new
      # @option options [Array] :edit add methods as edit
      # @option options [Array] :create add methods as edit
      # @option options [Array] :update add methods as update
      # @option options [Array] :destroy add methods as destroy
      def initialize(options={})
        @actions = []
        Strut::ACTIONS.to_hash(options).each do |type,methods|
          methods.each do |name|
            @actions << Action.new(name,type)
          end
        end
      end

      # add action.
      # @param [Action] :action action model
      def << action
        @actions << action
      end

      # search actions
      # @param [Symbol] :types search action type. 
      # @return [Array] :actions
      def find(*types)
        return @actions if types.empty?
        @actions.select{|a| types.include? a.type}
      end

      # search actions and return names
      # @param [Symbol] :types search action type. 
      # @return [Array] :action_names action's name string array.
      def find_names(*types)
        return @actions.map(&:name) if types.empty?
        self.find(*types).map(&:name)
      end
    end
  end
end
