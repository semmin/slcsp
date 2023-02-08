# frozen_string_literal: true

require "slcsp/zip_parser"

RSpec.describe Slcsp::ZipParser do
  let(:index) { Slcsp::Index.new({}) }
  let(:zip_parser) { Slcsp::ZipParser.new(Slcsp::Config.zips_file, index) }

  it "responds to parse_and_record" do
    expect(zip_parser).to respond_to :parse_and_record
  end

  context "parse_and_record" do
    it "records all zips from file" do
      zip_parser.parse_and_record
      expect(index.data.size).to eql 10
    end
  end
end
