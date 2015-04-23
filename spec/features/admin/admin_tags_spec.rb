require 'rails_helper'

RSpec.describe 'admin tags' do
  context 'with admin logged in' do

    let(:admin) do
      User.create(first_name: 'Admin',
                  last_name: 'Admin',
                  username: 'admin',
                  password: 'password',
                  role: 1)
                end

    it 'displays tags' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_tags_path
      expect(page).to have_content("List of Tags:")
    end
  end

end
