# frozen_string_literal: true

require 'pry'
require_relative 'documents/writer/content'
class TermsGenerator

  attr_reader :file_name
  def initialize(name = 'template_output.txt')
    @file_name = name
    @out_file = File.new(name, 'w+')
  end

  def generate_output_file
    @new_template_content = Documents::Writer::Content.new
    @out_file.puts(@new_template_content.update_template)
    @out_file.close
  end
end

new_terms = TermsGenerator.new
new_terms.generate_output_file
puts("Output has successfully written in #{new_terms.file_name}")
