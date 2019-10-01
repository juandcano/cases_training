# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'byebug'

When 'click on select test' do
  is_element_displayed(:xpath, "//a[@href='selectTest.htm'][contains(.,'Select Test')]")
  click(:xpath, "//a[@href='selectTest.htm'][contains(.,'Select Test')]")
  # $driver.switch_to.alert.accept
end
 
And 'select option' do
  select_option_from_dropdown(:id, :value, 'o4val', 's4Id')
  @p = get_element_text(:xpath, "//option[@value='o4val']")
end

Then 'validate option selected {string}' do |word|
  expect(@p).to eq(word)
end

And 'select option {string}' do |word|
  select_option_from_dropdown(:id, :text, word, 's1')
end

Then 'validate option selected dropdown {string}' do |word|
  is_option_from_dropdown_selected(:id, :text, word, 's1', word = true)
end