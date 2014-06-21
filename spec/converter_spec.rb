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
      it 'returns an array with one account number matrix' do
        expect(subject.count).to eq(1)
      end

      specify 'there are nine submatrices' do
        expect(subject.first.count).to eq(9)
      end
    end

    context 'with ocr_account_numbers.txt' do
      let(:path) { './spec/fixtures/ocr_account_numbers.txt' }
      it 'returns an array with eleven account number matrices' do
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
      it 'returns an array with eleven account number strings' do
        expect(subject.count).to eq(11)
      end
    end
  end

  describe '#verified_account_numbers' do
    subject { converter.verified_account_numbers }
    let(:path) { './spec/fixtures/user_story_3.txt' }
    let(:result) do
      { '000000051' => nil,
        '49006771?' => ' ILL',
        '1234?678?' => ' ILL',
        '664371495' => ' ERR' }
    end
    it 'returns a hash of results with their validation results' do
      expect(subject).to eq(result)
    end
  end

  describe '#print_validation_results_to' do
    let(:handle) { StringIO.new }
    let(:path)   { './spec/fixtures/user_story_3.txt' }
    let(:result) do
      %q{
      000000051
      49006771? ILL
      1234?678? ILL
      664371495 ERR
      }.gsub(/^\s+/,'')
    end
    before do
      converter.print_validation_results_to(handle)
    end
    it 'prints the desired output' do
      expect(handle.string).to eq(result)
    end
  end

end
