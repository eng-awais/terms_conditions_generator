# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Documents::Reader::Dataset do
  describe '#Constructor' do
    let(:file_path) { './datasets/dataset.txt' }
    let(:not_existing_file) { './templates/template_1122.txt' }

    it 'returns a file object' do
      expect(File.exist?(file_path)).to be(true)
    end

    it 'returns a false' do
      expect(File.exist?(not_existing_file)).to be(false)
    end
  end
end
