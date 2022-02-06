class Music < ApplicationRecord

  has_and_belongs_to_many :shows

  def display_name
    "#{self.artist} | #{self.title}"
  end

  def self.collection(musics)
    musics.map{|m| [m.display_name, m.id] }
  end

end
