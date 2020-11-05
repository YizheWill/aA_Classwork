class Comment < ApplicationRecord
  belongs_to :auther, foreign_key: :author_id, class_name: :User
  belongs_to :user_commented_on, foreign_key: :user_commented_on_id, class_name: :User
  belongs_to :goal
end
