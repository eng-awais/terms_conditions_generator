# frozen_string_literal: true

require_relative '../reader/template'
require_relative '../reader/dataset'
require_relative '../parser/template'
require_relative '../parser/dataset'

module Documents
  module Writer
    class Content
      attr_reader :update_content

      def initialize(template = 'template.txt', dataset = 'dataset.txt')
        @template_name = template
        @dataset_name = dataset
      end

      def update_template
        obtain_template_clause
        @template_reader
      end

      private

      def template_reader
        @template_reader = Documents::Reader::Template.new(@template_name).read_file_content.join
      end

      def dataset_reader
        Documents::Reader::Dataset.new(@dataset_name).read_file_content
      end

      def template_parser
        Documents::Parser::Template.new(template_reader).fetch_clauses_and_sections
      end

      def dataset_parser
        Documents::Parser::Dataset.new(dataset_reader).combine_parsed_data
      end

      def obtain_template_clause
        template_parser.each do |keyword|
          clause_id = keyword.split('-')[1] # CLAUSE-1
          content = if keyword.include?('CLAUSE')
                      get_clause_sentence(clause_id)
                    else
                      generate_section_content(clause_id)
                    end
          update_template_content content, keyword
        end
      end

      def generate_section_content(section_value)
        complete_sentence = ''
        dataset_parser[:section_data][section_value].each do |clause_id|
          complete_sentence += ';' unless complete_sentence.empty?
          complete_sentence += get_clause_sentence(clause_id)
        end
        complete_sentence
      end

      def get_clause_sentence(clause_id)
        dataset_parser[:clause_data][clause_id]
      end

      def update_template_content(clause, keyword)
        @template_reader.gsub!(@template_reader.scan(/\b(C....E-\d|S.....N-\d)\b/).flatten.delete(keyword), clause)
                        .gsub!(/\[|\]/, '')
      end
    end
  end
end
