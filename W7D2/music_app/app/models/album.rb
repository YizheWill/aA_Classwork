class Album < ApplicationRecord
  validates :name, :year, presence: true
  validates_inclusion_of :live, in: [true, false]
  belongs_to :band
  has_many :tracks, dependent: :destroy
end
