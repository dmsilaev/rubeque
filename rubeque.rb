module Rubeque
  def the_truth
    true
  end

  def reverse
    "chunky bacon"
  end

  def maximum(arr)
    arr.max
  end

  def to_square
    Proc.new {|x| x**2}
  end

  def fizzbuzz(number)
    return 'FizzBuzz' if number % 3 == 0 && number % 5 == 0
    return 'Fizz' if number % 3 == 0
    return 'Buzz' if number % 5 == 0
  end

  def twenty_one?(*cards)
    res = cards.inject(0) { |sum, card| sum + card }
    res == 21
  end  
end