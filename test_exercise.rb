require_relative "exercise"
require "test/unit"

class TestExercise < Test::Unit::TestCase
  test 'no match' do
    assert_equal("", Exercise.new(2).find(""))
  end

  test 'one char' do
    assert_equal("a", Exercise.new(2).find("a"))
  end

  test 'simple match' do
    assert_equal("bcb", Exercise.new(2).find("abcba"))
  end

  test 'hard match' do
    assert_equal("acacacaca", Exercise.new(2).find("abcbacacacaca"))
  end

  test 'hard match more tokens' do
    assert_equal("caccabacca", Exercise.new(3).find("caccabacca"))
  end
end
