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
end
