# seleniumで操作が出来るようにします
require "selenium-webdriver"
 
# chromedriverを起動しています
driver = Selenium::WebDriver.for :chrome
 
# Googleを開きます
driver.get "https://www.seiburailway.jp/railwayinfo/index.html"

# 抽出する部分　手っ取り早く取得するために場所を指定してテキストを抽出しseleniumTest.txtに書き出し
if  coment = driver.find_element(:xpath,"/html/body/div[1]/div/div/div/div/section[2]/div/div/div/div/div[5]/div/div/p/a").text
    time = driver.find_element(:xpath,"/html/body/div[1]/div/div/div/div/section[2]/div/div/div/div/div[1]/div/div/p/time").text
  elements = {coment: coment, time: time}
  file = File.open('seleniumTest.txt', 'w')
  file.write(elements)
  file.close
  
else
    puts "Not found"
end

# 10秒間待機します
sleep 10
 
# ブラウザを閉じます
driver.quit
