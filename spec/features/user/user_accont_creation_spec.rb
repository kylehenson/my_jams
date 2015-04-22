require 'rails_helper'

RSpec.describe 'user account creation' do
  context 'with valid attributes' do
    it 'creates an account' do
      visit new_user_path
      fill_in 'First name', with: 'Elon'
      fill_in 'Last name', with: 'Musk'
      fill_in 'Username', with: 'Elon'
      fill_in 'Password', with: 'Musk'
      fill_in 'Password confirmation', with: 'Musk'
      click_link_or_button 'Create User'

      expect(page).to have_content('Welcome Elon!')
    end
  end

  context 'with first name blank' do
    it 'does not create a new account' do
      visit new_user_path
      fill_in 'Last name', with: 'Musk'
      fill_in 'Username', with: 'Elon'
      fill_in 'Password', with: 'Musk'
      fill_in 'Password confirmation', with: 'Musk'
      click_link_or_button 'Create User'

      expect(page).to have_content("First name can't be blank")
    end
  end

  context 'with last name blank' do
    it 'does not create a new account' do
      visit new_user_path
      fill_in 'First name', with: 'Elon'
      fill_in 'Username', with: 'Elon'
      fill_in 'Password', with: 'Musk'
      fill_in 'Password confirmation', with: 'Musk'
      click_link_or_button 'Create User'

      expect(page).to have_content("Last name can't be blank")
    end
  end

  context 'with username blank' do
    it 'does not create a new account' do
      visit new_user_path
      fill_in 'First name', with: 'Elon'
      fill_in 'Last name', with: 'Musk'
      fill_in 'Password', with: 'Musk'
      fill_in 'Password confirmation', with: 'Musk'
      click_link_or_button 'Create User'

      expect(page).to have_content("Username can't be blank")
    end
  end

  context 'with password blank' do
    it 'does not create a new account' do
      visit new_user_path
      fill_in 'First name', with: 'Elon'
      fill_in 'Last name', with: 'Musk'
      fill_in 'Username', with: 'Elon'
      fill_in 'Password confirmation', with: 'Musk'
      click_link_or_button 'Create User'

      expect(page).to have_content("Password can't be blank")
    end
  end
end
