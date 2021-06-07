require 'net/http'
require 'nokogiri'

def get_from(url)
  Net::HTTP.get(URI(url))
end

html = get_from('https://transit.yahoo.co.jp/traininfo/detail/86/0/')

doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

nodes = doc.xpath('//*[@id="mdServiceStatus"]/dl/dt')
@traffic = nodes.each { |node| pp node }
