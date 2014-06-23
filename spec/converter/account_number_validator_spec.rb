require_relative '../../lib/converter/account_number_validator'

describe AccountNumberValidator do
  let(:validator) { described_class.new(number) }

  describe "#checksum" do
    subject { validator.checksum }

    context 'with an account number of 345882865' do
      let(:number) { '345882865' }
      it 'has a mod 11 of zero' do
        expect(subject % 11).to eq(0)
      end
    end

    context 'with an account number of 000000051' do
      let(:number) { '000000051' }
      it 'has a mod 11 of zero' do
        expect(subject % 11).to eq(0)
      end
    end

    context 'with an account number of 457508000' do
      let(:number) { '457508000' }
      it 'has a mod 11 of zero' do
        expect(subject % 11).to eq(0)
      end
    end

    context 'with an account number of 664371495' do
      let(:number) { '664371495' }
      it 'does not have a mod 11 of zero' do
        expect(subject % 11).to_not eq(0)
      end
    end
  end

  describe '#valid?' do
    subject { validator.valid? }

    context 'with an account number whose checksum mod 11 is 0' do
      let(:number) { '345882865' }
      it 'is valid' do
        expect(subject).to be(true)
      end
    end

    context 'with an account number whose checksum mod 11 is not 0' do
      let(:number) { '664371495' }
      it 'is not valid' do
        expect(subject).to be(false)
      end
    end

    context 'with an illegible account number' do
      let(:number) { '?45882865' }
      it 'is not valid' do
        expect(subject).to be(false)
      end
    end

  end

  describe '#illegible?' do
    subject { validator.illegible? }
    context 'when the account number has a ? in it' do
      let(:number) { '66437149?' }
      it 'is true' do
        expect(subject).to be(true)
      end
    end

    context 'when the account number does not have a ? in it' do
      let(:number) { '664371495' }
      it 'is false' do
        expect(subject).to be(false)
      end
    end
  end

end
