# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TermsGenerator do
  let(:file_name) { 'result_output.txt' }
  let(:out_file_without_default_name) { described_class.new(file_name) }

  before do
    out_file_without_default_name
    out_file_without_default_name.generate_output_file
  end

  describe '#Constructor' do
    it 'returns true with default file name' do
      expect(File.exist?('template_output.txt')).to be(true)
    end

    it 'returns true with user provided file name' do
      expect(File.exist?(file_name)).to be(true)
    end
  end

  describe '#Method' do
    context 'when we generate the output file with data' do
      let(:out_file) { File.open(file_name) }
      let(:output_sample_file) { File.open('resultant_output_sample.txt') }

      it 'returns true by comparing the default written file with the output file' do
        expect(out_file.readlines).to eq output_sample_file.readlines
      end
    end
  end
end
