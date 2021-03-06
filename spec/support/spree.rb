require 'spree/testing_support/factories'
require 'spree/testing_support/url_helpers'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/preferences'
#require 'spree/testing_support/flash'
#require 'spree/testing_support/order_walkthrough'
#require 'spree/testing_support/caching'
#require 'spree/testing_support/image_helpers'


RSpec.configure do |config|
  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::ControllerRequests, type: :controller
  config.include Spree::TestingSupport::Preferences

  config.before do
    reset_spree_preferences
  end
end
