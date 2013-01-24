require 'chemistrykit/webdriver'

module ChemistryKit
  module PhoneHome
    class Driver < ChemistryKit::WebDriver::Driver
      #Subclassing ChemistryKit's WebDriver::Driver object to gain access to Selenium WebDriver from Homeland
    end
  end
end
