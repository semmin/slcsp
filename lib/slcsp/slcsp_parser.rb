# frozen_string_literal: true

require "csv"

module Slcsp
  # parses the csv with slcsp zips and yeild line by line for external use 
  class SlcspParser
    def initialize(path)
      @path = path
    end

    def parse_each(&block)
      return unless block_given?

      File.open(@path) do |file|
        CSV.foreach(file, headers: true) do |row|
          block.call row
        end
      end
    end
  end
end