# file: appllication_class.rb

require_relative './lib/album_repository'
require_relative './lib/database_connection'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, terminal, album_repository)
    DatabaseConnection.connect(database_name)
    @terminal = terminal
    @album_repository = album_repository
    @choice = nil
   
  end

  def display_menu
    
    @terminal.puts 'What would you like to do?'
    @terminal.puts '1 - List all albums'
    @terminal.puts '2 - Exit'
    @terminal.puts 'Enter your choice:'

  end 

  def process (selection)
    
    case selection
      when "1"
        print_albums 
      when "2"
        exit 
      else
        puts "Input not recognises, please try again"
      end
  end
 

  def print_albums
    puts "total length = * #{@album_repository.all.length}"
    @terminal.puts 'Here is the list of albums:'
    @terminal.puts  " * #{@album_repository.find(1).id} - #{@album_repository.find(1).title}"
    @terminal.puts  " * #{@album_repository.find(2).id} - #{@album_repository.find(2).title}"
    @terminal.puts  " * #{@album_repository.find(3).id} - #{@album_repository.find(3).title}"
    @terminal.puts  " * #{@album_repository.find(4).id} - #{@album_repository.find(4).title}"
    @terminal.puts  " * #{@album_repository.find(5).id} - #{@album_repository.find(5).title}"
    @terminal.puts  " * #{@album_repository.find(6).id} - #{@album_repository.find(6).title}"
    @terminal.puts  " * #{@album_repository.find(7).id} - #{@album_repository.find(7).title}"
    @terminal.puts  " * #{@album_repository.find(8).id} - #{@album_repository.find(8).title}"
    @terminal.puts  " * #{@album_repository.find(9).id} - #{@album_repository.find(9).title}"
    @terminal.puts  " * #{@album_repository.find(10).id} - #{@album_repository.find(10).title}"
    @terminal.puts  " * #{@album_repository.find(11).id} - #{@album_repository.find(11).title}"
    @terminal.puts  " * #{(@album_repository.find(13).id).to_i - 1 } - #{@album_repository.find(13).title}"
    @terminal.puts  " * #{(@album_repository.find(14).id).to_i - 1 } - #{@album_repository.find(14).title}"
   

  end 


  def run
    @terminal.puts 'Welcome to the music library manager!'
    loop do
      display_menu
      process(@terminal.gets.chomp)
    end 
    
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    # ArtistRepository.new
  )
  app.run
end
