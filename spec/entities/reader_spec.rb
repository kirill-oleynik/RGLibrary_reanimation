# frozen_string_literal: true

RSpec.describe Reader do
  describe 'initialization' do
    context 'without arguments' do
      let(:reader) { build(:reader) }
      it 'leads to nullifying all attributes' do
        expect(reader.name).to eq(nil)
        expect(reader.email).to eq(nil)
        expect(reader.city).to eq(nil)
        expect(reader.street).to eq(nil)
        expect(reader.house).to eq(nil)
      end
    end
    context 'with all argumetns' do
      let(:reader) { build(:kirilloleynik) }
      it 'leades to persisting all the attributes' do
        expect(reader.instance_variable_get(:@name)).to eq('Kirill')
        expect(reader.instance_variable_get(:@email)).to eq('kirill.oleynik@rubygarage.org')
        expect(reader.instance_variable_get(:@city)).to eq('Dnipro')
        expect(reader.instance_variable_get(:@street)).to eq('Shalom-Aleihema')
        expect(reader.instance_variable_get(:@house)).to eq(426)
      end
    end
  end
  describe 'instance methods' do
    describe '#valid?' do
      context 'if all attributs presents,house is positive intgr,name,mail,city,stret are not empty strs' do
        let(:reader) { build(:random_reader) }
        it 'returns true' do
          expect(reader.valid?).to eq(true)
        end
        context 'when attributes are missing' do
          let(:reader) { build(:reader) }
          it 'returns false' do
            expect(reader.valid?).to eq(false)
          end
        end
      end
    end
    describe '#to_s' do
      context 'when name exists' do
        let(:reader) { build(:kirilloleynik) }
        it 'returns reader name' do
          expect(reader.to_s).to eq('Kirill')
        end
      end
      context 'when name is missing' do
        let(:reader) { build(:reader) }
        it 'returns nil' do
          expect(reader.to_s).to eq(nil)
        end
      end
    end
    describe '#address' do
      context 'when all address data exists and is valid' do
        let(:reader) { build(:kirilloleynik) }
        it 'returns stringified address in international format' do
          expect(reader.address).to eq('426, Shalom-Aleihema str., Dnipro')
        end
      end
      context 'when address data is missing' do
        let(:reader) { build(:reader) }
        it 'returns nil' do
        end
      end
      context 'when some address data is invalid' do
        let(:reader) { build(:kirilloleynik, city: 0) }
        it 'returns nil' do
        end
      end
    end
    describe '#name' do
      context 'when valid name exists' do
        let(:reader) { build(:kirilloleynik) }
        it 'returns reader name' do
          expect(reader.name).to eq('Kirill')
        end
      end
      context 'when name is missing' do
        let(:reader) { build(:reader) }
        it 'returns nil' do
          expect(reader.name).to eq(nil)
        end
      end
      context 'when name is invalid' do
        let(:reader) { build(:reader, name: 46) }
        it 'returns nil' do
          expect(reader.name).to eq(nil)
        end
      end
    end
    describe '#email' do
      context 'when vlid email exists' do
        let(:reader) { build(:kirilloleynik) }
        it "returns reader's email" do
          expect(reader.email).to eq('kirill.oleynik@rubygarage.org')
        end
      end
      context 'when email is missing' do
        let(:reader) { build(:reader) }
        it 'returns nil' do
          expect(reader.email).to eq(nil)
        end
      end
      context 'when email is invalid' do
        let(:reader) { build(:reader, email: 'foobar') }
        it 'returns nil' do
          expect(reader.email).to eq(nil)
        end
      end
    end
    describe '#city' do
      context 'when valid city exists' do
        let(:reader) { build(:kirilloleynik) }
        it "returns reader's city" do
          expect(reader.city).to eq('Dnipro')
        end
      end
      context 'wehn city is missing' do
        let(:reader) { build(:reader) }
        it 'returns nil' do
          expect(reader.city).to eq(nil)
        end
      end
      context 'when city is invalid' do
        let(:reader) { build(:reader, city: 46) }
        it 'returns nil' do
        end
      end
    end
    describe '#street' do
      context 'when valid street exists' do
        let(:reader) { build(:kirilloleynik) }
        it "returns reader's street" do
          expect(reader.street).to eq('Shalom-Aleihema')
        end
      end
      context 'when street is missing' do
        let(:reader) { build(:reader) }
        it 'returns nil' do
          expect(reader.street).to eq(nil)
        end
      end
      context 'when street is invalid' do
        let(:reader) { build(:reader, street: 46) }
        it 'returns nil' do
          expect(reader.street).to eq(nil)
        end
      end
    end
    describe '#house' do
      context 'when valid house exists' do
        let(:reader) { build(:kirilloleynik) }
        it "returns reader's house" do
          expect(reader.house).to eq(426)
        end
      end
      context 'when house is missing' do
        let(:reader) { build(:reader) }
        it 'returns nil' do
          expect(reader.house).to eq(nil)
        end
      end
      context 'when house is invalid' do
        let(:reader) { build(:reader, house: '46') }
        it 'returns nil' do
          expect(reader.house).to eq(nil)
        end
      end
    end
  end
end
