# frozen_string_literal: true

require "slcsp"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

dir = File.dirname(__FILE__)
Slcsp::Config.configure do |config|
  config.zips_file = File.join(dir, 'doc', 'zips.csv')
  config.plans_file = File.join(dir, 'doc', 'plans.csv')
  config.slcsp_file = File.join(dir, 'doc', 'slcsp.csv')
  config.target_level = 'Silver'
end
