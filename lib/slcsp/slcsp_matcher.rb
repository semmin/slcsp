# frozen_string_literal: true

require 'pry'

module Slcsp
  # gets input from SlcspParse, finds rate_areas and SLCSP 
  class SlcspMatcher
    def initialize(zip_index, plan_index, slcsp_parser)
      @zip_index = zip_index
      @plan_index = plan_index
      @slcsp_parser = slcsp_parser
      @output_medium = Slcsp::Config.output_medium
    end

    def match_each
      @output_medium.print(@slcsp_parser.headers_line)
      @slcsp_parser.parse_each do |row|
        second = match(row)
        @output_medium.print("#{row['zipcode']},#{format(second)}\n")
      end
    end

    private

    def match(row)
      rate_areas = @zip_index.get(row['zipcode'])
      plans = []
      rate_areas.each do |rate_area|
        temp_plans = @plan_index.get(rate_area)
        plans += temp_plans if temp_plans
      end

      plans.size < 2 ? nil : plans.sort[1]
    end

    def format(number)
      converted = number.to_f
      converted.zero? ? nil : sprintf('%.2f', converted)
    end
  end
end
