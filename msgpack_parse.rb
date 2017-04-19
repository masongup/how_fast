require 'benchmark'
require 'msgpack'

def f(num)
  raw_data = IO.read('mock_data.msgpack')
  num.times do |n|
    MessagePack.unpack(raw_data)
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }
