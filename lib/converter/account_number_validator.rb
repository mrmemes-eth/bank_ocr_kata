class AccountNumberValdiator
  attr_accessor :integers

  def initialize(integers)
    self.integers = integers
  end

  def checksum
    integers.reverse.map.with_index do |num,idx|
      num * idx.succ
    end.reduce(:+)
  end

  def valid?
    checksum % 11 == 0
  end

end
