require 'benchmark'
require 'json'
require 'oj'

def f(num)
  raw_data = IO.read('mock_data.json')
  num.times do |n|
    JSON.load(raw_data)
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }
