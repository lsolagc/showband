class Show < ApplicationRecord

  has_and_belongs_to_many :musics

  accepts_nested_attributes_for :musics

end
