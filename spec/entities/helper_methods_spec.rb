# frozen_string_literal: true

RSpec.describe HelperMethods do
  let!(:dummy_class) { Class.new { include HelperMethods } }
  let!(:dummy_instance) { dummy_class.new }
  it 'includes all expected methods' do
    expect(subject.public_instance_methods.include?(:not_empty_string?)).to eq(true)
    expect(subject.public_instance_methods.include?(:positive_integer?)).to eq(true)
  end
  describe 'class instance methods' do
    describe '#:not_empty_string?' do
      it 'returns false if empty string passed' do
        expect(dummy_instance.not_empty_string?('')).to eq(false)
      end
      it 'returns false if not a string passed' do
        expect(dummy_instance.not_empty_string?(0)).to eq(false)
      end
      it 'returns true if not empry string passed' do
        expect(dummy_instance.not_empty_string?('string')).to eq(true)
      end
    end
    describe '#positive_integer?' do
      it ' returns false if not an integer passed' do
        expect(dummy_instance.positive_integer?('string')).to eq(false)
        expect(dummy_instance.positive_integer?(4.4)).to eq(false)
      end
      it 'returns false if negative integer or zero passed' do
        expect(dummy_instance.positive_integer?(-5)).to eq(false)
        expect(dummy_instance.positive_integer?(0)).to eq(false)
      end
      it 'returns true if positive integer passed' do
        expect(dummy_instance.positive_integer?(5)).to eq(true)
      end
    end
  end
end
