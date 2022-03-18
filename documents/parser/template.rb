# frozen_string_literal: true

require_relative 'base'

module Documents
  module Parser
    class Template < Base
      def fetch_clauses_and_sections
        pattern_matching_string
      end

      private

      def pattern_matching_string
        file_data.scan(/\b(C....E-\d|S.....N-\d)\b/).flatten.freeze
      end
    end
  end
end
