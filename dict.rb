require 'benchmark'

def f(num)
  dict = {}
  num.times do |n|
    dict[n % 1000] = n
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }
