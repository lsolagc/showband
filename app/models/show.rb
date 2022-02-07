class Show < ApplicationRecord

  has_and_belongs_to_many :musics

  accepts_nested_attributes_for :musics

  enum status: { closed: 0, open: 1}

end
