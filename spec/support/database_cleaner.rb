require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    ApplicationRecord.connection.increment_open_transactions if ApplicationRecord.connection.open_transactions < 0
    if example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.start
    end
  end

  config.after(:each) do |example|
    DatabaseCleaner.clean

    if example.metadata[:js]
      DatabaseCleaner.strategy = :transaction
    end
  end
end
