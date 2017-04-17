require 'benchmark'
require 'stringio'

CHUNK = 'a' * 1_000_000

def f(num)
  written = 0
  StringIO.open('out') do |f|
    until written >= num do
      written += f.write(CHUNK)
    end
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }

#2_000_000_000 ish
#vs python 2_000_000_000
