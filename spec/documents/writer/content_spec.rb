# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Documents::Writer::Content do
  describe '#Method' do
    let(:file) { described_class.new }
    let(:output_sample) { File.open('resultant_output_sample.txt').readlines }

    it 'returns a clause data and section data in hash object' do
      expect(file.update_template).to eq output_sample.join
    end
  end
end
