require "selenium-webdriver"
require "rspec"

module ChemistryKit
  class MasterPageObject

    def initialize(driver)
      # browser type should be configurable form userland
      @driver = Selenium::Webdriver.for :firefox
      # 'implicit_wait' should be configurable from userland
      @driver.manage.timeouts.implicit_wait = 30
    end

  end
end
