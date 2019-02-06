require 'rest-client'
require 'json'

# Get the json response for a person
# @example
#   get_person_json(person_id: 1)
# @return [Json] person
# @param [Integer] person_id
def get_person_json(person_id: nil)
  response = RestClient.get "https://swapi.co/api/people/#{person_id}"
  JSON.parse response.body
end

# Get the first name and last name of person
# @example
#   get_person_names(person_id: 1)
# @return [String] @first_name
# @return [String] @last_name
# @param [Integer] person_id
def get_person_names(person_id: nil)
  raise 'person_id is required' unless person_id
  person = get_person_json(person_id: person_id)
  @first_name = person['name'].split(' ').first
  @last_name = person['name'].split(' ').last
end
