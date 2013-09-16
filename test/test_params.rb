require 'test/unit'
require '../ruby/param_formatting'

class TestParams < Test::Unit::TestCase
  def test_param_type_error
    assert_raise TextFormatting::ParamTypeError do
      params = TextFormatting::ParamFormatting.new(12, "1", "12", "123")
    end
  end

  def test_param_error
    assert_raise TextFormatting::ParamError do
      params = TextFormatting::ParamFormatting.new("12", "1", "12", "123")
    end
  end

  def test_default_init
    params = TextFormatting::ParamFormatting.new
    assert params.open_broken == '{'
    assert params.close_broken == '}'
    assert params.eof_line_char == ';'
    assert params.tabs == '    '
  end
end