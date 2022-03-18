# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Documents::Reader::Template do
  describe '#constructor' do
    let(:file_path) { './templates/template.txt' }
    let(:not_existing_file) { './templates/template_1122.txt' }

    it 'returns a true' do
      expect(File.exist?(file_path)).to be(true)
    end

    it 'returns a false' do
      expect(File.exist?(not_existing_file)).to be(false)
    end
  end
end
