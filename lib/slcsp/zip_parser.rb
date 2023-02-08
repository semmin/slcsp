# frozen_string_literal: true

require 'csv'

module Slcsp
  # parses the csv with zip and save data to Index in the form
  # e.g. {'23451' => ['VA 11', 'VA 12'], '75025' => ['TX 1', 'TX 2']}
  class ZipParser
    KEY_FIELDS = %w[zipcode].freeze
    VALUE_FIELDS = %w[state rate_area].freeze

    def initialize(path, zip_index)
      @path = path
      @zip_index = zip_index
    end

    def parse_and_record
      File.open(@path) do |file|
        CSV.foreach(file, headers: true) do |row|
          key, value = row[KEY_FIELDS.join(' ')], "#{row[VALUE_FIELDS[0]]} #{row[VALUE_FIELDS[1]]}"
          @zip_index.set(key, value)
        end
      end
    end
  end
end