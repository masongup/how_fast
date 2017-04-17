require 'benchmark'
require 'tempfile'

CHUNK = 'a' * 1_000_000

def f(num)
  written = 0
  Tempfile.create('out') do |f|
    until written >= num do
      written += f.write(CHUNK)
    end
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }

#1_000_000_000
#vs python 342_000_000
