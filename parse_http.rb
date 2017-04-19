require 'benchmark'
require 'webrick'
require 'stringio'

REQUEST_TEXT = <<HTTP
GET / HTTP/1.1
Host: localhost:8001
Connection: keep-alive
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36
Accept-Encoding: gzip, deflate, sdch
Accept-Language: en-GB,en-US;q=0.8,en;q=0.6
HTTP

def f(num)
  num.times do
    req = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
    req.parse(StringIO.new(REQUEST_TEXT))
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }
