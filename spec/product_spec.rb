require 'spec_helper'
require_relative '../product'

RSpec.describe Product do
  describe '#initialize' do
    it 'Check name' do
      object =  Product.new(1, 'Pepsi', 1, 20)
      expect(object.name).to eq 'Pepsi'
    end
  end

  describe '#all' do
    it 'return all products' do
      Product.new(2, 'Burger', 1, 20)
      expect(Product.all.size).to eq 2
    end
  end
  describe '.find' do
    it 'return product' do
      expect(Product.find(1).name).to eq 'Pepsi'
    end
  end
end