# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'functions'
require_relative 'triangle'

class TestRobot < Minitest::Test
  def test_parse_file
    rnd = Random.new
    kol = rnd.rand(10..100) * 5
    m = []
    ma = -10_000_000
    (1..kol).step(1).each do |n|
      val = rnd.rand(-1_000_000..1_000_000)
      File.open('test.txt', 'a') do |file|
        file.write val, ' '
      end
      ma = val if ma < val
      if (n % 5).zero? && (n != 0)
        m[n / 5 - 1] = ma
        ma = -10_000_000
      end
    end
    parse_file('test.txt', 'test1.txt')
    i = 0
    File.open('test1.txt', 'r').each do |line|
      line.split(' ').each do |j|
        assert_equal(j.to_i, m[i])
        i += 1
      end
    end
    File.open('test.txt', 'w')
    File.open('test1.txt', 'w')
  end

  def test_triangle_classes
    prizm = Prizm.new(0, 0, 1, 1, 2, 2, 3)
    assert_equal([0, 0], prizm.get_a)
    assert_equal([1, 1], prizm.get_b)
    assert_equal([2, 2], prizm.get_c)
    assert_equal(3, prizm.get_h)
    assert_in_delta(16.97, prizm.get_square, 0.01)
  end
end
