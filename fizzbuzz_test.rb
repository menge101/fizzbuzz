require "minitest/autorun"
require './fizzbuzz'

class FizzbuzzTest < MiniTest::Test
  def test_fizzbuzz
    %w(1 2 4 7 8 11 13 14).each do |x|
      assert_equal x.to_i, fizzbuzz(x.to_i)
      assert_equal (x.to_i * -1), fizzbuzz((x.to_i * -1))
      assert_equal 'Fizz', fizzbuzz(x.to_i * 3)
      assert_equal 'Buzz', fizzbuzz(x.to_i * 5)
      assert_equal 'Fizzbuzz', fizzbuzz(x.to_i * 15)
    end
    assert_equal 'Fizzbuzz', fizzbuzz(0)
    assert_raises(TypeError) { fizzbuzz("a string") }
    assert_raises(TypeError) { fizzbuzz(12.2) }    
  end
end
