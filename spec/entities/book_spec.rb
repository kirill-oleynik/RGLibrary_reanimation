# frozen_string_literal: true

RSpec.describe Book do
  describe 'initialization' do
    context 'without arguments' do
      let(:book) { build(:book) }
      it 'nullifies book ttitle' do
        expect(book.instance_variable_get(:@title)).to eq(nil)
      end
      it 'nullifies book author' do
        expect(book.instance_variable_get(:@author)).to eq(nil)
      end
    end
    context 'with all arguments' do
      let(:book) { build(:clean_architecture) }
      it 'stores title' do
        expect(book.instance_variable_get(:@title)).to eq('Clean Architecture')
      end
      it 'stores author' do
        expect(book.instance_variable_get(:@author).name).to eq('Robert C. Martin')
      end
    end
  end
  describe 'instance methods' do
    describe '#title' do
      context 'when title presents' do
        let(:book) { build(:clean_architecture) }
        it 'returns title' do
          expect(book.title).to eq('Clean Architecture')
        end
      end
      context 'when title is missing' do
        let(:book) { build(:book) }
        it 'returns nil' do
          expect(book.title).to eq(nil)
        end
      end
    end
    describe '#author' do
      context 'when author presents' do
        let(:book) { build(:clean_architecture) }
        it 'returns author anme' do
          expect(book.author).to eq('Robert C. Martin')
        end
      end
      context 'when author is missing' do
        let(:book) { build(:book) }
        it 'returns nil' do
          expect(book.author).to eq(nil)
        end
      end
    end
    describe '#valid?' do
      context 'when valid title exists but author is missing' do
        let(:book) { build(:book, title: 'Title') }
        it 'returns false' do
          expect(book.valid?).to eq(false)
        end
      end
      context 'when valid author exists but title is missing' do
        let(:book) { build(:clean_architecture, title: nil) }
        it 'returns false' do
          expect(book.valid?).to eq(false)
        end
      end
      context 'when both valid title & author present' do
        let(:book) { build(:clean_architecture) }
        it 'returns true' do
          expect(book.valid?).to eq(true)
        end
      end
    end
    describe '#to_s' do
      context 'when title is valid but valid author is missing' do
        let(:book) { build(:clean_architecture, author: 'valid author') }
        it 'returns nil' do
          expect(book.to_s).to eq(nil)
        end
      end
      context 'when valid title missing but author is present' do
        let(:book) { build(:clean_architecture, title: 0) }
        it 'returns nil' do
          expect(book.to_s).to eq(nil)
        end
      end
      context 'when both valid author & title are missing' do
        let(:book) { build(:clean_architecture, title: 0, author: 'invalid author') }
        it 'returns nil' do
          expect(book.to_s).to eq(nil)
        end
      end
      context 'when valid title & author both present' do
        let(:book) { build(:clean_architecture) }
        it "returns book's title and author's name" do
          expect(book.to_s).to eq("'Clean Architecture' by Robert C. Martin")
        end
      end
    end
  end
end
