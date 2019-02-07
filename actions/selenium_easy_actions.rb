# frozen_string_literal: true

# Module for Page Objects
module Actions
  # Selenium Easy actions
  module SeleniumEasyActions
    attr_reader :browser

    # Defines new instance of selelenium easy input form page
    # @example
    #   selenium_easy_input_form_page = selenium_easy_input_form_page_obj
    def selenium_easy_input_form_page_obj
      Pages::SeleniumEasyInputFormPage.new(browser)
    end

    # Navigates to selenium easy
    # @example
    #   go_to_selenium_easy_test_form
    def go_to_selenium_easy_test_form
      @browser.navigate_to('https://www.seleniumeasy.com/test/input-form-demo.html')
      browser.wait_until { selenium_easy_input_form_page_obj.contact_form.displayed? }
    end

    # Submit customer contact form
    # @example
    # sumbit_customer_contact_form(
    #   first_name: @first_name,
    #   last_name: @last_name,
    #   state: ' Florida',
    #   website: @browser.current_url,
    #   no_hosting: true,
    #   description: "#{@puzzle_answer_one} #{@puzzle_answer_two}"
    # )
    # @param first_name (defaults to: nil)
    # @param last_name (defaults to: nil)
    # @param email (defaults to: 'example@mail.com')
    # @param phone (defaults to: '0191 2334459')
    # @param address (defaults to: 'my address')
    # @param city (defaults to: 'Newcastle' )
    # @param state (defaults to: nil)
    # @param zip_code (defaults to: '12345')
    # @param website (defaults to: nil)
    # @param no_hosting (defaults to: nil)
    # @param description (defaults to: nil)
    def sumbit_customer_contact_form(
      first_name: nil,
      last_name: nil,
      email: 'text',
      phone: 'text',
      address: 'text',
      city: 'text',
      state: nil,
      zip_code: 'text',
      website: nil,
      no_hosting: nil,
      description: nil
    )
      selenium_easy_input_form_page = selenium_easy_input_form_page_obj

      selenium_easy_input_form_page.first_name.send_keys first_name
      selenium_easy_input_form_page.last_name.send_keys last_name
      selenium_easy_input_form_page.email.send_keys email
      selenium_easy_input_form_page.phone.send_keys phone
      selenium_easy_input_form_page.address.send_keys address
      selenium_easy_input_form_page.city.send_keys city

      list_items = selenium_easy_input_form_page.state.find_elements(tag_name: 'option')
      list_items.find do |list_item|
        list_item.text == state
      end.click

      selenium_easy_input_form_page.state.send_keys state
      selenium_easy_input_form_page.zip_code.send_keys zip_code
      selenium_easy_input_form_page.website.send_keys website
      selenium_easy_input_form_page.no_hosting.click if no_hosting
      selenium_easy_input_form_page.description.send_keys description
      selenium_easy_input_form_page.submit.click
    end
  end
end
