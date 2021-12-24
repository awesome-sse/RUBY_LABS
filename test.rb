require 'minitest/autorun'
require_relative 'functions'

class TestRobot < Minitest::Test
  def test_parse_file
        rnd = Random.new 
        kol = rnd.rand(10..100) * 5
        m = []
        ma = -10000000
        (1..kol).step(1).each do |n|
            val = rnd.rand(-1000000..1000000)
            File.open("test.txt", "a") do |file|
                file.write val, " "
            end
            if ma < val 
                ma = val
            end
            if ((n % 5) == 0) and (n != 0)
                m[n / 5 - 1] = ma
                ma = -10000000
            end
            
        end
        parse_file("test.txt", "test1.txt")
        i = 0
        File.open("test1.txt", "r").each do |line|
            line.split(" ").each do |j|
                assert_equal(j.to_i, m[i]);
                i += 1
            end
        end
        File.open('test.txt', 'w')
        File.open('test1.txt', 'w')
    end

end
