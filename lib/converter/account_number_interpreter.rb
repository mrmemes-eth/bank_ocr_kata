require_relative 'account_number_character_interpreter'

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

  def checksum
    integers.reverse.map.with_index do |num,idx|
      num * idx.succ
    end.reduce(:+)
  end

  def valid?
    checksum % 11 == 0
  end

  private

  def integers
    account_number.split(//).map(&:to_i)
  end

end
