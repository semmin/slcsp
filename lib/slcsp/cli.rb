# frozen_string_literal: true

require 'thor'

Dir[File.join(File.dirname(__FILE__), '*.rb')].each { |file| require file }

module Slcsp
  # cli client
  class CLI < Thor
    attr_accessor :zip_index, :plan_index

    desc  "configure",
          "configures gem with the path of data files, metal level to search, output medium. \
            TODO: add CLI options for configuring"
    def configure
      dir = File.dirname(File.expand_path('../..', __FILE__))

      Slcsp::Config.configure do |config|
        config.zips_file = File.join(dir, 'data', 'zips.csv')
        say "configured zips file path to #{config.zips_file}"
        config.plans_file = File.join(dir, 'data', 'plans.csv')
        say "configured plans file path to #{config.plans_file}"
        config.slcsp_file = File.join(dir, 'data', 'slcsp.csv')
        say "configured slcsp file path to #{config.slcsp_file}"
        config.output_medium = $stdout
        say "configured output medium to be #{config.output_medium.inspect}"
        config.target_level = 'Silver'
        say "configured taregt level medium to be #{config.target_level}"
      end
    end

    desc  "index",
          "indexes data files for fast search later. \
            TODO: add CLI options for indexing"
    def index
      zip_index = Slcsp::Index.new()
      plan_index = Slcsp::Index.new()
      zip_parser = Slcsp::ZipParser.new(Slcsp::Config.zips_file, zip_index)
      plan_parser = Slcsp::PlanParser.new(Slcsp::Config.plans_file, plan_index)

      say "Started indexing zips file..."
      zip_parser.parse_and_record if zip_index.data.empty?
      say "Completed indexing zips file. Total: #{zip_index.data.size} records."

      say "Started indexing plans file..."
      plan_parser.parse_and_record if plan_index.data.empty?
      say "Completed indexing plans file. Total: #{plan_index.data.size} records."

      return zip_index, plan_index
    end

    desc  "match",
          "matches zip codes from slcsp.csv to SLCSP and prints to specified medium (STDOUT default)"
    def match
      @cli = Slcsp::CLI.new

      @cli.invoke :configure
      zip_index, plan_index = @cli.invoke :index

      slcsp_parser = Slcsp::SlcspParser.new(Slcsp::Config.slcsp_file)
      slcsp_matcher = Slcsp::SlcspMatcher.new(zip_index, plan_index, slcsp_parser)
      slcsp_matcher.match_each
    end
  end
end