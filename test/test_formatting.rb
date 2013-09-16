require 'test/unit'
require '../ruby/text_formatting'
require 'stringio'

class TestFormatting < Test::Unit::TestCase
  def test_java_text_formatting
    input = StringIO.new('{}')
    output = StringIO.new
    params = TextFormatting::ParamFormatting.new
    TextFormatting::java_text_formatting(input, output, params)
    assert output.string == "{\n}"
  end
end