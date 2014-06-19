require_relative '../../lib/converter/account_number_character_interpreter'

describe AccountNumberCharacterIntepreter do
  subject{ described_class.new(char_matrix) }

  describe '#digit' do
    context 'char matrix for 0' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|',' ','|'],
         ['|','_','|']]
      end
      it 'identifies 0' do
        expect(subject.digit).to eq(0)
      end
    end
    context 'char matrix for 1' do
      let(:char_matrix) do
        [[' ',' ',' '],
         [' ',' ','|'],
         [' ',' ','|']]
      end
      it 'identifies 1' do
        expect(subject.digit).to eq(1)
      end
    end
    context 'char matrix for 2' do
      let(:char_matrix) do
        [[' ','_',' '],
         [' ','_','|'],
         ['|','_',' ']]
      end
      it 'identifies 2' do
        expect(subject.digit).to eq(2)
      end
    end
    context 'char matrix for 3' do
      let(:char_matrix) do
        [[' ','_',' '],
         [' ','_','|'],
         [' ','_','|']]
      end
      it 'identifies 3' do
        expect(subject.digit).to eq(3)
      end
    end
    context 'char matrix for 4' do
      let(:char_matrix) do
        [[' ',' ',' '],
         ['|','_','|'],
         [' ',' ','|']]
      end
      it 'identifies 4' do
        expect(subject.digit).to eq(4)
      end
    end
    context 'char matrix for 5' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|','_',' '],
         [' ','_','|']]
      end
      it 'identifies 5' do
        expect(subject.digit).to eq(5)
      end
    end
    context 'char matrix for 6' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|','_',' '],
         ['|','_','|']]
      end
      it 'identifies 6' do
        expect(subject.digit).to eq(6)
      end
    end
    context 'char matrix for 7' do
      let(:char_matrix) do
        [[' ','_',' '],
         [' ',' ','|'],
         [' ',' ','|']]
      end
      it 'identifies 7' do
        expect(subject.digit).to eq(7)
      end
    end
    context 'char matrix for 8' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|','_','|'],
         ['|','_','|']]
      end
      it 'identifies 8' do
        expect(subject.digit).to eq(8)
      end
    end
    context 'char matrix for 9' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|','_','|'],
         [' ','_','|']]
      end
      it 'identifies 9' do
        expect(subject.digit).to eq(9)
      end
    end
  end
end
