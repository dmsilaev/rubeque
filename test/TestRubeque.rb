require "minitest/autorun"
require "./rubeque"

class TestRubeque < MiniTest::Unit::TestCase
  include Rubeque

  #elementary
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
    assert_equal [1, 3, 7, 4, 9, 8].find(&:even?), 4
  end

  def test_temperature_bot
    assert_equal temperature_bot(18), "I like this temperature"
    assert_equal temperature_bot(21), "I like this temperature"
    assert_equal temperature_bot(22), "This is uncomfortable for me"
    assert_equal temperature_bot(-3), "This is uncomfortable for me"
  end

  def test_injected_and_rejected
    assert_equal sum_over_50([29, 52, 77, 102]), 231
    assert_equal sum_over_50([5, 11, 50]), 0
    assert_equal sum_over_50([4, 8, 15, 16, 23, 42]), 0
    assert_equal sum_over_50([300, 22, 1, 55, 42]), 355
  end

  def test_no_way_works
    @name = "Dave"
    str = "My mind is going #@name"

    assert_equal (str == "My mind is going Dave"), the_truth
  end

  def test_home_range
    assert_equal (1..100).to_a[11..94].reduce(:+), 4494
  end

  def test_array_item_removal
    assert_equal ([:r, :u, :b, :e, :q, :u, :e].delete_if { |i| i != :b && i != :q }), [:b, :q]
  end

  def test_versus_and
    roses = "blue" && "red"
    violets = "blue" and "red"

    assert_equal roses, "red"
    assert_equal violets, "blue"
  end

  def test_subtracting_sugar
    assert_equal 2.+(2), 2 + 2
    assert_equal 40.+(2), 42
  end

  def test_no_way_works_v2
    str = "Hello" "World"

    assert_equal str, "HelloWorld"
  end

  def test_or_equal
    b = 8
    c = false

    a ||= "rubeque"
    b ||= "rubeque"
    c ||= "rubeque"

    assert_equal a, "rubeque"
    assert_equal b, 8
    assert_equal c, "rubeque"
  end

  def test_brackets_and_searches
    assert_equal "hello world"[1], "e"
    assert_equal "what"[8],        nil
    assert_equal "rubeque"[-1],     "e"
    assert_equal "E"[2],           nil
  end

  #easy
  def test_reverse_each_word
    assert_equal "olleH ,ereht dna woh era ?uoy", reverse_each_word("Hello there, and how are you?")
  end

  def test_class
    assert_equal Bar.new.say_name, "bar"
  end

  def test_random_numbers
    a = rand(100..500)
    b = rand(100..500)
    c = rand(100..500)
    d = rand(100..500)

    assert_equal (a > 99 && a < 501), true
    assert_equal (b > 99 && b < 501), true
    assert_equal (c > 99 && c < 501), true
    assert_equal (d > 99 && d < 501), true
  end

  def test_fibo_finder
    assert_equal 0, fibo_finder(0)
    assert_equal 1, fibo_finder(1)
    assert_equal 1, fibo_finder(2)
    assert_equal 2, fibo_finder(3)
    assert_equal 3, fibo_finder(4)
    assert_equal 13, fibo_finder(7)
    assert_equal 55, fibo_finder(10)
  end

  def test_key_for_min_value
    assert_equal key_for_min_value({"k" => 2, "h" => 3, "j" => 1}), "j"
    assert_equal key_for_min_value({"o" => 0, "z" => -2, "j" => 1}), "z"
    assert_equal key_for_min_value({}), nil
  end

  def test_constant_rule
    assert_equal SimpleConst.new.foo, CONST
  end

  #medium
  def test_do_pigs_fly
    assert_equal do_pigs_fly?, false
  end

  def test_math_is_easy?
    assert_equal math_is_easy?, true
  end

  def test_array_to_hash
    ary = [1,2,3,4,5]
    #Keys should be double
    result = ary.to_hash_values { |a| a*2 }
    assert_equal(result[2], 1)
    assert_equal(result[6], 3)
    assert_equal(result[10], 5)
        
    #Keys should be string of value
    result = ary.to_hash_values { |a| a.to_s }
    assert_equal(result["1"], 1)
    assert_equal(result["3"], 3)
    assert_equal(result["5"], 5)
  end
end
