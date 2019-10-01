# frozen_string_literal: true

require 'selenium-cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'byebug'

values1, values2 = ''
Given 'I am on shitest' do
  open_browser('APP_PATH')
end

When 'click on frames' do
  click(:xpath, "//a[@href='framesTest.htm'][contains(.,'Frames Test')]")
end

And 'clic both link test on frames' do
  switch_frame($driver.find_element(:name, 'top'))
  is_element_displayed(:xpath, "//a[@href='linkTest.htm'][contains(.,'Link Test')]")
  # $driver.find_element(By.linkText("Link Test")).click()
  click(:xpath, "//a[@href='linkTest.htm'][contains(.,'Link Test')]")
  values1 = get_element_text(:xpath, '//h2')
  switch_to_main_window
  switch_frame($driver.find_element(:xpath, '/html/frameset/frame[2]'))
  click(:xpath, "//a[@href='linkTest.htm'][contains(.,'Link Test')]")
  values2 = get_element_text(:xpath, '//h2')
end

Then 'i validate the title {string}' do |word|
  expect(values1).to eq(word)
  expect(values1).to eq(word)
end

When 'click on iframes' do
  click(:xpath, "//a[@href='iframesTest.htm'][contains(.,'IFrames Test')]")
end

And 'clic test on iframes' do
  is_element_displayed(:xpath, '/html/body/iframe')
  switch_frame($driver.find_element(:xpath, '/html/body/iframe'))
  is_element_displayed(:xpath, "//a[@href='linkTest.htm'][contains(.,'Link Test')]")
  click(:xpath, "//a[@href='linkTest.htm'][contains(.,'Link Test')]")
  values1 = get_element_text(:xpath, '//h2')
  switch_to_main_window
  wait_for_element_to_display(:xpath, "//*[@id='another']/iframe", 15)
  switch_frame($driver.find_element(:xpath, "//*[@id='another']/iframe"))
  is_element_displayed(:xpath, "//a[@href='linkTest.htm'][contains(.,'Link Test')]")
  click(:xpath, "//a[@href='linkTest.htm'][contains(.,'Link Test')]")
  values1 = get_element_text(:xpath, '//h2')
end
