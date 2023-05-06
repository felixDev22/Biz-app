
require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation tests' do
    before(:each) do
      first_user = User.create!(name: 'Felix', email: 'test@gmail.com', password: 'test12345')
      icon = fixture_file_upload(Rails.root.join('spec/fixtures/icons/uber.png'), 'image/png')
      @category = Category.create(name: 'Travel', icon: icon, user_id: first_user.id)
    end

    it 'is created successfully' do
      expect(@category.save).to eq true
    end

    it 'is invalid without a name' do
      @category.name = nil
      expect(@category.valid?).to eq false
    end

    it 'is invalid without an icon' do
      @category.icon = nil
      expect(@category.valid?).to eq false
    end

    it 'must have a user_id' do
      @category.user_id = nil
      expect(@category.valid?).to eq false
    end
  end
end
