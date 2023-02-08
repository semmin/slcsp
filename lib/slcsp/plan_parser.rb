# frozen_string_literal: true

require "csv"
require "pry"

module Slcsp
  # parses the csv with plans and save data to Index in the form
  # e.g. {'VT 11' => [102.1, 192.3]} for the defined metall class
  class PlanParser
    KEY_FIELDS = %w[state rate_area].freeze
    VALUE_FIELDS = %w[rate].freeze

    def initialize(path, index)
      @path = path
      @index = index
    end

    def parse_and_record
      File.open(@path) do |file|
        CSV.foreach(file, headers: true) do |row|
          next if row['metal_level'] && row['metal_level'] != Slcsp::Config.target_level

          key, value = "#{row[KEY_FIELDS[0]]} #{row[KEY_FIELDS[1]]}", row[VALUE_FIELDS.join(' ')]
          @index.set(key, value)
        end
      end
    end
  end
end