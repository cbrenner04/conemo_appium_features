require 'appium_lib'
require 'rspec'
require 'env'
Dir['./lib/pages/**/*.rb'].each { |file| require file }

apk = {
  platformName: :android,
  deviceName: ENV['DEVICE'],
  app: ENV['PATH_TO_APK']
}

driver = Appium::Driver.new(caps: apk)
Appium.promote_singleton_appium_methods Pages
Appium.promote_appium_methods RSpec::Core::ExampleGroup

RSpec.configure do |config|
  config.before(:suite) do
    start_driver
    wait { configuration.enter_id(ENV['CONFIG_TOKEN']) }
    driver.hide_keyboard
    configuration.submit
    home.assert_on_page
  end
  config.after(:suite) { driver_quit }
  config.after(:each) do |example|
    if example.exception
      name = example.description.tr(' ', '-').gsub(%r{/^.*\/spec\//}, '')
      path = "screenshots/#{name}"
      driver.screenshot path
      driver_quit
      start_driver
      wait { configuration.enter_id(ENV['CONFIG_TOKEN']) }
      driver.hide_keyboard
      configuration.submit
      home.assert_on_page
    end
  end
end
