require 'pg'

class Bookmark
  attr_reader :url, :title
  def initialize(url, title)
    @title = title
    @url = url
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| Bookmark.new(bookmark['url'], bookmark['title'])}
  end

  def self.create(url, title)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
    Bookmark.new(url, title)
  end
end




