require 'nokogiri'

html = File.open('traffic.html', 'r') {|f| f.read }
doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

nodes = doc.xpath('/html/body/div[1]/div[7]/ul')
nodes.each { |node| pp node }

