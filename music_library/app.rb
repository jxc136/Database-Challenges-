require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
DatabaseConnection.connect('music_library')

# # Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# # Print out each record from the result set .
# result.each do |record|
#   p record
# end

album_repository = AlbumRepository.new

# p album_repository.all.each do |record|
#   p record
# end

album = album_repository.find(2)
puts album.title
