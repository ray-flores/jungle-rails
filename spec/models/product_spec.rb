require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    context 'given all valid fields' do
      it 'saves successfully' do
        @category = Category.new(name: 'Vehicles')
        @product = Product.new(name: 'Toyota Camry', price: 50000, quantity: 1, category: @category)
        @product.save

        expect(@product).to be_valid
      end
    end

    context 'given no name' do
      it 'shows an error for a blank name field' do
        @category = Category.new(name: 'Vehicles')
        @product = Product.new(price: 50000, quantity: 1, category: @category)
        @product.save

        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'given no price' do
      it 'shows an error for a blank price field' do
        @category = Category.new(name: 'Vehicles')
        @product = Product.new(name: 'Toyota Camry', quantity: 1, category: @category)
        @product.save

        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end

    context 'given no quantity' do
      it 'shows an error for a blank quantity field' do
        @category = Category.new(name: 'Vehicles')
        @product = Product.new(name: 'Toyota Camry', price: 50000, category: @category)
        @product.save

        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

  end
end
