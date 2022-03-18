# frozen_string_literal: true

module Documents
  module Reader
    class Base
      attr_accessor :file
      attr_reader :file_content

      def initialize(dir_name, file_name)
        @file = File.open(append_filename_with_directory(dir_name, file_name))
      end

      def read_file_content
        @file_content = @file.readlines
      end

      private

      def append_filename_with_directory(dir_name, file_name)
        "#{dir_name}/#{file_name}"
      end
    end
  end
end
