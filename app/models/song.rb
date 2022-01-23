class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.collect { |note| note.content }
  end

  def note_contents=(contents)
    contents.each do |c|
      self.notes << Note.find_or_create_by(content: c)
    end
  end


end
