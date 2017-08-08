require "bundler/setup"
Bundler.require(:default, :test, :development)

require "siracha"

Dir['./spec/supports/**/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.include SirachaTestHelpers
  config.include Siracha::Stream

  config.before do
    ARGV.replace []
  end
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    create_tmp_directory
  end


end

