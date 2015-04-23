require 'rails_helper'

RSpec.describe 'admin create tags' do
  context 'with admin logged in' do

    let(:admin) do
      User.create(first_name: 'Admin',
                  last_name: 'Admin',
                  username: 'admin',
                  password: 'password',
                  role: 1)
                end

    it 'allows creation of tags' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_tag_path
      fill_in 'Label', with: 'alternative'
      click_link_or_button 'Create Tag'

      expect(page).to have_content('List of Tags:')
      expect(page).to have_content('alternative')
    end
  end

end
