require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    context 'given all valid fields' do
      it 'saves successfully' do
        @category = Category.new(name: 'Vehicles')
        @product = Product.new(name: 'Toyota Camry', price: 50000, quantity: 1, category: @category)
      end
    end

    

  end
end
