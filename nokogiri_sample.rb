require 'nokogiri'

html = File.open('traffic.html', 'r') {|f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

nodes = doc.xpath('//*[@id="Traffic-39"]/th/a[2]')
nodes.each { |node| pp node }


