require_relative './album'
class AlbumRepository

  def all
   # Executes the SQL query:
   # SELECT id, title, release_year, artist_id FROM albums;
   # Returns an array of album objects.

   sql = 'SELECT id, title, release_year, artist_id FROM albums;'

   result_set = DatabaseConnection.exec_params(sql, [])

   albums = []

   result_set.each do |record|

    album = Album.new 
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']
    album.artist_id = record['artist_id']
    
    albums << album
   end 

   return albums
  end
  
  def find(id)

    #returns a single album object
    #Given the ID number as an integer in the argument 

    sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    album = Album.new
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']
    album.artist_id = record['artist_id']

    return album

  end 

end 