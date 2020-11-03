class Cat < ApplicationRecord
    CAT_COLORS = ['white', 'black', 'orange', 'gray','blue', 'brown']
    GENDER = ['F', 'M']

    validates :color, presence: true, inclusion: { in: CAT_COLORS}
    validates :sex, presence: true, inclusion: { in: GENDER}
    validates :birth_date, presence: true
    validates :name, presence: true
    validates :description, presence: true

    def age
        c_year, c_month, c_date = Time.now.to_s.split("-")[0..2].map(&:to_i)
        c_year - b_year - (c_month == b_month ? (c_date >= b_date ? 0 : 1) : (c_month > b_month ? 0 : 1))
    end  
end

