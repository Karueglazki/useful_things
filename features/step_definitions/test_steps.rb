
When(/^I go to "(.*?)"$/) do |site_url|
  visit site_url

end


Then(/^I resize windows$/) do |table|
  table.hashes.each do |hash|
    browser = Capybara.current_session.driver.browser
    # Phantomjs
    page.driver.resize(20,30)
    # SELENIUM
    browser.manage.window.resize_to(hash[:width], hash[:height])
    page.driver.browser.navigate.refresh
    page.driver.browser.navigate.back
    size = browser.manage.window.size
    p size.height
    p size.width
    p screen_width = browser.execute_script("return screen.width;")
    p screen_height = browser.execute_script("return screen.height;")
  end
end