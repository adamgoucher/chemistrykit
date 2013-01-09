require 'rspec/core/shared_context'
require 'selenium-webdriver'

module ChemistryKit
  module SharedContext
    extend RSpec::Core::SharedContext

    before(:each) do
      executor = 'http://' + CHEMISTRY_CONFIG['webdriver']['server_host'] + ":" + CHEMISTRY_CONFIG['webdriver']['server_port'].to_s + '/wd/hub'
      capabilities = Selenium::WebDriver::Remote::Capabilities.send(CHEMISTRY_CONFIG['webdriver']['browser'])
      @driver = Selenium::WebDriver.for(:remote, :url => executor, :desired_capabilities => capabilities)
    end

    after(:each) do
      @driver.quit
    end
  end
end
