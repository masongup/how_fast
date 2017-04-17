require 'benchmark'

def f(num)
  num.times do end
end

puts Benchmark.measure { f(ARGV[0].to_i) }

#27_000_000
#vs python 68_000_000
