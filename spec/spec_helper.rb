require "bundler/setup"

require "simplecov"

SimpleCov.start do
  add_filter "/spec/"
end

require "browser_scroll"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

RSpec.configure do |config|
  config.before(:all) do
    @browser = Watir::Browser.new(:chrome)
  end

  config.after(:all) do
    @browser.quit
  end

  config.before(:each) do
    @browser.goto "file://#{File.dirname(__FILE__)}/fixtures/page.html"
  end

  def visible?(element)
    @browser.execute_script('return isElementInViewport(arguments[0]);', element)
  end
end
