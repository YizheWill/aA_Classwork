# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  age        :integer          not null
#
class User < ApplicationRecord
  has_many :chirps, primary_key: :id, foreign_key: :author_id, class_name: :Chirp
  has_many :likes, primary_key: :id, foreign_key: :liker_id, class_name: :Like
  validates :username, :email, :age, presence: true
  validates :username, :email, uniqueness: true
  has_many :liked_chirps,
    through: :likes, #must be association name! from this class
    source: :chirp #must be association name! to chirps
end
