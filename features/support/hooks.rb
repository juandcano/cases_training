# frozen_string_literal: true

# frozen_string_literal: true.
# Before do
#   navigate_to($app_path)
#   # generate_data
# end

# Before ('@login') do
#  login_pj
# end

After do
  $driver.manage.delete_all_cookies
  $driver.local_storage.clear
  sleep 1
end
