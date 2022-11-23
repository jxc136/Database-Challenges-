require 'album_repository'
require 'spec_helper'

RSpec.describe AlbumRepository do

  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end


  before(:each) do 
  reset_albums_table
  end

  it 'do' do
    repo = AlbumRepository.new 

    albums = repo.all # => 

    expect(albums.length).to eq 2
    expect(albums.first.id).to eq '1' 
    expect(albums.first.title).to eq "A Day at the Races"
    expect(albums.first.release_year).to eq "1976"
  end

  it 'returns a specific single album' do 

    repo = AlbumRepository.new 

    albums = repo.find(1)

    expect(albums.title).to eq 'A Day at the Races'
    expect(albums.release_year).to eq '1976'
    expect(albums.artist_id).to eq '5'

  end 

  it 'returns another specific single album' do 

    repo = AlbumRepository.new 

    albums = repo.find(2)

    expect(albums.title).to eq 'News of the World'
    expect(albums.release_year).to eq '1977'
    expect(albums.artist_id).to eq '5'

  end 

  it 'creates a new album' do 

    repo = AlbumRepository.new 

    new_album = Album.new
    new_album.name = 'Midnights'
    new_album.release_year = '2022'
    new_album.artist_id = '3'

    repo.create(new_album)

    albums = repo.all
    last_album = albums.last

    expect(last_album.name).to eq 'Midnights'
    expect(last_album.release_year).to eq '2022'
    expect(last_album.artist_id).to eq '3'

    expect(albums.length).to eq 3

  
  end 
  
end
