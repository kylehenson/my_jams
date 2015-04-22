require 'rails_helper'

RSpec.describe 'User creates a song' do
  context 'with valide attributes' do
    it 'saves and displays the song title' do
      visit new_song_path
      fill_in "song[title]", with: "Great Song"
      fill_in "song[artist]", with: "Stellar Artist"
      click_link_or_button "Create Song"
      expect(page).to have_content("Great Song")
      expect(page).to have_content("Stellar Artist")
    end
  end
end
