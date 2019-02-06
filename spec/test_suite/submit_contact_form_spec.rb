# frozen_string_literal: true

describe 'Partnerize Technical Task' do
  it 'Customer can submit a contact form with valid data' do
    Given 'I know the user first and last names' do
      @browser.navigate_to('https://www.seleniumeasy.com/test/input-form-demo.html')
      get_person_names(person_id: 1)
    end

    And 'I can solve the puzzles' do
      puzzle_one = [22, 24, 0, 100, 4, 111, 2602]
      puzzle_two = [60, 33, 1719, 25, 19, 13, -21]

      @puzzle_answer_one = solve_puzzle(puzzle_one)
      @puzzle_answer_two = solve_puzzle(puzzle_two)
    end

    When 'I fill in the selenium easy test form with valid data' do
      go_to_selenium_easy_test_form

      sumbit_customer_contact_form(
        first_name: @first_name,
        last_name: @last_name,
        state: ' Florida',
        website: @browser.current_url,
        no_hosting: true,
        description: "#{@puzzle_answer_one} #{@puzzle_answer_two}"
      )
    end

    Then 'I expect the form submission to be successful' do
      expect(selenium_easy_input_form_page_obj.success_message).to be_truthy
    end
  end
end
