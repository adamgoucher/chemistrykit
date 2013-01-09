require 'rspec/core/shared_context'
require 'chemistrykit/webdriver'

module ChemistryKit
  module SharedContext
    extend RSpec::Core::SharedContext

    before(:each) do
      executor = 'http://' + CHEMISTRY_CONFIG['webdriver']['server_host'] + ":" + CHEMISTRY_CONFIG['webdriver']['server_port'].to_s + '/wd/hub'
      capabilities = Selenium::WebDriver::Remote::Capabilities.send(CHEMISTRY_CONFIG['webdriver']['browser'])
      @driver = ChemistryKit::WebDriver::Remote::Bridge.new(:url => executor, :desired_capabilities => capabilities)
    end

    after(:each) do
      @driver.quit
    end
  end
end
