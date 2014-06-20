class AccountNumberCharacterIntepreter
  attr_accessor :matrix

  ILLEGIBLE_CHAR = '?'

  DIGITS = {
    ' _ ' \
    '| |' \
    '|_|' => 0,
    '   ' \
    '  |' \
    '  |' => 1,
    ' _ ' \
    ' _|' \
    '|_ ' => 2,
    ' _ ' \
    ' _|' \
    ' _|' => 3,
    '   ' \
    '|_|' \
    '  |' => 4,
    ' _ ' \
    '|_ ' \
    ' _|' => 5,
    ' _ ' \
    '|_ ' \
    '|_|' => 6,
    ' _ ' \
    '  |' \
    '  |' => 7,
    ' _ ' \
    '|_|' \
    '|_|' => 8,
    ' _ ' \
    '|_|' \
    ' _|' => 9,
  }

  def initialize(matrix)
    self.matrix = matrix
  end

  def digit
    DIGITS[mash] || ILLEGIBLE_CHAR
  end

  def character_permutations(char)
    flat_matrix.each.with_index.reduce([]) do |acc,(_,idx)|
      acc << transpose_char_at_index(flat_matrix,char,idx).each_slice(3).to_a
    end.reject{|m| m.flatten.include?(nil) }
  end

  private

  def transpose_char_at_index(matrix,char,idx)
    matrix.dup.tap do |a|
      a[idx] = transpose_hash(char)[a[idx]]
    end
  end

  def flat_matrix
    @flat_matrix ||= matrix.flatten
  end

  def mash
    flat_matrix.join
  end

  def transpose_hash(char)
    { char => ' ', ' ' => char }
  end


end
