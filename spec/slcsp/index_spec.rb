# frozen_string_literal: true

require "slcsp/index"
require "pry"

RSpec.describe Slcsp::Index do
  let(:index) { Slcsp::Index.new({'23451' => ['VA 1', 'VA 2']}) }

  it "responds to get" do
    expect(index).to respond_to :get
  end

  context "get" do
    it "gets area when present" do
      expect(index.get('23451')).to eql ['VA 1', 'VA 2']
    end

    it "returns nil when not found" do
      expect(index.get('111111')).to eql nil
    end
  end

  context "set" do
    it "set area" do
      index.set('23454', 'VA 4')
      expect(index.get('23454')).to eql ['VA 4']
    end
  end
end
