require "minitest/autorun"
require './fizzbuzz'

class FizzbuzzTest < MiniTest::Test
  def test_fizzbuzz
    fb = FizzBuzz.new
    %w(1 2 4 7 8 11 13 14).each do |x|
      assert_equal x.to_i, fb.fizzbuzz(x.to_i)
      assert_equal (x.to_i * -1), fb.fizzbuzz((x.to_i * -1))
      assert_equal 'Fizz', fb.fizzbuzz(x.to_i * 3)
      assert_equal 'Buzz', fb.fizzbuzz(x.to_i * 5)
      assert_equal 'Fizzbuzz', fb.fizzbuzz(x.to_i * 15)
    end
    
    assert_equal 'Fizzbuzz', fb.fizzbuzz(0), "Zero mode: #{fb.zero_mode}"
    fb.change_mode
    assert_equal 0.to_i, fb.fizzbuzz(0)

    assert_raises(TypeError) { fb.fizzbuzz("a string") }
    assert_raises(TypeError) { fb.fizzbuzz(12.2) }    
  end

  def test_initialize
    fb = FizzBuzz.new('tiger')
    refute fb.zero_mode
    fb = FizzBuzz.new(true)
    assert fb.zero_mode
    fb = FizzBuzz.new(false)
    refute fb.zero_mode
  end

  def test_change_mode
    fb = FizzBuzz.new
    refute fb.zero_mode
    fb.change_mode
    assert fb.zero_mode
    fb.change_mode
    refute fb.zero_mode
    fb.change_mode(true)
    assert fb.zero_mode
    fb.change_mode(false)
    refute fb.zero_mode
  end
end
