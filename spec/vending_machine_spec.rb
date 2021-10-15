require 'spec_helper'
require_relative '../vending_machine'
require_relative '../product'

RSpec.describe VendingMachine do
  describe '#list_products' do
    it 'return all products' do
      expect(subject.list_products.size).to eq Product.all.count
    end
  end
  describe '.pick' do
    it 'raise Error when less change' do
        product = Product.all.first
        begin
            subject.pick(product.id, 1, [{'value' => 1, 'quantity' => 22}])  
        rescue => exception
            expect(exception.message).to eq('Change Not Available')
        end
    end

    it 'Should allow pick' do
        product = Product.all.last
        expect(subject.pick(product.id, 1, [{'value' => 1, 'quantity' => 20}])).to eq(true)
    end
  end
end