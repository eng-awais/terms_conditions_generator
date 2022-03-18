# frozen_string_literal: true

module Documents
  module Parser
    class Base
      attr_reader :file_data

      def initialize(file)
        @file_data = file
      end
    end
  end
end
