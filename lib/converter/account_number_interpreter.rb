require_relative 'account_number_character_interpreter'
require_relative 'account_number_validator'

class AccountNumberInterpreter
  attr_accessor :matrices

  def initialize(matrices)
    self.matrices = matrices
  end

  def account_number
    matrices.map do |matrix|
      AccountNumberCharacterIntepreter.new(matrix).digit
    end.join
  end

  def valid?
    legible? && validator.valid?
  end

  def invalid?
    !valid?
  end

  def error_description
    if illegible?
      ' ILL'
    elsif invalid?
      ' ERR'
    end
  end

  def illegible?
    account_number.include?(AccountNumberCharacterIntepreter::ILLEGIBLE_CHAR)
  end

  def legible?
    !illegible?
  end

  private

  def validator
    @validator ||= AccountNumberValdiator.new(integers)
  end

  def integers
    account_number.split(//).map(&:to_i)
  end

end
