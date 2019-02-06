# frozen_string_literal: true

# Module for Page Objects
module Pages
  # Selenium Easy Input Form page object
  class SeleniumEasyInputFormPage
    attr_reader :browser

    def initialize(browser)
      @browser = browser
    end

    # Contact Form
    # @example
    #   contact_form.find_element(name: 'first_name')
    def contact_form
      browser.no_such_element_rescue do
        browser.find_element(id: 'contact_form')
      end
    end

    # First Name
    # @example
    #   selenium_easy_input_form_page_obj.first_name.send_keys 'first name'
    def first_name
      contact_form.find_element(name: 'first_name')
    end

    # Last Name
    # @example
    #   selenium_easy_input_form_page_obj.last_name.send_keys 'last name'
    def last_name
      contact_form.find_element(name: 'last_name')
    end

    # Email
    # @example
    #   selenium_easy_input_form_page_obj.email.send_keys 'some_email@mail.com'
    def email
      contact_form.find_element(name: 'email')
    end

    # Phone
    # @example
    #   selenium_easy_input_form_page_obj.phone.send_keys '0191 2327766'
    def phone
      contact_form.find_element(name: 'phone')
    end

    # Address
    # @example
    #   selenium_easy_input_form_page_obj.address.send_keys '19 sonme street'
    def address
      contact_form.find_element(name: 'address')
    end

    # City
    # @example
    #   selenium_easy_input_form_page_obj.city.send_keys 'Newcastle Upon Tyne'
    def city
      contact_form.find_element(name: 'city')
    end

    # State
    # @example
    #   selenium_easy_input_form_page_obj.state.send_keys 'State'
    def state
      contact_form.find_element(name: 'state')
    end

    # Zip Code
    # @example
    #   selenium_easy_input_form_page_obj.zip_code.send_keys 'Zip Code'
    def zip_code
      contact_form.find_element(name: 'zip')
    end

    # Website
    # @example
    #   selenium_easy_input_form_page_obj.website.send_keys 'https://www.mysite.com'
    def website
      contact_form.find_element(name: 'website')
    end

    # No Hosting
    # @example
    #   selenium_easy_input_form_page_obj.no_hosting.click
    def no_hosting
      contact_form.find_element(css: '[name="hosting"][value="no"]')
    end

    # Description
    # @example
    #   selenium_easy_input_form_page_obj.description.send_keys 'Description'
    def description
      contact_form.find_element(name: 'comment')
    end

    # Submit Button
    # @example
    #   selenium_easy_input_form_page_obj.submit.click
    def submit
      contact_form.find_element(css: '[type="submit"]')
    end

    # Success message
    # @example
    #   expect(selenium_easy_input_form_page_obj.success_message).to be_displayed
    def success_message
      contact_form.find_element(id: 'form_success_message')
    end
  end
end
