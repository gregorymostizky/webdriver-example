require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://www.xomba.com/filmmaker-amanda-pennington-gets-poetic?kona_ad=31476_63118'

link = driver.find_element(:id, 'KonaLink0')
driver.action.move_to(link).perform

# wait for a specific element to show up
wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
frame = nil
wait.until { frame = driver.find_element(:id => "thirdPartyKonteraFrame_0") }

driver.switch_to.frame(frame)
wait.until { frame = driver.find_element(:id => "all_ads") }


driver.save_screenshot('./shots/firefox.png')
driver.quit