# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
  def prerequisite
    if prereq_id
      return Course.find(prereq_id)
    end
  end

  def instructor
    if instructor_id
      return User.find(instructor_id)
    end
  end

  belongs_to :prerequisite, primary_key: :id, foreign_key: :prereq_id, class_name: :Course, optional: true #validate and don't panick
  has_many :future_class, primary_key: :id, foreign_key: :prereq_id, class_name: :Course
  has_many :enrollments, primary_key: :id, foreign_key: :course_id, class_name: :Enrollment
  # has_one :instructor, primary_key: :id, foreign_key: :instructor_id, class_name: :User
  belongs_to :instructor, primary_key: :id, foreign_key: :instructor_id, class_name: :User
  has_many :enrolled_students, through: :enrollments, source: :student
end
