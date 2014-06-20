require_relative '../../lib/converter/account_number_parser'

describe AccountNumberParser do
  let(:numbers) { File.read('spec/fixtures/one_to_nine.txt') }
  let(:parser)  { described_class.new(numbers) }

  context 'parsing 3x3 character blocks' do
    describe '#rows' do
      subject { parser.rows }
      it 'yields an array of rows with the proper height' do
        expect(subject.count).to be(3)
      end
    end

    describe '#matrix' do
      subject { parser.matrix }
      it 'yields a matrix with the proper width' do
        expect(subject.count).to be(9)
      end
      it 'yields a matrix with the proper height' do
        expect(subject.first.count).to be(3)
      end
    end
  end
end
