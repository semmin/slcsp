# frozen_string_literal: true

require "slcsp/config"

RSpec.describe Slcsp::Config do
  it "responds to data paths" do
    expect(Slcsp::Config).to respond_to :zips_file
    expect(Slcsp::Config).to respond_to :plans_file
    expect(Slcsp::Config).to respond_to :slcsp_file
  end

  it "responds to indexes" do
    expect(Slcsp::Config).to respond_to :plan_index
    expect(Slcsp::Config).to respond_to :area_index
  end
end
