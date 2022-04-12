require_relative '../../app.rb'

feature 'Homepage' do
  scenario 'User can see Bookmark Manager' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

feature 'View bookmarks' do
  scenario 'User can see bookmarks' do
    add_test_bookmarks
    visit('/bookmarks')
    expect(page).to have_content "Google"
  end
  scenario 'Bookmarks have buttons' do
    add_test_bookmarks
    visit('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
  end
end

