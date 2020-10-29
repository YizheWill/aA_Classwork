class Artwork < ApplicationRecord
  validates :artist_id, uniqueness: { scope: :title}
  #prepare for the bug
end