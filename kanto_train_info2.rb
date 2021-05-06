# seleniumで操作が出来るようにします
require "selenium-webdriver"
 
# chromedriverを起動しています
driver = Selenium::WebDriver.for :chrome

#要素が見つからない場合最大で10秒間待つよう指定
driver.manage.timeouts.implicit_wait = 10

# Googleを開きます
driver.get "https://traininfo.jreast.co.jp/train_info/kanto.aspx"

# 抽出する部分　手っ取り早く取得するために場所を指定してテキストを抽出しseleniumTest.txtに書き出し
if  
  
  line = driver.find_element(:xpath,"/html/body/div/main/section[3]/section/section[1]/div/table/tbody/tr[1]/th/div/p[1]/span[2]").text
  coment = driver.find_element(:xpath,"/html/body/div/main/section[3]/section/section[1]/div/table/tbody/tr[1]/td/a/div/p[2]").text
  elements = {line: line, coment: coment}
  file = File.open('kanto_train_info.txt', 'w')
  file.write(elements)
  file.close
  
else
    puts "Not found"
end

# 10秒間待機します 要素検索時の10秒待ちに変更
# sleep 10
 
# ブラウザを閉じます
driver.quit
