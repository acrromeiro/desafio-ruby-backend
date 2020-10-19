RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, :except => %w[type_transactions])
    Rails.application.load_seed # loading seeds
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean_with(:truncation, :except => %w[type_transactions])
  end
end
