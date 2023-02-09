# frozen_string_literal: true

module Slcsp
  # Sort of inverted index, in fact a simple hash for fast finds zip -> [rate_area, rate_area]
  # e.g. {'23451' => ['VA 11', 'VA 12'], '75025' => ['TX 1', 'TX 2']}
  class Index
    def initialize(data={})
      @data = data
    end

    attr_reader :data

    def get(key)
      @data.key?(key) ? @data[key] : nil
    end

    def set(key, val)
      if @data.key?(key)
        @data[key] << val
      else
        @data[key] = [val]
      end
    end
  end
end
