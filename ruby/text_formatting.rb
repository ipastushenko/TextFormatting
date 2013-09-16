require '../ruby/param_formatting'
require '../ruby/errors'

# Module formatting text
module TextFormatting
  module_function

  # formatting text
  # +input+:: stream of char with function IO.each_char
  # +output+:: stream of char with function IO.write
  # +params+:: parameters for formatting text
  # raises: IOError, NoMethodError, ParamTypeError, NoOpenBrokenError, NoCloseBrokenError
  def java_text_formatting(input, output, params)
    raise ParamTypeError unless params.instance_of? ParamFormatting

    count_broken = 0
    end_of_line = false;
    input.each_char {|current_char|
      #close broken
      if current_char == params.close_broken
        count_broken -= 1
        raise NoOpenBrokenError if count_broken < 0
        end_of_line = true
      end

      #write end of line
      if current_char != "\n" and end_of_line
        output.write("\n")
        count_broken.downto(1) { output.write(params.tabs) }
        end_of_line = false
      end

      #write char
      unless current_char == "\n"
        output.write(current_char)
      end

      #open broken
      if current_char == params.open_broken
        count_broken += 1
        end_of_line = true
      end

      #end of line
      if current_char == params.eof_line_char or current_char == "\n" or current_char == params.close_broken
        end_of_line = true
      end
    }
    raise NoCloseBrokenError if count_broken > 0

  rescue NoOpenBrokenError
    input.each_char {|current_char| output.write(current_char)}
    raise NoOpenBrokenError
  end
end