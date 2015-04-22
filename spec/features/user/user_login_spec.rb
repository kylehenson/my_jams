require 'rails_helper'

RSpec.describe 'user can login' do
  context 'with valid attributes' do
    it 'routes to user dashboard' do
      User.create(first_name: 'Brad',
                  last_name: 'Pitt',
                  username: 'brad',
                  password: 'angelina',
                  password_confirmation: 'angelina')
      visit login_path
      fill_in 'session[username]', with: 'brad'
      fill_in 'session[password]', with: 'angelina'
      click_link_or_button 'Login'

      expect(page).to have_content('Welcome Brad!')
    end
  end

  context 'with username blank' do
    it 'does not route to user dashboard' do
      User.create(first_name: 'Brad',
                  last_name: 'Pitt',
                  username: 'brad',
                  password: 'angelina',
                  password_confirmation: 'angelina')
      visit login_path
      fill_in 'session[password]', with: 'angelina'
      click_link_or_button 'Login'

      expect(page).to have_content('Invalid login')
    end
  end
end
