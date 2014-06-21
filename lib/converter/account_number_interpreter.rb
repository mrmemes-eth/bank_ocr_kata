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

  def validation_description
    AccountNumberValidator.new(account_number).validation_description
  end

end
