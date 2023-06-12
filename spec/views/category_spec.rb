require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  before(:each) do
    User.create(name: 'Silver', email: 'silver@gmail.com', password: 'silver12345')
    visit new_user_session_path
    fill_in('Email', with: 'silver@gmail.com')
    fill_in('Password', with: 'silver12345')
    click_button(class: 'registration-button')
  end

  scenario 'show New category page' do
    visit categories_path
    expect(page).to have_content('New category')
  end

  scenario 'create new category' do
    visit new_category_path
    fill_in('Name', with: 'Travel')
    expect(page).to have_css("input[type='file']")

    fill_in 'Name', with: 'Travel'
    page.attach_file(Rails.root.join('spec', 'fixtures', 'icons', 'uber.png'), visible: false)
    click_button 'Save'

    expect(page).to have_content('Category was successfully created')
  end
end
