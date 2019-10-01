# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'byebug'

When 'click on Click Page' do
  is_element_displayed(:xpath, "//a[@href='clicks.htm'][contains(.,'Clicks Page')]")
  click(:xpath, "//a[@href='clicks.htm'][contains(.,'Clicks Page')]")
  # $driver.switch_to.alert.accept
end

And 'I do double click and right click' do
  double_click(:xpath, '//input[@value="dbl click me"]')
  $driver.action.context_click($driver.find_element(:xpath, '//input[@value="right click me"]')).perform
end

Then 'validate the action {string}' do |word|
  expect(get_element_attribute(:xpath, "//textarea[contains(@name,'t2')]", 'value')).to eq(word + '[RIGHT_CLICK]')
end
