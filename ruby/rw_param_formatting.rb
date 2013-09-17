require '../ruby/i_readable'
require '../ruby/i_writeable'
require '../ruby/param_formatting'

# Module formatting text
module TextFormatting
  # enum parameters
  #
  class RWParamFormatting < ParamFormatting
    include IReadable
    include IWriteable
    def self.read(input)
      open_broken = input.readchar
      close_broken = input.readchar
      eof_line_char = input.readchar
      tabs = input.readline
      RWParamFormatting.new(open_broken, close_broken, eof_line_char, tabs)
    end

    def write(output)
      output.write(@open_broken)
      output.write(@close_broken)
      output.write(@eof_line_char)
      output.write(@tabs)
      output.write("\n")
    end
  end
end