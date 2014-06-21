require_relative 'account_number_character_interpreter'
require_relative 'account_number_validator'

class AccountNumberInterpreter
  attr_accessor :matrices

  def initialize(matrices)
    self.matrices = matrices
  end

  def account_number
    character_interpreters.map(&:digit).join
  end

  def possible_account_numbers
    character_interpreters.map.with_index do |interpreter,idx|
      interpreter.permutations.map do |permutation|
        account_number.tap {|n| n[idx] = permutation.to_s }
      end
    end.flatten(1).select do |number|
      AccountNumberValidator.new(number).valid?
    end
  end

  def validation_description
    AccountNumberValidator.new(account_number).validation_description
  end

  private

  def character_interpreters
    matrices.map do |matrix|
      AccountNumberCharacterIntepreter.new(matrix)
    end
  end

end
