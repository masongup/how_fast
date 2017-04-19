require 'benchmark'
require 'sqlite3'

def f(num)
  db = SQLite3::Database.new('unindexed_db.sqlite')
  num.times do
    db.execute('select * from my_table where key = ?', 5) do |r|
      puts r
    end
  end
end

puts Benchmark.measure { f(ARGV[0].to_i) }
