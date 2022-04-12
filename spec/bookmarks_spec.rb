require 'bookmarks.rb'

describe Bookmark do
  describe '.all' do
    it 'lists all bookmarks' do
      Bookmark.create("http://www.makersacademy.com")
      Bookmark.create("http://www.destroyallsoftware.com")
      Bookmark.create("http://www.google.com")
      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end

  describe '.create' do
    it 'adds to the list of bookmarks' do
      add_test_bookmarks
      Bookmark.create("http://www.facebook.com")
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.facebook.com")
    end
  end
end
