require '../ruby/errors'
require '../ruby/i_param_formatting'

# Module formatting text
module TextFormatting
  # enum parameters
  class ParamFormatting
    include IParamFormatting

    attr_reader :open_broken, :close_broken, :eof_line_char, :tabs

    # create params
    # @param open_broken [String] must be String and length = 1
    # @param close_broken [String] must be String and length = 1
    # @param eof_line_char [String] must be String and length = 1
    # @param tabs [String] must be String
    # raises: ParamTypeError, ParamError
    def initialize(open_broken='{', close_broken='}', eof_line_char=';', tabs='    ')
      raise ParamTypeError unless open_broken.instance_of? String and close_broken.instance_of? String \
       and eof_line_char.instance_of? String  and tabs.instance_of? String
      raise ParamError unless open_broken.length == 1 and close_broken.length == 1 and eof_line_char.length == 1

      @open_broken = open_broken
      @close_broken = close_broken
      @eof_line_char = eof_line_char
      @tabs = tabs
    end

    def to_s
      "close_broken = '#{@close_broken}'; open_broken = '#{@open_broken}'; eof_line_char = '#{@eof_line_char}'; tabs = '#{@tabs}'"
    end
  end
end