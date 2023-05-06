require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  scenario 'show home page' do
    visit root_path
    assert page.has_content?('transaction')
  end

  scenario 'user can sign up' do
    visit new_user_registration_path
    fill_in('Email', with: 'test316@gmail.com')
    fill_in('Name', with: 'Felix')
    fill_in('Password', with: 'test12345')
    fill_in('Password_confirmation', with: 'test12345')
    click_button(class: 'registration-button')
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'show sign-in page' do
    User.create(name: 'Silver', email: 'silver@gmail.com', password: 'silver12345')
    visit new_user_session_path
    fill_in('Email', with: 'silver@gmail.com')
    fill_in('Password', with: 'silver12345')
    click_button(class: 'registration-button')
    expect(page).to have_content 'Signed in successfully.'
  end
end
