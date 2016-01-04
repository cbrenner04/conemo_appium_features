# filename: ./spec/features/configuration_spec.rb

describe 'Upon initial load of application, an authorized user' do
  it 'successfully configures the application' do
    configuration.enter_id('1234567')
    driver.hide_keyboard
    configuration.submit
    home.assert_on_page
  end
end
