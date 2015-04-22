require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a song" do
    visit new_song_path
    fill_in "song[title]", with: "Great Song"
    fill_in "song[artist]", with: "Stellar Artist"
    click_link_or_button "Create Song"
    assert page.has_content?("Great Song")
    assert page.has_content?("Stellar Artist")
  end
end
