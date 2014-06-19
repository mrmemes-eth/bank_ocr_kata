require_relative '../../lib/parser'

describe Parser do
  let(:numbers) do
    <<-NUMBERS
        _  _     _  _  _  _  _
      | _| _||_||_ |_   ||_||_|
      ||_  _|  | _||_|  ||_| _|
    NUMBERS
  end
  subject { Parser.new(numbers) }

  context 'identifying 3x3 blocks' do
    it 'parses rows' do
      expect(subject.rows.count).to be(3)
    end
  end
end
