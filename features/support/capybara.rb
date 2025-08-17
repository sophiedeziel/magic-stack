# frozen_string_literal: true

require 'capybara/cucumber'
require 'capybara/rails'
require 'selenium-webdriver'

# Configure Capybara
Capybara.configure do |config|
  config.default_driver = :rack_test
  config.javascript_driver = :selenium_chrome_headless
  config.default_max_wait_time = 10
  config.ignore_hidden_elements = true
  config.match = :prefer_exact
  config.exact = true
end

# Configure Chrome options for headless testing
Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new') # Use new headless mode for better performance
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-web-security')
  options.add_argument('--disable-extensions')
  options.add_argument('--disable-background-timer-throttling')
  options.add_argument('--disable-backgrounding-occluded-windows')
  options.add_argument('--disable-renderer-backgrounding')
  options.add_argument('--window-size=1400,1400')

  # CI-specific optimizations
  if ENV['CI']
    options.add_argument('--memory-pressure-off')
    options.add_argument('--max_old_space_size=4096')
    options.add_argument('--disable-background-networking')
    options.add_argument('--disable-default-apps')
    options.add_argument('--disable-sync')
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# Use JavaScript driver for scenarios tagged with @javascript
Before('@javascript') do
  Capybara.current_driver = :selenium_chrome_headless
end

After('@javascript') do
  Capybara.use_default_driver
end
