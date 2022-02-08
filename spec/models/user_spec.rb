require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    context 'given non-matching password fields' do
      it 'will not save successfully' do
        @user = User.new(firstname: 'Ray', lastname: 'Flores', email: 'hello@gmail.com', password: 'Jungle', password_confirmation: 'book')

        expect(@user).not_to be_valid
      end
    end

    context 'given matching password fields' do
      it 'will save successfully' do
        @user = User.new(firstname: 'Ray', lastname: 'Flores', email: 'hello@gmail.com', password: 'Jungle', password_confirmation: 'Jungle')

        expect(@user).to be_valid
      end
    end

    context 'given an email that already exists in the database in a different case' do
      it 'will not save successfully' do
        @user1 = User.new(firstname: 'Ray', lastname: 'Flores', email: 'hello@gmail.com', password: 'Jungle', password_confirmation: 'Jungle')
        @user1.save

        @user2 = User.new(firstname: 'Ray', lastname: 'Flores', email: 'HELLO@gmail.com', password: 'Jungle', password_confirmation: 'Jungle')
        @user2.save

        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
    end

    

  end
end
