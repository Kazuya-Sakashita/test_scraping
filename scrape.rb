require 'net/http'

def get_from(url)
  Net::HTTP.get(URI(url))
end

html = get_from('https://www.seiburailway.jp/railwayinfo/index.html')

file = File.open('traffic.html', 'w')
file.write(html)
file.close