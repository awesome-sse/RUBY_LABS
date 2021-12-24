# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'functions'

class TestRobot < Minitest::Test
  def test_definite_integral
    assert_in_delta(0.4702571635987358, definite_integral(10), 10**-3)
  end

  def test_definite_advanced_integral
    assert_in_delta(0.4702571635987358, definite_integral_advanced(10), 10**-3)
  end

  def test_proc
    mml = minmax_block(&proc {
      max_val_1 = (0 - 1) / (0 + 2)
      min_val_1 = max_val_1
      max_val_2 = Math.sin(-1.5)
      min_val_2 = max_val_2
      (0..2).step(0.01).each do |x|
        max_val_1 = (x - 1) / (x + 2) if max_val_1 < (x - 1) / (x + 2)
        mix_val_1 = (x - 1) / (x + 2) if min_val_1 > (x - 1) / (x + 2)
      end
      (-1..1).step(0.01).each do |x|
        max_val_2 = Math.sin(x / 2 - 1) if max_val_2 < Math.sin(x / 2 - 1)
        mix_val_2 = Math.sin(x / 2 - 1) if min_val_2 > Math.sin(x / 2 - 1)
      end
      [min_val_1, max_val_1, min_val_2, max_val_2]
    })
    assert_equal(mml[0], -1)
    assert_equal(mml[1], 0.25)
    assert_in_delta(mml[2], -0.9974949866040544, 0.000001)
    assert_in_delta(mml[3], -0.479425538604203, 0.000001)
  end

  def test_block
    mmb = minmax_block do
      max_val_1 = (0 - 1) / (0 + 2)
      min_val_1 = max_val_1
      max_val_2 = Math.sin(-1.5)
      min_val_2 = max_val_2
      (0..2).step(0.01).each do |x|
        max_val_1 = (x - 1) / (x + 2) if max_val_1 < (x - 1) / (x + 2)
        mix_val_1 = (x - 1) / (x + 2) if min_val_1 > (x - 1) / (x + 2)
      end
      (-1..1).step(0.01).each do |x|
        max_val_2 = Math.sin(x / 2 - 1) if max_val_2 < Math.sin(x / 2 - 1)
        mix_val_2 = Math.sin(x / 2 - 1) if min_val_2 > Math.sin(x / 2 - 1)
      end
      [min_val_1, max_val_1, min_val_2, max_val_2]
    end
    assert_equal(mmb[0], -1)
    assert_equal(mmb[1], 0.25)
    assert_in_delta(mmb[2], -0.9974949866040544, 0.000001)
    assert_in_delta(mmb[3], -0.479425538604203, 0.000001)
  end
end
