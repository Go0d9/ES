class Benefit < ActiveRecord::Base
	validates :title, :description, :coefficient, :category_id, presence: false
	has_and_belongs_to_many :students
  belongs_to :category
end
