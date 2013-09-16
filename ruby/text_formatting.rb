require '../ruby/param_formatting'
require '../ruby/errors'

#logger
require 'log4r'
include Log4r
#logger

# Module formatting text
module TextFormatting
  #logger
  logger = Logger.new 'logger_text_formatting'
  logger.outputters = Outputter.stdout
  #logger

  module_function

  # formatting text
  #
  # @param input[Reader] stream of char with function IO.each_char
  # @param output[Writer] stream of char with function IO.write
  # @param params[ParamFormatting] parameters for formatting text
  # raises: IOError, NoMethodError, ParamTypeError, NoOpenBrokenError, NoCloseBrokenError
  def java_text_formatting(input, output, params)
    logger = Logger['logger_text_formatting']
    logger.info('start function')
    raise ParamTypeError unless params.instance_of? ParamFormatting

    logger.info('start convert')
    count_broken = 0
    end_of_line = false
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
    logger.info('end convert')
  rescue NoOpenBrokenError
    logger.error('Error: no open broken')
    input.each_char {|current_char| output.write(current_char)}
    raise NoOpenBrokenError
  end
end