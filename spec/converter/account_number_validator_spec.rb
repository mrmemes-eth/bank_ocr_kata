require_relative '../../lib/converter/account_number_validator'

describe AccountNumberValdiator do
  let(:validator) { described_class.new(integers) }

  describe "#checksum" do
    subject { validator.checksum }

    context 'with an account number of 345882865' do
      let(:integers) { [3, 4, 5, 8, 8, 2, 8, 6, 5] }
      it 'has a mod 11 of zero' do
        expect(subject % 11).to eq(0)
      end
    end

    context 'with an account number of 000000051' do
      let(:integers) { [0, 0, 0, 0, 0, 0, 0, 5, 1] }
      it 'has a mod 11 of zero' do
        expect(subject % 11).to eq(0)
      end
    end

    context 'with an account number of 457508000' do
      let(:integers) { [4, 5, 7, 5, 0, 8, 0, 0, 0] }
      it 'has a mod 11 of zero' do
        expect(subject % 11).to eq(0)
      end
    end

    context 'with an account number of 664371495' do
      let(:integers) { [6, 6, 4, 3, 7, 1, 4, 9, 5] }
      it 'does not have a mod 11 of zero' do
        expect(subject % 11).to_not eq(0)
      end
    end
  end

  describe '#valid?' do
    subject { validator.valid? }

    context 'with an account number whose checksum mod 11 is 0' do
      let(:integers) { [3, 4, 5, 8, 8, 2, 8, 6, 5] }
      it 'is valid' do
        expect(subject).to be(true)
      end
    end

    context 'with an account number whose checksum mod 11 is not 0' do
      let(:integers) { [6, 6, 4, 3, 7, 1, 4, 9, 5] }
      it 'is not valid' do
        expect(subject).to be(false)
      end
    end

  end

end
