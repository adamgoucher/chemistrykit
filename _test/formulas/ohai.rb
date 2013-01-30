module PageObjects
  class Ohai

    def initialize(driver)
      @driver = driver
    end

    def open(url)
      @driver.get url
    end
  end
end
