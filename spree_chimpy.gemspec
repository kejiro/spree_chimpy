# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_chimpy'
  s.version     = '3.3.0'
  s.summary     = 'MailChimp/Spree integration using the mailchimp gem'
  s.description = s.summary
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Joshua Nussbaum'
  s.email     = 'josh@godynamo.com'
  s.homepage  = 'http://github.com/spree-contrib/spree_chimpy'
  s.license   = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 3.1.0'
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_extension'
  s.add_dependency 'gibbon', '~> 3.0'

  s.add_development_dependency 'capybara', '~> 3.12', '< 4'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'coffee-rails', '~> 4.2'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner', '~> 1.5'
  s.add_development_dependency 'email_spec', '~> 2.1'
  s.add_development_dependency 'factory_bot_rails', '~> 4.7'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec-rails', '~> 3.5'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
  s.add_development_dependency 'simplecov', '~> 0.12'
  s.add_development_dependency 'spree_backend', spree_version
  s.add_development_dependency 'spree_frontend', spree_version
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'appraisal'

  s.add_development_dependency 'webmock', '~> 3.0.1'
  s.add_development_dependency 'apparition'

  s.add_development_dependency 'rubocop'
end
