require 'pg'

class Bookmark
  attr_reader :url, :title, :id
  def initialize(url, title, id)
    @title = title
    @url = url
    @id = id
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| Bookmark.new(bookmark['url'], bookmark['title'], bookmark['id'])}
  end

  def self.create(url:, title: )
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec_params(
      "INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title]
      )
    Bookmark.new(result[0]['url'], result[0]['title'], result[0]['id'])
  end

  def self.delete(id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [id])
  end

  def self.find(id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec_params("SELECT * FROM bookmarks WHERE id = $1;", [id])
    Bookmark.new(result[0]['url'], result[0]['title'], result[0]['id'])
  end

  def self.update(id:, url:, title:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec_params(
      "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3 RETURNING id, url, title;",
      [url, title, id]
    )
    Bookmark.new(result[0]['url'], result[0]['title'], result[0]['id'])
  end
end




