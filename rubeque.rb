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
    cards.inject(0) { |sum, card| sum + card } == 21
  end  

  def temperature_bot(temp)
    # temperature bot is American but takes Celsius temperatures
    case temp
    when (18 .. 21)
      "I like this temperature"
    else
      "This is uncomfortable for me"
    end
  end

  def sum_over_50(mass)
    mass.inject(0) { |sum, num| (num > 50) ? sum + num : sum }
  end
end