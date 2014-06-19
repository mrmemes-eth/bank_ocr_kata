require_relative '../../lib/parser'

describe Parser do
  let(:numbers) { File.read('spec/fixtures/one_to_nine.txt') }
  subject { Parser.new(numbers) }

  context 'identifying 3x3 blocks' do
    it 'parses rows' do
      expect(subject.rows.count).to be(3)
    end
  end
end
