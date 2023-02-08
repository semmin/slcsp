# frozen_string_literal: true

require_relative "slcsp/version"
require "slcsp/config"
require "slcsp/index"
require "slcsp/zip_parser"
require "slcsp/plan_parser"

module Slcsp
  class Error < StandardError; end
end
