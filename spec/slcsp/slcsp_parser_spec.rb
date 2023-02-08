# frozen_string_literal: true

require "slcsp/slcsp_parser"

RSpec.describe Slcsp::SlcspParser do
  let(:slcsp_parser) { Slcsp::SlcspParser.new(Slcsp::Config.slcsp_file) }

  it "responds to parse_and_record" do
    expect(slcsp_parser).to respond_to :parse_each
  end

  context "parse_each" do
    it "yields each line" do
      content = []
      slcsp_parser.parse_each do |row|
        content << row['zipcode']
      end
      expect(content.size).to eql 10
      expect(content.first).to eql '64148'
      expect(content.last).to eql '27702'
    end
  end
end
