# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'functions'


class TestRobot < Minitest::Test
  def test_y
      assert_in_delta(140.001903, calc_y(5), 0.00001) 
  end

  def test_correction_str
    str = "Hel^lo 2wor_ld!"
    assert_equal ['Hello _world', 4], correction_str(str)
  end
end
