# frozen_string_literal: true

require "singleton"

module Slcsp
  # Contains paths to data files: zips, plans, slcsp 
  class Config
    include Singleton

    class << self
      attr_accessor :zips_file, :plans_file, :slcsp_file, :target_level, :output_medium

      def configure
        yield self
      end

      def build_indexes
        @area_index = ZipParser.instance(zips_file)
        @area_index = PlanParser.instance(plans_file)
      end

      def area_index
        @area_index
      end

      def plan_index
        @area_index
      end
    end
  end
end
