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

    context 'given a password length less than 4' do
      it 'will not save successfully' do
        @user = User.new(firstname: 'Ray', lastname: 'Flores', email: 'hello@gmail.com', password: 'Tru', password_confirmation: 'Tru')

        expect(@user).not_to be_valid
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

    context 'given no email' do
      it 'will not save successfully' do
        @user = User.new(firstname: 'Ray', lastname: 'Flores', password: 'Jungle', password_confirmation: 'Jungle')
        @user.save

        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end

    context 'given no firstname' do
      it 'will not save successfully' do
        @user = User.new(lastname: 'Flores', email: 'rflores@gmail.com', password: 'Jungle', password_confirmation: 'Jungle')
        @user.save

        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
    end

    context 'given no lastname' do
      it 'will not save successfully' do
        @user = User.new(firstname: 'Ray', email: 'rflores@gmail.com', password: 'Jungle', password_confirmation: 'Jungle')
        @user.save

        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
    end
  end

  describe '.authenticate_with_credentials' do

    context 'given a valid email and password' do
      it 'will return the user' do
        @user = User.new(firstname: 'Ray', lastname: 'Flores', email: 'rflores@gmail.com', password: 'Jungle', password_confirmation: 'Jungle')
        @user.save

        expect(User.authenticate_with_credentials('rflores@gmail.com', 'Jungle')).to eq(User.find_by(email: 'rflores@gmail.com'))
      end
    end

    context 'given a valid email with whitespace' do
      it 'will return the user' do
        @user = User.new(firstname: 'Ray', lastname: 'Flores', email: 'rflores@gmail.com', password: 'Jungle', password_confirmation: 'Jungle')
        @user.save

        expect(User.authenticate_with_credentials(' rflores@gmail.com  ', 'Jungle')).to eq(User.find_by(email: 'rflores@gmail.com'))
      end
    end

    context 'given a valid email with different cased letters' do
      it 'will return the user' do
        @user = User.new(firstname: 'Ray', lastname: 'Flores', email: 'rflores@gmail.com', password: 'Jungle', password_confirmation: 'Jungle')
        @user.save

        expect(User.authenticate_with_credentials('rFLoREs@gmail.com', 'Jungle')).to eq(User.find_by(email: 'rflores@gmail.com'))
      end
    end
  end
  
end
