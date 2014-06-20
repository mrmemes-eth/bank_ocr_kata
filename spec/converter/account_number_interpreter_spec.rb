require_relative '../../lib/converter/account_number_parser'
require_relative '../../lib/converter/account_number_interpreter'

describe AccountNumberInterpreter do
  let(:matrices) { AccountNumberParser.new(ocr_string).matrix }
  let(:interpreter) { described_class.new(matrices) }

  describe "#account_number" do
    subject { interpreter.account_number }
    context "with one_to_nine.txt" do
      let(:ocr_string) { File.read('spec/fixtures/one_to_nine.txt') }
      it "yields '123456789'" do
        expect(subject).to eq('123456789')
      end
    end

    context "with zero_to_nine.txt" do
      let(:ocr_string) { File.read('spec/fixtures/zero_to_nine.txt') }
      it "yields '0123456789'" do
        expect(subject).to eq('0123456789')
      end
    end

    context "with nine_to_zero.txt" do
      let(:ocr_string) { File.read('spec/fixtures/nine_to_zero.txt') }
      it "yields '9876543210'" do
        expect(subject).to eq('9876543210')
      end
    end
  end

  describe "#checksum" do
    let(:ocr_string) { '' }
    subject { interpreter.checksum }

    context 'with an account number of 345882865' do
      before  do
        allow(interpreter).to receive(:account_number).and_return('345882865')
      end
      it 'has a mod 11 of zero' do
        expect(subject % 11).to eq(0)
      end
    end

    context 'with an account number of 000000051' do
      before  do
        allow(interpreter).to receive(:account_number).and_return('000000051')
      end
      it 'has a mod 11 of zero' do
        expect(subject % 11).to eq(0)
      end
    end

    context 'with an account number of 457508000' do
      before  do
        allow(interpreter).to receive(:account_number).and_return('457508000')
      end
      it 'has a mod 11 of zero' do
        expect(subject % 11).to eq(0)
      end
    end

    context 'with an account number of 664371495' do
      before  do
        allow(interpreter).to receive(:account_number).and_return('664371495')
      end
      it 'does not have a mod 11 of zero' do
        expect(subject % 11).to_not eq(0)
      end
    end
  end

  describe '#valid?' do
    let(:ocr_string) { '' }
    subject { interpreter.valid? }

    context 'with an account number whose checksum mod 11 is 0' do
      before  do
        allow(interpreter).to receive(:account_number).and_return('345882865')
      end
      it 'is valid' do
        expect(subject).to be(true)
      end
    end

    context 'with an account number whose checksum mod 11 is not 0' do
      before  do
        allow(interpreter).to receive(:account_number).and_return('664371495')
      end
      it 'is not valid' do
        expect(subject).to be(false)
      end
    end
  end

  describe '#illegible?' do
    let(:ocr_string) { '' }
    subject { interpreter.illegible? }
    context 'when the account number has a ? in it' do
      before  do
        allow(interpreter).to receive(:account_number).and_return('66437149?')
      end
      it 'is true' do
        expect(subject).to be(true)
      end
    end

    context 'when the account number does not have a ? in it' do
      before  do
        allow(interpreter).to receive(:account_number).and_return('664371495')
      end
      it 'is false' do
        expect(subject).to be(false)
      end
    end
  end

  describe '#error_description' do
    let(:ocr_string) { '' }
    subject { interpreter.error_description }
    context 'when the account number is valid' do
      before { allow(interpreter).to receive(:valid?).and_return(true) }
      specify { expect(subject).to be(nil) }
    end

    context 'when the account number is invalid' do
      before { allow(interpreter).to receive(:valid?).and_return(false) }
      context 'and the account number is illegible' do
        before { allow(interpreter).to receive(:illegible?).and_return(true) }
        specify { expect(subject).to eq(' ILL') }
      end

      context 'and the account number is not illegible' do
        before { allow(interpreter).to receive(:illegible?).and_return(false) }
        specify { expect(subject).to eq(' ERR') }
      end
    end

  end
end
