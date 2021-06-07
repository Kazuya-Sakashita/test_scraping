require 'net/http'

def get_from(url)
  Net::HTTP.get(URI(url))
end

html = get_from('https://transit.yahoo.co.jp/traininfo/detail/86/0/')

file = File.open('traffic.html', 'w')
file.write(html)
file.close