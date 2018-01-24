require 'minitest/autorun'

class SampleClass
  def is_sample?
    true
  end
end

class SampleClassTest < Minitest::Test
  def setup
    @sample = SampleClass.new
  end

  def test_is_sample
    assert_equal @sample.is_sample?, true
  end
end
