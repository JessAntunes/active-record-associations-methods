class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
   song = Song.where(artist: self).first
   song.genre
  end

  def song_count
    #return the number of songs associated with the artist
    Song.where(artist: self).count
  end

  def genre_count
    #return the number of genres associated with the artist
    Song.where(artist: self).map do |song| 
      song.genre
    end.count
  end
end
