ENV['RAILS_ENV'] ||= 'test'

begin
  require File.expand_path('../dummy/config/environment', __FILE__)
rescue LoadError
  puts 'Could not load dummy application. Please ensure you have run `bundle exec rake test_app`'
  exit
end

require 'rspec/rails'
require 'ffaker'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each {|f| require f}

require 'spree/testing_support/i18n' if ENV['CHECK_TRANSLATIONS']
require 'shoulda-matchers'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.order = :random
  Kernel.srand config.seed

end
