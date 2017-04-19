require 'benchmark'

def f(num)
  num.times do |n|
    `ruby -e ''`
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }
