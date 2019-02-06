# frozen_string_literal: true

# Partnerize Technical task module
module AjpPartnerizeTechnicalTask
  # default local driver and browser helpers
  class Browser
    attr_accessor :driver

    def initialize(driver)
      @driver = driver

      # make browser full screen
      maximize_browser
    end

    def maximize_browser
      # maximise browser to screen size
      screen_width = @driver.execute_script('return screen.width;')
      screen_height = @driver.execute_script('return screen.height;')
      driver.manage.window.resize_to(screen_width, screen_height)
    end

    # Generic browser methods
    #
    # used to navigate to a url
    # @example
    #   browser.navigate_to
    def navigate_to(url)
      driver.navigate.to url
    end

    # used to rescue selenium error NoSuchElementError
    # Use in page object when we want to test an element id not displayed
    # when it does not exist on the DOM
    # @example
    # def contact_form
    #   browser.no_such_element_rescue do
    #     browser.find_element(id: 'contact_form')
    #   end
    # end
    # @return [Object] displayed?: false
    def no_such_element_rescue
      yield
    rescue Selenium::WebDriver::Error::NoSuchElementError
      OpenStruct.new(displayed?: false)
    end

    # used to close the browser
    # @example
    #   browser.close_browser
    def close_browser
      driver.close
    end

    # used to get the current url
    # @example
    #   browser.current_url
    def current_url
      driver.current_url
    end

    # finder methods
    #
    # used to find an element
    # @example
    #   browser.find_element(locator)
    # @return [element]
    def find_element(locator)
      retry_exception(exception: Selenium::WebDriver::Error::StaleElementReferenceError, retries: 2) do
        driver.find_element(locator)
      end
    end

    # This is used to wait untill action is performed
    # @example
    #   browser.wait_until(timeout: 10) { element.displayed? }
    def wait_until(timeout: 10)
      wait(timeout).until do
        yield
      end
    end

    # used to make element wait for certain amount of time
    # @example
    #   wait(120).until { wizard_page.business_name.displayed? }
    def wait(seconds)
      Selenium::WebDriver::Wait.new(timeout: seconds)
    end

    # Retry exeception
    # Retries the method execution if exception is hit
    # @example
    #   retry_exception(exception: Selenium::WebDriver::Error::StaleElementReferenceError) do
    #     wait(5).until { element.displayed? }
    #   end
    # @param exception (defaults to: nil)
    # @param retries (defaults to: 3)
    def retry_exception(exception: nil, retries: 3)
      yield
    rescue exception
      sleep 0.01
      retry unless (retries -= 1).zero?
    end
  end
end
