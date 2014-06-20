require_relative '../lib/converter'

describe Converter do
  let(:converter) { described_class.new(path) }

  describe '#parse' do
    subject { converter.parse }

    context 'with ocr_account_numbers.txt' do
      let(:path) { './spec/fixtures/ocr_account_numbers.txt' }
      it 'returns 11 account number strings' do
        expect(subject.count).to eq(11)
      end
    end

    context 'with one_to_nine.txt' do
      let(:path) { './spec/fixtures/one_to_nine.txt' }
      it 'returns 1 account number string' do
        expect(subject.count).to eq(1)
      end
    end
  end

  describe '#matrices' do
    subject { converter.matrices }

    context 'with one_to_nine.txt' do
      let(:path) { './spec/fixtures/one_to_nine.txt' }
      it 'returns an array with one account number string' do
        expect(subject.count).to eq(1)
        expect(subject.first.count).to eq(9)
      end
    end

    context 'with ocr_account_numbers.txt' do
      let(:path) { './spec/fixtures/ocr_account_numbers.txt' }
      it 'returns an array with one account number string' do
        expect(subject.count).to eq(11)
      end
    end
  end

  describe '#account_numbers' do
    subject { converter.account_numbers }
    context 'with one_to_nine.txt' do
      let(:path) { './spec/fixtures/one_to_nine.txt' }
      it 'returns an array with one account number string' do
        expect(subject).to eq(['123456789'])
      end
    end

    context 'with ocr_account_numbers.txt' do
      let(:path) { './spec/fixtures/ocr_account_numbers.txt' }
      it 'returns an array with one account number string' do
        expect(subject.count).to eq(11)
      end
    end
  end
end
