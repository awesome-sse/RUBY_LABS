require 'minitest/autorun'
require_relative 'functions'

def real_y(x)
  Math.log(x) / Math.cos(x)**2 + x**3 - 5
end

def real_correction(str)
  kol = 0
  words = str.split(' ')
  (0..words.length - 1).each do |i|
    if /[^[a-zA-Z0-9]]/.match(words[i])
      words[i] = ''
      kol += 1
    elsif /[a-zA-Z]/.match(words[i]) and /[0-9]/.match(words[i][0])
      words[i][0] = '_'
      kol += 1
    end
  end
  str = words.join(' ')
  [str, kol]
end

class TestRobot < Minitest::Test
  def test_y
    (1..1000).each do |x|
      assert_equal real_y(x), calc_y(x)
    end
  end

  def test_correction_str
    str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-=+_!@\#$%^&?/.><"
    (0..200).each do |_j|
      test_str = []
      (0..rand(1..100)).each do |_i|
        test_str.push(str[rand(0..str.length - 1)])
        test_str.push(' ') if rand(0..3) == 3
      end
      assert_equal real_correction(test_str.join), correction_str(test_str.join)
    end
  end
end
