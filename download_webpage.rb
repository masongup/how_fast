require 'benchmark'
require 'net/http'

def f(num)
  num.times do |n|
    Net::HTTP.get('www.google.com', '/')
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }

# 12ish?
