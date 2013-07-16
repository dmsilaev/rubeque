module Rubeque
  CONST = rand

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

  #medium tests
  def reverse_each_word(sentence)
    sentence.split(' ').map { |e| e.reverse }.join(' ')
  end

  def fibo_finder(n)
    return 0 if n == 0

    n < 3 ? 1 : fibo_finder(n - 1) + fibo_finder(n - 2)
  end

  def key_for_min_value(hash)
    return nil if hash.empty?
    min_arr = hash.sort_by { |k,v| v }.first 
    min_arr.first
  end

  class SimpleConst
    CONST = rand(100)

    def foo
      return Rubeque.const_get(:CONST)
    end
  end

  class Foo
    def name
      "foo"
    end
    
    def say_name
      "#{name}"
    end
  end

  class Bar < Foo
    def name
      "bar"
    end
  end
end