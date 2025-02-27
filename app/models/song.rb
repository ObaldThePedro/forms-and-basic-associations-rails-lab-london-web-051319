class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
      self.artist.name if self.artist
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(content)
    content.each do |content|
    note = Note.find_or_create_by(content: content)
    self.notes << note
    end
  end

  def note_contents
    notes = []
    self.notes.each do |note|
      notes << note.content if note.content != ""
      end
    notes
  end
end
