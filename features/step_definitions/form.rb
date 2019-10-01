# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'byebug'

# Given 'I am on shitest' do
#   open_browser('APP_PATH')
# end

When 'click on form test' do
  is_element_displayed(:xpath, "//a[@href='formTest.htm'][contains(.,'Form Test')]")
  click(:xpath, "//a[@href='formTest.htm'][contains(.,'Form Test')]")
  $driver.switch_to.alert.accept
end

And 'into text input {string}' do |word|
  is_element_displayed(:name, 't1')
  enter_text(:name, word, 't1')
  is_element_displayed(:xpath, '/html/body/form/table/tbody/tr[3]/td[2]/input')
  enter_text(:xpath, 'david', '/html/body/form/table/tbody/tr[3]/td[2]/input')
  is_element_displayed(:name, 'name')
  enter_text(:name, word, 'name')
end

And 'Into text text area' do
  enter_text(:xpath, 'todos podemos ser una mejor versión', "//textarea[@name='ta1']")
  is_element_displayed(:id, 's1Id')
  select_option_from_dropdown(:id, :value, 'o2', 's1Id')
  $driver.switch_to.alert.accept
end

And 'click checkbox' do
  check_checkbox(:name, 'c1')
  check_checkbox(:xpath, "//input[@type='checkbox' and @value='cv2']")
  check_checkbox(:xpath, "//input[@type='checkbox' and @value='cv3']")
  click(:name, 'r1')
  
end
