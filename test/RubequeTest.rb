require "minitest/autorun"
require "./rubeque"

class RubequeTest < MiniTest::Unit::TestCase
  include Rubeque

  def test_the_truth
    assert_equal true, the_truth
  end
end
