require_relative 'converter/account_number_parser'
require_relative 'converter/account_number_interpreter'

class Converter
  attr_accessor :file

  def initialize(path)
    self.file = file_from(path)
  end

  def parse
    file.split(/\n\n/)
  end

  def matrices
    parse.map do |number_string|
      AccountNumberParser.new(number_string).matrix
    end
  end

  def account_numbers
    interpreters.map(&:account_number)
  end

  def verified_account_numbers
    interpreters.reduce({}) do |result, interpreter|
      result.tap do |hash|
        hash[interpreter.account_number] = interpreter.valid?
      end
    end
  end

  private
  def file_from(path)
    File.read(File.expand_path(path))
  end

  def interpreters
    matrices.map do |matrix|
      AccountNumberInterpreter.new(matrix)
    end
  end
end
