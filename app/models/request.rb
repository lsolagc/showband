class Request < ApplicationRecord
  belongs_to :music
  belongs_to :show

  validates :music, presence: true

  def to_session_store
    {id: self.id, music: self.music.display_name}
  end

end
