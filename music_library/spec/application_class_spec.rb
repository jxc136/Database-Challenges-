require_relative '../application_class'

RSpec.describe Application do
  
  xit 'greets the user and asks for an input' do 

    terminal = double :terminal
    expect(terminal).to receive(:puts).with('Welcome to the music library manager!')
    expect(terminal).to receive(:puts).with('What would you like to do?')
    expect(terminal).to receive(:puts).with('1 - List all albums')
    expect(terminal).to receive(:puts).with('2 - Exit')
    expect(terminal).to receive(:puts).with('Enter your choice:')
    application = Application.new('music_library_test', terminal, AlbumRepository.new)
    application.run
  end 

  xit 'prints_all_albums' do 

    terminal = double :terminal
    expect(terminal).to receive(:puts).with('Welcome to the music library manager!')
    expect(terminal).to receive(:puts).with('What would you like to do?')
    expect(terminal).to receive(:puts).with('1 - List all albums')
    expect(terminal).to receive(:puts).with('2 - Exit')
    expect(terminal).to receive(:puts).with('Enter your choice:')
    expect(terminal).to receive(:gets).and_return('1')
    expect(terminal).to receive(:puts).with('Here is the list of albums:')
    expect(terminal).to receive(:puts).with(" * 1 - A Day at the Races")
    expect(terminal).to receive(:puts).with(" * 2 - News of the World")
    expect(terminal).to receive(:puts).with(" * 3 - Midnights")
    application = Application.new('music_library_test', terminal, AlbumRepository.new)
    application.run
  end 

end


# $ ruby app.rb

# Welcome to the music library manager!

# What would you like to do?
#  1 - List all albums
#  2 - List all artists

# Enter your choice: 1
# [ENTER]

# Here is the list of albums:
#  * 1 - Doolittle
#  * 2 - Surfer Rosa
#  * 3 - Waterloo
#  * 4 - Super Trouper
#  * 5 - Bossanova
#  * 6 - Lover
#  * 7 - Folklore
#  * 8 - I Put a Spell on You
#  * 9 - Baltimore
#  * 10 -	Here Comes the Sun
#  * 11 - Fodder on My Wings
#  * 12 -	Ring Ring