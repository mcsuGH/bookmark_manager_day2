require 'pg'

def truncate_database 
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("TRUNCATE TABLE bookmarks;")
end

def add_test_bookmarks
    Bookmark.create("http://www.makersacademy.com", "Makers")
    Bookmark.create("http://www.destroyallsoftware.com", "Destroy")
    Bookmark.create("http://www.google.com", "Google")
end
