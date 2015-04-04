
  When(/^I go to "(.*?)"$/) do |site_url|
    visit site_url

  end


  Then(/^I resize windows$/) do |table|
    browser = Capybara.current_session.driver.browser
    table.hashes.each do |hash|
      # Phantomjs
      # page.driver.resize(20,30)
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


  When(/^I open new page$/) do
    open_new_window
    p'I do it'
  p  windows

    # within_window(page.driver.browser.window_handles.last) do

      page.driver.browser.switch_to.last_opened_window
      # page.driver.browser.close
    # windows.last
    # sleep 2
    url="presentain.com"
    visit url
    #   browser = page.driver.browser
    # p  current_id = browser.window_handle
    #
    #   tab_id = page.driver.find_window(url)
    #   browser.switch_to.window tab_id
    # visit "google.ru"
    #   page.driver.browser.close
    #   browser.switch_to.window current_id
    # p page.driver.browser.window_handles.size
  end