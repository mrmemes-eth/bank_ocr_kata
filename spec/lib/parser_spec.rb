require_relative '../../lib/parser'

describe Parser do
  let(:numbers) { File.read('spec/fixtures/one_to_nine.txt') }
  subject { Parser.new(numbers) }

  context 'identifying 3x3 blocks as characters' do
    describe '#rows' do
      it 'yields an array of rows with the proper height' do
        expect(subject.rows.count).to be(3)
      end
    end

    describe '#matrix' do
      it 'yields a matrix with the proper width' do
        expect(subject.matrix.count).to be(9)
      end
      it 'yields a matrix with the proper height' do
        expect(subject.matrix.first.count).to be(3)
      end
    end
  end
end
