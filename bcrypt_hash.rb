require 'benchmark'
require 'bcrypt'

CHUNK = 'a' * 100

def f(num)
  num.times do
    BCrypt::Password.create(CHUNK)
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }

#16
#vs python 3 
