require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'validation tests' do
    before(:each) do
      @user = User.create(id: 1, name: 'Felix', email: 'test@gmail.com', password: 'test12345')
      icon = fixture_file_upload(Rails.root.join('spec/fixtures/icons/uber.png'), 'image/png')
      @category = Category.create(name: 'Travel', icon: icon, user_id: @user.id)
      @transaction = Transaction.create(name: 'Nairobi', amount: 380, author_id:  @user.id,
      category_id: @category.id)
    end

    it 'is created successfully' do
      expect(@transaction).to be_valid
    end

    it 'is invalid without a name' do
      @transaction.name = nil
      expect(@transaction).to_not be_valid
    end

    it 'is invalid without amount' do
      @transaction.amount = nil
      expect(@transaction).to_not be_valid
    end

    it 'amount must be a number' do
      @transaction.amount = 'house'
      expect(@transaction).to_not be_valid
    end

    it 'must have author ID' do
      @transaction.author_id = nil
      expect(@transaction).to_not be_valid
    end
  end
end
