# frozen_string_literal: true

RSpec.describe Library do
  describe 'initializarion' do
    it 'can be created with repository as an argument' do
      repository = double('library repository')
      expect { described_class.new(repository) }.not_to raise_error
    end

    it 'ca not be create without repository as an argument' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end
  end
  describe 'instance methods' do
    let(:data) do
      [
        build_list(:developer_order, 5),
        build_list(:developer_order_2, 5),
        build_list(:random_order, 2)
      ].flatten
    end
    describe '#top_reader' do
      it 'returns 1 top reader if no amount requesed' do
        repository = double('library repository')
        allow(repository).to receive(:data) { data }
        result = described_class.new(repository).top_reader
        expect(result.length).to eq(1)
        expect(result).to include('George')
      end
      it 'returns requested amount of top readers' do
        repository = double('library repository')
        allow(repository).to receive(:data) { data }
        result = described_class.new(repository).top_reader(2)
        expect(result.length).to eq(2)
        expect(result).to include('Kirill', 'George')
      end
    end
    describe '#popular_books' do
      it 'returns 1 popular book by default if no amount requested' do
        repository = double('library repository')
        allow(repository).to receive(:data) { data }
        result = described_class.new(repository).popular_books
        expect(result.length).to eq(1)
        expect(result).to include("'Python Zen' by Guido van Rossum")
      end
      it 'returns requested amount of popular books' do
        repository = double('library repository')
        allow(repository).to receive(:data) { data }
        result = described_class.new(repository).popular_books(2)
        expect(result).to include(
          "'Python Zen' by Guido van Rossum",
          "'Clean Architecture' by Robert C. Martin"
        )
      end
    end
    describe '#popular_books_readers' do
      context 'when no amount of books requested (provided)' do
        let(:data) do
          [
            build_list(:developer_order, 5),
            build_list(:developer_order_2, 5),
            build_list(:developer_order_3, 5),
            build_list(:developer_order_4, 5),
            build_list(:random_order, 5)
          ].flatten
        end
        it 'returns number of readers of 3 most popular books by default' do
          repository = double('library repository')
          allow(repository).to receive(:data) { data }
          described_class.new(repository).popular_books_readers
        end
      end
      context 'when exact amount of books requested' do
        let(:data) do
          [
            build_list(:developer_order, 5),
            build_list(:developer_order_2, 15),
            build_list(:developer_order_3, 5),
            build_list(:developer_order_4, 5),
            build_list(:random_order, 5)
          ].flatten
        end
        it 'returns number of readers of the requested amount of most popular books' do
          repository = double('library repository')
          allow(repository).to receive(:data) { data }
          result = described_class.new(repository).popular_books_readers(2)
          expect(result).to eq(2)
        end
      end
    end
  end
end
