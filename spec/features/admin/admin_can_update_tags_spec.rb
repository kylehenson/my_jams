require 'rails_helper'

RSpec.describe 'admin can update tag' do
  context 'with admin logged in' do

    let(:admin) do
      User.create(first_name: 'Admin',
                  last_name: 'Admin',
                  username: 'admin',
                  password: 'password',
                  role: 1)
                end
    it 'edits a tag' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_tag_path
      fill_in 'Label', with: 'alternative'
      click_link_or_button 'Create Tag'

      expect(page).to have_content('List of Tags:')
      expect(page).to have_content('alternative')

      click_link_or_button 'Edit Tag'
      fill_in 'Label', with: 'indie'
      click_link_or_button 'Update Tag'

      expect(page).to have_content('Successfully updated tag')
      expect(page).to have_content('indie')
    end
  end
end
