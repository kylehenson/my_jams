require 'rails_helper'

RSpec.describe 'user can log out' do
  context 'when already logged in' do
    it 'logs out user' do
      User.create(first_name: 'Frank',
                  last_name: 'Gallagher',
                  username: 'frank',
                  password: 'fg',
                  password_confirmation: 'fg')
      visit login_path
      fill_in 'session[username]', with: 'frank'
      fill_in 'session[password]', with: 'fg'
      click_link_or_button 'Login'

      expect(page).to have_content('Welcome Frank!')

      click_link_or_button 'Logout'
      expect(page).to have_content('Successfully logged out.')
    end
  end
end
