require_relative '../../app'

feature "Add Bookmark" do
  scenario "Add a bookmark to the list" do 
    visit('/bookmarks')
    fill_in :url, with: "http://www.facebook.com"
    fill_in :title, with: 'Facebook'
    click_button 'Submit'
    expect(page).to have_link('Facebook', href: "http://www.facebook.com")
  end
end