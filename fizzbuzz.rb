#!/usr/bin/ruby

  # Zero is divisible by 3 and five evenly, as well as every other number
  # Zero getting Fizzbuzz is therefore no necessarily in line with the 
  # specifications.  Setting zero_mode to true will cause '0' to be 
  # returned for '0'.  False will return 'Fizzbuzz'

class FizzBuzz
  attr_reader :zero_mode
  
  SETTING_ENUM = [true, false].freeze

  def initialize(zero_mode=false)
    if SETTING_ENUM.include?(zero_mode)
      @zero_mode = zero_mode
    else
      @zero_mode = false
    end
  end

  def change_mode(setting=nil)
    if setting.nil?
      @zero_mode = !zero_mode
    else
      @zero_mode = setting if SETTING_ENUM.include?(zero_mode)
    end
  end

  def fizzbuzz(x)
    raise TypeError, "Value \"#{x}\" is not a Fixnum" unless x.is_a?(Fixnum)
    zero = ->(x) {x == 0}
    fizz = ->(x) {x % 3 == 0}
    buzz = ->(x) {x % 5 == 0}
    fizzbuzz = ->(x) {fizz[x] && buzz[x]}
    return case x
      when zero then zero_value
      when fizzbuzz then 'Fizzbuzz'
      when fizz then 'Fizz'
      when buzz then 'Buzz'
      else x
    end
  end

  private
  def zero_value
    @zero_mode ? 0 : 'Fizzbuzz'
  end
end

#fb = FizzBuzz.new(true)
#(-100 .. 100).each {|x| puts "#{fb.fizzbuzz(x)}"}
