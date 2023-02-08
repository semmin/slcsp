# frozen_string_literal: true

require "slcsp/slcsp_matcher"
require "slcsp/slcsp_parser"
require "helpers/output_helper"

RSpec.describe Slcsp::SlcspMatcher do
  include OutputHelper

  let(:zip_index) { Slcsp::Index.new({}) }
  let(:plan_index) { Slcsp::Index.new({}) }
  let(:zip_parser) { Slcsp::ZipParser.new(Slcsp::Config.zips_file, zip_index) }
  let(:plan_parser) { Slcsp::PlanParser.new(Slcsp::Config.plans_file, plan_index) }
  let(:slcsp_parser) { Slcsp::SlcspParser.new(Slcsp::Config.slcsp_file) }

  before do
    zip_parser.parse_and_record
    plan_parser.parse_and_record
    @slcsp_matcher = Slcsp::SlcspMatcher.new(zip_index, plan_index, slcsp_parser)
  end

  context "match" do
    it "matches expected" do
      expect(@slcsp_matcher.send(:match, {'zipcode'=>'64148'})).to eq '421.43'
    end
  end
end