#!/usr/bin/ruby

def fizzbuzz(x)
  raise TypeError, "Value \"#{x}\" is not a Fixnum" unless x.is_a?(Fixnum)
  fizz = ->(x) {x % 3 == 0}
  buzz = ->(x) {x % 5 == 0}
  fizzbuzz = ->(x) {fizz[x] && buzz[x]}
  return case x
    when fizzbuzz then 'Fizzbuzz'
    when fizz then 'Fizz'
    when buzz then 'Buzz'
    else x
  end
end

(-100 .. 100).each {|x| puts "#{fizzbuzz(x)}"}
