require 'spec_helper'
require_relative '../machine_currency_stock'

RSpec.describe MachineCurrencyStock do
  describe '#initialize' do
      it 'value' do
        object = MachineCurrencyStock.new(2, 0)
        expect(object.value).to eq 2
      end
  end

  describe '#all' do
    it 'list all details' do
      objects = MachineCurrencyStock.all
      expect(objects.size).to eq 1
    end
  end

  describe '#add_quantity' do
    it 'add_quantity of coins/amt' do
      MachineCurrencyStock.add_quantity(2, 1)
      expect(MachineCurrencyStock.all.last.qty).to eq 1
    end
  end

  describe '#remove_quantity' do
    it 'remove_quantity of coins/amt' do
      MachineCurrencyStock.remove_quantity(2, 1)
      expect(MachineCurrencyStock.all.last.qty).to eq 0
    end
  end
  
  describe '#change_details' do
    it 'change_details of coins/amt' do
      object = MachineCurrencyStock.new(2, 10)
      expect(MachineCurrencyStock.change_details(2)).to eq [{:qty=>1, :value=>2}]
    end
  end
end