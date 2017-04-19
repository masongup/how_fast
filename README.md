# How Fast Are Computers In Ruby #

This is based on the quiz game [Computers Are Fast](https://computers-are-fast.github.io/) that runs you through a series of estimations of how many times a computer can do various types of operations in 1 second. I ran through it, and noticed that most of the example code was in Python. Being primarily a Ruby-ist, I thought I'd try and do the same tasks in Ruby to see how it compares. Here's the tabulated results:



| Task             | Python        | Ruby          |
| ---------------- | ------------- | ------------- |
| Loop             | 68,000,000    | 27,000,000    |
| Dictionary       | 11,000,000    | 11,500,000    |
| Parse HTTP       | 25,000        | 2,700         |
| Download Webpage | 4             | 12            |
| Run Interpreter  | 77            | 18            |
| Write to Disk    | 342,000,000   | 1,000,000,000 |
| Write to RAM     | 2,000,000,000 | 2,000,000,000 |
| Parse JSON       | 449           | 430/750       |
| Parse Msgpack    | 4,000         | 1,000         |
| DB Indexed       | 53,000        | 38,000        |
| DB Unindexed     | 2             | 2             |
| Hash             | 455,000,000   | 700,000,000   |
| BCrypt Hash      | 3             | 16            |

### Notes ###

Most of the results here are broadly similar. I haven't run the Python examples myself, and am just using the original site's run counts, plus I'm not sure how fast the computer I ran it on is compared to the one the site's creator used, not to mention versions of the Python interpreter used, Ruby interpreter version, Gem and Python Package versions, etc, so this is anything but scientific.

A few are exactly the same - the Write to RAM and Dictionary.

Many of the differences, I would attribute to interpreted vs native code in the library for that particular task, including the Parse HTTP, Parse Msgpack, Hash and BCrypt tasks.

Write to Disk I'd tend to blame on having a SSD on my test box, and who-knows-what on the other guy's test box.

Download webpage differences are probably due to the network connection speed on both sides.

Parse Json looks interesting. The two results are the native Ruby Json implementation vs the compiled Oj Ruby Json library. I don't know how the data being parsed compares, though I tried to match the claimed data size. It's interesting that the native speed is very close to Python, while the compiled speed is almost twice as fast.

I'm not sure what's with the speed difference on the indexed DB. Maybe Python's connection to Sqlite is faster, or maybe the DB data is structured differently.

One of these days, I may try to re-run the Python tests for more consistent results, and look into the implementation of the libraries and find the real reason for the speed differences. For now, this is all I got.