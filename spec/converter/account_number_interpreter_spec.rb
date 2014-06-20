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
end
