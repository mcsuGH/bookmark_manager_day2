require 'bookmarks.rb'

describe Bookmark do
  describe '.all' do
    it 'lists all bookmarks' do
      add_test_bookmarks
      bookmarks = Bookmark.all
      expect(bookmarks[0].title).to include "Makers"
      expect(bookmarks[1].title).to include "Destroy"
      expect(bookmarks[2].title).to include "Google"
    end
  end

  describe '.create' do
    it 'adds to the list of bookmarks' do
      add_test_bookmarks
      Bookmark.create("http://www.facebook.com", "Facebook")
      bookmarks = Bookmark.all
      expect(bookmarks[-1].title).to include("Facebook")
      expect(bookmarks[-1].url).to eq "http://www.facebook.com"
    end
  end

  describe '.delete' do
    it 'deletes from the list of bookmarks' do
      bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
      Bookmark.delete(id: bookmark.id)
      p Bookmark.all
      expect(Bookmark.all.length).to eq 0
    end
  end
end
