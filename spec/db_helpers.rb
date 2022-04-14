require 'pg'

def truncate_database 
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("TRUNCATE TABLE bookmarks;")
end

def add_test_bookmarks
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy")
    Bookmark.create(url: "http://www.google.com", title: "Google")
end
