class Benefit < ActiveRecord::Base
	validates :title, :description, :coefficient, presence: true
	has_and_belongs_to_many :benefits
end
