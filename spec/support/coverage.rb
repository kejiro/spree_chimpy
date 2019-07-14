if ENV['COVERAGE']
  # Run Coverage report
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Overrides', 'app/overrides'
    add_group 'Libraries', 'lib'

    add_filter '/bin/'
    add_filter '/db/'
    add_filter '/script/'
    add_filter '/spec/'

    coverage_dir "#{ENV['COVERAGE_DIR']}" if ENV['COVERAGE_DIR']
  end
end
