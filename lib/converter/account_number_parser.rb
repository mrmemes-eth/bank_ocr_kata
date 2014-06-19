class AccountNumberParser
  attr_accessor :ocr_string

  def initialize(ocr_string)
    self.ocr_string = ocr_string
  end

  def rows
    ocr_string.split(/\n/)
  end

  def matrix
    rows.map{|r| r.split(//).each_slice(3).to_a }.transpose
  end
end
