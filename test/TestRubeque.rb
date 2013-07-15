require "minitest/autorun"
require "./rubeque"

class TestRubeque < MiniTest::Unit::TestCase
  include Rubeque

  def test_the_truth
    assert_equal true, the_truth
  end

  def test_reverse
    assert_equal 'nocab yknuhc'.reverse, reverse
  end

  def test_hello_world
    assert_equal 'HELLO WORLD', 'hello world'.upcase
  end

  def test_maximum
    assert_equal maximum([2, 42, 22, 02]), 42
    assert_equal maximum([-2, 0, 33, 304, 2, -2]), 304
    assert_equal maximum([1]), 1
  end

  def test_nil_values
    [0, '', 'chunky_bacon'].each { |v| assert_equal v.nil?, false }
  end

  def test_map
    assert_equal [1, 4, 9, 16], (1..4).map(&to_square)
  end

  def test_fizzbuzz
    assert_equal fizzbuzz(3), "Fizz"
    assert_equal fizzbuzz(50), "Buzz"
    assert_equal fizzbuzz(15), "FizzBuzz"
    assert_equal fizzbuzz(5175), "FizzBuzz"
  end

  def test_missing_method
    assert_equal [1, 4, nil, 9, 16, nil].compact.inject(0) {|sum, number| sum + number}, 30
  end

  def test_twenty_one
    assert_equal twenty_one?(3, 4, 5, 6, 3), true
    assert_equal twenty_one?(3, 11, 10), false
    assert_equal twenty_one?(10, 11), true
  end

  def test_missing_method_p2
    assert_equal [1, 3, 7, 4, 9, 8].___(&:even?), 4
  end
end
