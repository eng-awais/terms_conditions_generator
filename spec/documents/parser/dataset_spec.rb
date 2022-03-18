# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Documents::Parser::Dataset do
  let(:file_name) { './dataset.txt' }
  let(:file) { Documents::Reader::Dataset.new(file_name).read_file_content }
  let(:combined_file_parser) { described_class.new(file).combine_parsed_data }

  describe '#Constructor' do
    it 'returns false' do
      expect(file.empty?).to be(false)
    end
  end

  describe '#Method' do
    context 'when we get the name of clauses and sections' do
      let(:output_is_hash) { described_class.new(combined_file_parser.is_a?(Hash)) }

      it 'returns a clause data and section data in hash object' do
        expect(output_is_hash).to be_truthy
      end
    end
  end
end
