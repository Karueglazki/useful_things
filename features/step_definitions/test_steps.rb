
When(/^I go to "(.*?)"$/) do |site_url|
  visit site_url

end

Then(/^I resize windows$/) do |table|
  # browser = Capybara.current_session.driver.browser
  table.hashes.each do |row|
    browser = Capybara.current_session.driver.browser
    browser.manage.window.resize_to(row[:width], row[:height])
    page.driver.browser.navigate.refresh
    page.driver.browser.navigate.back
     # save_screenshot("#{Rails.root}/features/screenshot/#{row[:width]}to#{row[:height]}.png", :full => true)
    save_screenshot("/home/alex/Documents/work/cucumber/features/screenshot/#{row[:width]}to#{row[:height]}.png", :full => true)
    #size = browser.manage.window.size
    #p size.height
    #p size.width
    #p screen_width = browser.execute_script("return screen.width;")
    #p screen_height = browser.execute_script("return screen.height;")
  end
end