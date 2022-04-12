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
end
