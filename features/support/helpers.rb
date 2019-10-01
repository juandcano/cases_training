# frozen_string_literal: true

require 'faker'

def open_browser(country)
  navigate_to(ENV.fetch(country))
end

def login(email, pass)
  enter_text(:id, ENV.fetch(email), 'email')
  enter_text(:id, ENV.fetch(pass), 'password')
end
