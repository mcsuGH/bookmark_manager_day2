require_relative '../../app'

feature "Add Bookmark" do
  scenario "Add a bookmark to the list" do 
    visit('/bookmarks')
    fill_in :url, with: "http://www.facebook.com"
    click_button 'Submit'
    expect(page).to have_content("http://www.facebook.com")
  end
end