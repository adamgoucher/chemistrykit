require 'rspec/core/shared_context'
require File.join(Dir.getwd, 'lib', 'tailored', 'webdriver')

module ChemistryKit
  module SharedContext
    extend RSpec::Core::SharedContext

    before(:each) do
      capabilities = Selenium::WebDriver::Remote::Capabilities.send(CHEMISTRY_CONFIG['webdriver']['browser'])

      if CHEMISTRY_CONFIG['saucelabs']['ondemand']
        executor = "http://#{SAUCE_CONFIG['username']}:#{SAUCE_CONFIG['key']}@ondemand.saucelabs.com:80/wd/hub"
        if CHEMISTRY_CONFIG['webdriver']['browser'] != 'chrome'
          capabilities[:version] = CHEMISTRY_CONFIG['saucelabs']['version']
        end
        capabilities[:platform] = CHEMISTRY_CONFIG['saucelabs']['platform']
      else
        executor = 'http://' + CHEMISTRY_CONFIG['webdriver']['server_host'] + ":" + CHEMISTRY_CONFIG['webdriver']['server_port'].to_s + '/wd/hub'
      end
      @driver = ChemistryKit::Tailored::Driver.new(:url => executor, :desired_capabilities => capabilities)
    end

    after(:each) do
      @driver.quit
    end
  end
end
