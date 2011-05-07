module Strut
  module Model
    # Action is action name model.
    # @author KURUMA
    # @version 0.1
    class Action
      attr_accessor :name, :type

      # @param [Symbol] :name action name
      # @param [Symbol] :type action type (CRUD)
      def initialize name,type
        self.name = name
        self.type = type
      end

    end
  end
end
