class Request < ApplicationRecord
  belongs_to :music
  belongs_to :show
  belongs_to :requester, class_name: "User"

  validates :music, presence: true

  def to_session_store
    {id: self.id, music: self.music.display_name}
  end

end
