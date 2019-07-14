require 'capybara/rspec'
require 'capybara/rails'
require 'capybara-screenshot/rspec'
require 'capybara/apparition'


RSpec.configure do |_config|
  Capybara.register_driver :apparition do |app|
    Capybara::Apparition::Driver.new(app, {
        headless: true,
        debug: true,
        js_errors: false,
    })
  end

  Capybara::Screenshot.register_driver(:apparition) do |driver, path|
    driver.save_screenshot(path)
  end

  Capybara.server = :webrick
  Capybara.save_and_open_page_path = ENV['CIRCLE_ARTIFACTS'] if ENV['CIRCLE_ARTIFACTS']
  Capybara.javascript_driver = :apparition
end
