require 'nokogiri'

html = File.open('traffic.html', 'r') {|f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

nodes = doc.xpath('//*[@id="mdServiceStatus"]/dl/dt/text()')
traffic = nodes.each { |node| pp node }

file = File.open('trafficx_sample.html', 'w')
file.write(traffic)
file.close