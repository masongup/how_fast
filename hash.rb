require 'benchmark'
require 'digest'

CHUNK = 'a' * 10_000

def f(num)
  digest = Digest::MD5.new
  bytes = 0
  until bytes > num
    digest.update(CHUNK)
    bytes += CHUNK.length
  end
  digest.hexdigest
end

puts Benchmark.measure { f(ARGV[0].to_i) }
