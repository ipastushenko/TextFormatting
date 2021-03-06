require 'open-uri'
require 'test/unit'
require '../ruby/rw_param_formatting'
require '../ruby/text_formatting'
require 'stringio'
require '../ruby/reader'

class TestFormatting < Test::Unit::TestCase
  def test_java_text_formatting
    #  input = TextFormatting::Reader.new
    open('http://www.stackoverflow.com') {|input|
      output = File.new('output.txt', 'w')
      params = TextFormatting::RWParamFormatting.read StringIO.new('<>;  ')
      TextFormatting::java_text_formatting(input, output, params)
    }
  end
end