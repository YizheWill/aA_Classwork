# frozen_string_literal: true

# class  documentation
class Band < ApplicationRecord
  validates :name, presence: true
end
