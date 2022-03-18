# frozen_string_literal: true

require_relative 'base'

module Documents
  module Parser
    class Dataset < Base
      attr_reader :clause_data

      def initialize(file)
        super(file)
        @clause_data = {}
        @section_data = {}
        @combined_data = {}
      end

      def combine_parsed_data
        generate_clause_hash
        generate_sections_hash
        { clause_data: @clause_data, section_data: @section_data }.freeze
      end

      private

      def generate_clause_hash
        clauses = filter_data(0)
        clauses.each do |clause|
          @clause_data.store(clause.split('"text":')[0].scan(/\d+/)[0],
                             clause.split('"text":')[1].scan(/\w+/).join(' '))
        end
        @clause_data.freeze
      end

      def generate_sections_hash
        sections = filter_data(1)
        sections.each do |section|
          @section_data.store(section.split('clauses_ids')[0].scan(/\d+/)[0],
                              section.split('clauses_ids')[1].scan(/\d+/))
        end
        @section_data.freeze
      end

      def filter_data(index)
        data = file_data.join.split('sections:')[index].split('"id":')
        data.shift
        data
      end
    end
  end
end
