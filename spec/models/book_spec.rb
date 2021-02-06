require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:author) { create(:author) }

  describe 'new_record' do
    let(:params) do
      {
        name: Faker::Book.title,
        description: 'foobar',
        image_url: 'www.google.com.br/image.jpg',
        author_id: author.id
      }
    end
    let(:subject) { described_class.create!(params) }

    context 'with all params' do
      it { expect{ subject }.to_not raise_error }
    end

    context 'without author' do
      before { params.delete(:author_id) }
      it { expect{ subject }.to raise_error }
    end

    context 'without name' do
      before { params.delete(:name) }

      it { expect{ subject }.to raise_error }
    end

    context 'without description' do
      before { params.delete(:description) }

      it { expect{ subject }.to raise_error }
    end
  end

  describe '#search' do
    let(:subject) { described_class.search(filter_params, order) }
    let(:author1) { create(:author) }
    let!(:book1) { create(:book, name: 'aviao', description: 'Foo', author: author1) }

    let(:author2) { create(:author) }
    let!(:book2) { create(:book, name: 'Foo', description: 'carro', author: author2) }

    let(:author3) { create(:author) }
    let!(:book3) { create(:book, name: 'moto', description: 'moto', author: author2) }

    context 'with name_or_desc filter' do
      let(:order) { 'name-asc' }

      context 'with name or desc same text' do
        let(:filter_params) { { "name_or_desc" => 'foo' } }
        it do
          result = subject
          expect(result.size).to eq(2)
          expect(result.first.name).to eq(book1.name)
          expect(result.second.name).to eq(book2.name)
        end
      end

      context 'with name text' do
        let(:filter_params) { { "name_or_desc" => 'aviao' } }
        it do
          result = subject
          expect(result.size).to eq(1)
          expect(result.first.name).to eq(book1.name)
        end
      end

      context 'with name or desc in one text' do
        let(:filter_params) { { "name_or_desc" => 'carro' } }
        it do
          result = subject
          expect(result.size).to eq(1)
          expect(result.first.name).to eq(book2.name)
        end
      end
    end

    context 'with order filter' do
      let(:filter_params) { }
      context 'with asc' do
        let(:order) { 'name-asc' }
        it do
          result = subject
          expect(result.size).to eq(3)
          expect(result.first.name).to eq(book1.name)
          expect(result.second.name).to eq(book2.name)
          expect(result.third.name).to eq(book3.name)
        end
      end

      context 'with desc' do
        let(:order) { 'name-desc' }
        it do
          result = subject
          expect(result.size).to eq(3)
          expect(result.first.name).to eq(book3.name)
          expect(result.second.name).to eq(book2.name)
          expect(result.third.name).to eq(book1.name)
        end
      end
    end
  end
end
