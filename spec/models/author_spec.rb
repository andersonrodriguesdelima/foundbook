require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'new_record' do
    context 'without duplicated name' do
      it { expect{ described_class.create!(name: 'Martin') }.to_not raise_error }
    end

    context 'with duplicated name' do
      before do
        described_class.create!(name: 'Martin')
      end

      it { expect{ described_class.create!(name: 'Martin') }.to raise_error }
    end

    context 'with name blank' do
      it { expect{ described_class.create!(name: nil) }.to raise_error }
    end
  end
end
