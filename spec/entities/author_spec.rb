# frozen_string_literal: true

RSpec.describe Author do
  describe 'initialization' do
    context 'when no arguments given' do
      let(:author) { build(:author) }
      it 'nullifies name' do
        expect(author.instance_variable_get(:@name)).to eq(nil)
      end
      it 'nullifies bio' do
        expect(author.instance_variable_get(:@bio)).to eq(nil)
      end
    end
  end
  describe 'instance methods' do
    describe '#name' do
      context 'when author has name' do
        let(:author) { build(:uncle_bob) }
        it "returns author's name" do
          expect(author.name).to eq('Robert C. Martin')
        end
      end
      context 'when author has no name' do
        let(:author) { build(:author) }
        it 'returns nil' do
          expect(author.name).to eq(nil)
        end
      end
    end
    describe '#bio' do
      context 'when author has bio' do
        let(:author) { build(:author, { bio: 'Bio' }) }
        it "returns author's bio" do
          expect(author.bio).to eq('Bio')
        end
      end
      context 'when author has no bio' do
        let(:author) { build(:author) }
        it 'returns nil' do
          expect(author.bio).to eq(nil)
        end
      end
    end
    describe '#to_s' do
      context 'when author has name' do
        let(:author) { build(:uncle_bob) }
        it "returns author's name" do
          expect(author.to_s).to eq('Robert C. Martin')
        end
      end
      context 'when author has no name' do
        let(:author) { build(:author) }
        it 'returns empty string' do
          expect(author.to_s).to eq('')
        end
      end
    end
    describe '#valid?' do
      context 'when author has name' do
        let(:author) { build(:uncle_bob) }
        it 'returns true' do
          expect(author.valid?).to eq(true)
        end
      end
      context 'when suthor has no name' do
        let(:author) { build(:author) }
        it 'returns false' do
          expect(author.valid?).to eq(false)
        end
      end
    end
    describe '#==' do
      context 'when authors names and bios are the same' do
        let(:author_1) { build(:uncle_bob) }
        let(:author_2) { build(:uncle_bob) }
        it 'returns true' do
          expect(author_1 == author_2).to eq(true)
        end
      end
      context 'when authors names are different' do
        let(:author_1) { build(:author, name: 'name_1') }
        let(:author_2) { build(:author, name: 'name_2') }
        it 'returns false' do
          expect(author_1 == author_2).to eq(false)
        end
      end
      context 'when authors bios are different' do
        let(:author_1) { build(:author, bio: 'bio_1') }
        let(:author_2) { build(:author, bio: 'bio_1') }
        it 'returns false' do
          expect(author_1 == author_2).to eq(false)
        end
      end
      context 'when authors both name and bio are different' do
        let(:author_1) { build(:author, name: 'name_1', bio: 'bio_1') }
        let(:author_2) { build(:author, name: 'name_2', bio: 'bio_2') }
        it 'returns false' do
          expect(author_1 == author_2).to eq(false)
        end
      end
    end
  end
end
