require_relative 'account_number_character_interpreter'

class AccountNumberValidator
  attr_accessor :account_number

  def initialize(account_number)
    self.account_number = account_number
  end

  def checksum
    integers.reverse.map.with_index do |num,idx|
      num * idx.succ
    end.reduce(:+)
  end

  def valid?
    legible? && checksum % 11 == 0
  end

  def invalid?
    !valid?
  end

  def validation_description
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

  def integers
    account_number.split(//).map(&:to_i)
  end

end
