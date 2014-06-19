class Parser
  attr_accessor :ocr_string
  def initialize(ocr_string)
    self.ocr_string = ocr_string
  end

  def rows
    ocr_string.split(/\n/)
  end

  def cols
    rows.map{|r| r.split(//) }.transpose
  end
end
