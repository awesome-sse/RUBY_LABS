require 'minitest/autorun'
require_relative 'functions'

class TestRobot < Minitest::Test
  def test_calculate_error_for_integral
    value_intergal = Math.sqrt(3) - Math::PI / 12 - 1
    (2..100).step(1).each do |n|
      assert_in_delta((definite_integral(n) - value_intergal).abs,
                      calculate_error_for_integral(definite_integral(n)), 10**-6)
      assert_in_delta((definite_integral_advanced(n) - value_intergal).abs,
                      calculate_error_for_integral(definite_integral_advanced(n)), 10**-6)
    end
  end

  def test_minmax
    f_x_1 = ->(x) { (x - 1) / (x + 2) }
    f_x_2 = ->(x) { Math.sin(x / 2 - 1) }
    assert_equal([0, 2], minmax(f_x_1, 0, 2))
    assert_equal([-1, 1], minmax(f_x_2, -1, 1))
    assert_equal([0, 2], minmax_block(0, 2) { |x| (x - 1) / (x + 2) })
    assert_equal([-1, 1], minmax_block(-1, 1) { |x| Math.sin(x / 2 - 1) })
  end
end
