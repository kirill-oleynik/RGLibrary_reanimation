# frozen_string_literal: true

RSpec.describe Order do
  describe 'initialization' do
    context 'when initialized without arguments' do
      let(:order) { build(:order) }
      it 'nullifies all attributes but the date' do
        expect(order.reader).to eq(nil)
        expect(order.book).to eq(nil)
      end
    end
    context 'when initialied with arguments' do
      let(:order) { build(:developer_order) }
      it 'persists all attributes' do
        expect(order.reader).to eq('Kirill')
        expect(order.book).to eq("'Clean Architecture' by Robert C. Martin")
      end
    end
  end
  describe 'instance methods' do
    describe '#reader' do
      context 'when has reader' do
        let(:order) { build(:developer_order) }
        it 'returns reader name' do
          expect(order.reader).to eq('Kirill')
        end
      end
      context 'when has no reader' do
        let(:order) { build(:order) }
        it 'returns nil' do
          expect(order.reader).to eq(nil)
        end
        context 'when reader is invalid' do
        end
        let(:order) { build(:order, reader: build(:reader)) }
        it 'returns nil' do
          expect(order.reader).to eq(nil)
        end
      end
    end
    describe '#date' do
      context 'when has date' do
        let(:order) { build(:developer_order) }
        it 'returns formated date' do
          expect(order.date).to eq('10-10-2020')
        end
      end
      context 'when has no date' do
        let!(:order) { build(:order) }
        let!(:today) { Date.today.strftime('%d-%m-%Y') }
        it 'uses current date' do
          expect(order.date).to eq(today)
        end
      end
      context 'when date is ivalid' do
        let(:order) { build(:order, date: 'invlalid') }
        it 'returns nil' do
          expect(order.date).to eq(nil)
        end
      end
    end
    describe '#book' do
      context 'when has book' do
        let(:order) { build(:developer_order) }
        it 'returns book title' do
        end
      end
      context 'when has no book' do
        let(:order) { build(:order) }
        it 'returns nil' do
        end
        context 'when book is invalid' do
          let(:order) { build(:order) }
        end
      end
    end
    describe '#valid?' do
      context 'when all attribtes presents & valid' do
        let(:order) { build(:developer_order) }
        it 'returns true' do
          expect(order.valid?).to eq(true)
        end
      end
      context 'when some attribute missing' do
        let(:order) { build(:order) }
        it 'returns false' do
          expect(order.valid?).to eq(false)
        end
      end
      context 'when some attributes are invalid' do
        let(:order) { build(:developer_order, date: 'invalid') }
        it 'returns false' do
          expect(order.valid?).to eq(false)
        end
      end
    end
    describe '#book' do
      context 'when valid book presents' do
        let(:order) { build(:developer_order) }
        it 'returns book title' do
          expect(order.book). to eq("'Clean Architecture' by Robert C. Martin")
        end
      end
      context 'when  book is missing' do
        let(:order) { build(:order) }
        it 'returns nil' do
          expect(order.book).to eq(nil)
        end
      end
    end
    describe '#date' do
      context 'when valid date presents' do
        let(:order) { build(:developer_order) }
        it 'returns formated date' do
          expect(order.date).to eq('10-10-2020')
        end
        context 'when date is missing' do
          let!(:today) { Date.today.strftime('%d-%m-%Y') }
          let(:order) { build(:order) }
          it 'returns current date' do
            expect(order.date).to eq(today)
          end
        end
        context 'when date is invalid' do
          let(:order) { build(:order, date: 10) }
          it 'returns nil' do
            expect(order.date).to eq(nil)
          end
        end
      end
    end
  end
end
