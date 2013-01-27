require 'rspec/core/shared_context'
require File.join(Dir.getwd, 'config', 'requires')

module ChemistryKit
  module SharedContext
    extend RSpec::Core::SharedContext

    before(:each) do
      if CHEMISTRY_CONFIG['chemistrykit']['run_locally']
        @driver = Selenium::WebDriver.for(CHEMISTRY_CONFIG['webdriver']['browser'].to_sym)
      else
        capabilities = Selenium::WebDriver::Remote::Capabilities.send(CHEMISTRY_CONFIG['webdriver']['browser'])

        if CHEMISTRY_CONFIG['saucelabs']['ondemand']
          MAGIC_KEYS = [
          :caller,
          :description,
          :description_args,
          :example_group,
          :example_group_block,
          :execution_result,
          :file_path,
          :full_description,
          :line_number,
          :location
          ]
          executor = "http://#{SAUCE_CONFIG['username']}:#{SAUCE_CONFIG['key']}@ondemand.saucelabs.com:80/wd/hub"
          if CHEMISTRY_CONFIG['webdriver']['browser'] != 'chrome'
            capabilities[:version] = CHEMISTRY_CONFIG['saucelabs']['version']
          end
          capabilities[:platform] = CHEMISTRY_CONFIG['saucelabs']['platform']
        else
          executor = 'http://' + CHEMISTRY_CONFIG['webdriver']['server_host'] + ":" + CHEMISTRY_CONFIG['webdriver']['server_port'].to_s + '/wd/hub'
        end

        @driver = ChemistryKit::WebDriver::Driver.new(:url => executor, :desired_capabilities => capabilities)
      end
    end

    after(:each) do
      if CHEMISTRY_CONFIG['saucelabs']['ondemand']
        session_id = @driver.session_id
      end

      @driver.quit

      if CHEMISTRY_CONFIG['saucelabs']['ondemand']
        # puts self.example.metadata
        example_tags = self.example.metadata.collect{ |k, v|
          if not MAGIC_KEYS.include?(k) 
            if v.to_s == 'true'
              k
            else
              "#{k}:#{v}"
            end
          end
        }
        example_tags.compact!
        puts self.example.exception
        payload = {
          :tags => example_tags,
          :name => self.example.metadata[:full_description],
          :passed => self.example.exception ? false : true
        }
        puts payload.to_json
      end
    end
  end
end
