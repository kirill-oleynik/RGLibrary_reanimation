RSpec.describe Author do
  let(:valid_args){{name: 'name', bio:' bio'}}
    let(:args_without_name){{bio: 'bio'}}
    let(:args_without_bio){{name: 'name'}}
    let(:invalid_args){{}}
    let(:invalid_type_args){'invalid type'}
  describe ')initial args' do
    it 'can be initialized with any combination of arguments' do
      expect {Author.new(valid_args)}.not_to raise_error
      expect {Author.new(args_without_name)}.not_to raise_error
      expect {Author.new(args_without_bio)}.not_to raise_error
      expect {Author.new(invalid_args)}.not_to raise_error
      expect {Author.new(invalid_type_args)}.not_to raise_error
    end
    it 'sets all arguments to nil if initialiezed with invalid arguments'do
      invalid_author_1 = Author.new(args_without_name)
      invalid_author_2 = Author.new(args_without_bio)
      invalid_author_3 = Author.new(invalid_args)
      invalid_author_4 = Author.new(invalid_type_args)
      expect(invalid_author_1.instance_variable_get(:@name)).to eq(nil)
      expect(invalid_author_2.instance_variable_get(:@bio)).to eq(nil)
      expect(invalid_author_3.instance_variable_get(:@bio)).to eq(nil)
      expect(invalid_author_3.instance_variable_get(:@name)).to eq(nil)
      expect(invalid_author_4.instance_variable_get(:@bio)).to eq(nil)
    end
  end
  describe 'instance methods'do
    describe '#valid?'do
      it 'has such method'do
        expect(Author.new(valid_args)).to respond_to(:valid?)
      end
      it 'returns true when name is a not empty string'do
        author = Author.new(valid_args)
        expect(author.valid?).to eq(true)
      end
      it 'returns false when name is not a string or empty string'do
        author_with_invalid_name_type = Author.new(name: 0)
        expect(author_with_invalid_name_type.valid?).to eq(false)
        author_with_empty_name = Author.new(name: '')
        expect(author_with_invalid_name_type.valid?).to eq(false)
      end
      it 'returns true when there is no bio'do
        author_without_bio = Author.new(args_without_bio)
        expect(author_without_bio.valid?).to eq(true)
      end
    end
  end
end
