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

  describe '#search' do
    let(:subject) { described_class.search(filter_params, order) }
    let(:order) { }
    let!(:author1) { create(:author, name: 'Anderson') }
    let!(:author2) { create(:author, name: 'Jackson') }
    let!(:author3) { create(:author, name: 'Zack') }

    context 'with same names end' do
      let(:filter_params) { { 'name' => 'son' } }
      it do
        result = subject
        expect(result.size).to eq(2)
        expect(result.first.name).to eq(author1.name)
        expect(result.second.name).to eq(author2.name)
      end
    end

    context 'with only name' do
      let(:filter_params) { { 'name' => 'za' } }
      it do
        result = subject
        expect(result.size).to eq(1)
        expect(result.first.name).to eq(author3.name)
      end
    end
  end
end
