# frozen_string_literal: true

require "slcsp/plan_parser"
require "pry"

RSpec.describe Slcsp::PlanParser do
  let(:index) { Slcsp::Index.new({}) }
  let(:plan_parser) { Slcsp::PlanParser.new(Slcsp::Config.plans_file, index) }

  it "responds to parse_and_record" do
    expect(plan_parser).to respond_to :parse_and_record
  end

  context "parse_and_record" do
    it "records target plans from file" do
      plan_parser.parse_and_record
      expect(index.data.size).to eql 3
    end
  end
end
