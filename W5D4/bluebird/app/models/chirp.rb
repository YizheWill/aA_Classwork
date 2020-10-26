# == Schema Information
#
# Table name: chirps
#
#  id        :bigint           not null, primary key
#  body      :text             not null
#  author_id :integer          not null
#
class Chirp < ApplicationRecord
  #belongs to will automatically validated
  has_many :likes, primary_key: :id, foreign_key: :chirp_id, class_name: :Like
  belongs_to :author, primary_key: :id, foreign_key: :author_id, class_name: :User
  validates :body, presence: true
  # validates :author_id, presence: true # belongs to takes care of it.
  validate :body_too_long

  def body_too_long
    if body && body.length > 140
      errors[:body] << "is too long"
      #just adding something to the errors will fail the validation
    end
  end

  has_many :likers,
    through: :likes,
    source: :liker
  #这个得再看一遍，多看几遍maybe



  User.find_by(username: 'like_mike').chirps
  # 两个query一起跑
end
