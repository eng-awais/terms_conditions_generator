# frozen_string_literal: true

require 'spec_helper'

require 'pry'

RSpec.describe Documents::Parser::Template do
  describe '#Methods' do
    let(:file_name) { './template.txt' }
    let(:file) { Documents::Reader::Template.new(file_name).read_file_content.join }
    let(:file_parser) { described_class.new(file) }

    it 'returns false' do
      expect(file.empty?).to be(false)
    end

    it 'returns a clause data and section data in hash object' do
      expect(file_parser.fetch_clauses_and_sections.is_a?(Array)).to be_truthy
    end
  end
end
