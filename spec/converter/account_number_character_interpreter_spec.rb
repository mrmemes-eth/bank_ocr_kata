require_relative '../../lib/converter/account_number_character_interpreter'

describe AccountNumberCharacterIntepreter do
  let(:char_intepreter) { described_class.new(char_matrix) }

  describe '#digit' do
    subject { char_intepreter.digit }
    context 'char matrix for 0' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|',' ','|'],
         ['|','_','|']]
      end
      it 'identifies 0' do
        expect(subject).to eq(0)
      end
    end
    context 'char matrix for 1' do
      let(:char_matrix) do
        [[' ',' ',' '],
         [' ',' ','|'],
         [' ',' ','|']]
      end
      it 'identifies 1' do
        expect(subject).to eq(1)
      end
    end
    context 'char matrix for 2' do
      let(:char_matrix) do
        [[' ','_',' '],
         [' ','_','|'],
         ['|','_',' ']]
      end
      it 'identifies 2' do
        expect(subject).to eq(2)
      end
    end
    context 'char matrix for 3' do
      let(:char_matrix) do
        [[' ','_',' '],
         [' ','_','|'],
         [' ','_','|']]
      end
      it 'identifies 3' do
        expect(subject).to eq(3)
      end
    end
    context 'char matrix for 4' do
      let(:char_matrix) do
        [[' ',' ',' '],
         ['|','_','|'],
         [' ',' ','|']]
      end
      it 'identifies 4' do
        expect(subject).to eq(4)
      end
    end
    context 'char matrix for 5' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|','_',' '],
         [' ','_','|']]
      end
      it 'identifies 5' do
        expect(subject).to eq(5)
      end
    end
    context 'char matrix for 6' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|','_',' '],
         ['|','_','|']]
      end
      it 'identifies 6' do
        expect(subject).to eq(6)
      end
    end
    context 'char matrix for 7' do
      let(:char_matrix) do
        [[' ','_',' '],
         [' ',' ','|'],
         [' ',' ','|']]
      end
      it 'identifies 7' do
        expect(subject).to eq(7)
      end
    end
    context 'char matrix for 8' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|','_','|'],
         ['|','_','|']]
      end
      it 'identifies 8' do
        expect(subject).to eq(8)
      end
    end
    context 'char matrix for 9' do
      let(:char_matrix) do
        [[' ','_',' '],
         ['|','_','|'],
         [' ','_','|']]
      end
      it 'identifies 9' do
        expect(subject).to eq(9)
      end
    end
  end

  describe '#permutations' do
    subject { char_intepreter.permutations }
    context 'given a matrix similar to a 9' do
      let(:char_matrix) do
        [[' ',' ',' '],
         ['|','_','|'],
         [' ','_','|']]
      end

      it 'includes 9 in its permutations' do
        expect(subject).to include(9)
      end
    end
    context 'given 9 as its matrix' do
      let(:char_matrix) do
        [[' ','_',' '],
        ['|','_','|'],
        [' ','_','|']]
      end
      it 'contains all permutations the matrix could match to real numbers' do
        expect(subject).to match_array([8,5,3])
      end
    end
  end

  describe '#pipe_permutations' do
    subject { char_intepreter.character_permutations('|') }
    let(:char_matrix) do
      [[' ','_',' '],
       ['|','_','|'],
       [' ','_','|']]
    end
    let(:possible_permutations) do
      [[['|','_',' '],
        ['|','_','|'],
        [' ','_','|']],

       [[' ','_','|'],
        ['|','_','|'],
        [' ','_','|']],

       [[' ','_',' '],
        [' ','_','|'],
        [' ','_','|']],

       [[' ','_',' '],
        ['|','_',' '],
        [' ','_','|']],

       [[' ','_',' '],
        ['|','_','|'],
        ['|','_','|']],

       [[' ','_',' '],
        ['|','_','|'],
        [' ','_',' ']]]
    end
    it 'includes every permutation of addition/removal of a pipe' do
      expect(subject).to match_array(possible_permutations)
    end
  end
  describe '#underscore_permutations' do
    subject { char_intepreter.character_permutations('_') }
    let(:char_matrix) do
      [[' ','_',' '],
       ['|','_','|'],
       [' ','_','|']]
    end
    let(:possible_permutations) do
      [[['_','_',' '],
        ['|','_','|'],
        [' ','_','|']],

       [[' ',' ',' '],
        ['|','_','|'],
        [' ','_','|']],

       [[' ','_','_'],
        ['|','_','|'],
        [' ','_','|']],

       [[' ','_',' '],
        ['|',' ','|'],
        [' ','_','|']],

       [[' ','_',' '],
        ['|','_','|'],
        ['_','_','|']],

       [[' ','_',' '],
        ['|','_','|'],
        [' ',' ','|']]]
    end
    it 'includes every permutation of addition/removal of an underscore' do
      expect(subject).to match_array(possible_permutations)
    end
  end

end
