# frozen_string_literal: true

require_relative 'base'

module Documents
  module Reader
    class Dataset < Base
      DIRECTORY_NAME = 'datasets'
      def initialize(file_name)
        super(DIRECTORY_NAME, file_name)
      end
    end
  end
end
