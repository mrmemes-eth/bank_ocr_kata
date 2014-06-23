require_relative 'account_number_character_interpreter'
require_relative 'account_number_validator'
require 'forwardable'

class AccountNumberInterpreter
  attr_accessor :matrices

  extend Forwardable
  def_delegators :validator, :illegible?, :valid?, :invalid?

  def initialize(matrices)
    self.matrices = matrices
  end

  def account_number
    if valid? || possible_account_numbers.count != 1
      interpreted_account_number
    else
      possible_account_numbers.first
    end
  end

  def interpreted_account_number
    character_interpreters.map(&:digit).join
  end

  def possible_account_numbers
    character_interpreters.map.with_index do |interpreter,idx|
      interpreter.permutations.map do |permutation|
        interpreted_account_number.tap {|n| n[idx] = permutation.to_s }
      end
    end.flatten.select do |number|
      AccountNumberValidator.new(number).valid?
    end
  end

  def error_description
    if illegible? && possible_account_numbers.empty?
      ' ILL'
    elsif possible_account_numbers.count > 1
      " AMB #{possible_account_numbers}"
    end
  end

  private

  def validator
    @validator ||= AccountNumberValidator.new(interpreted_account_number)
  end

  def character_interpreters
    matrices.map do |matrix|
      AccountNumberCharacterIntepreter.new(matrix)
    end
  end

end
