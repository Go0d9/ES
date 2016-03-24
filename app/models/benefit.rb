class Benefit < ActiveRecord::Base
	validates :title, :description, :coefficient, presence: true
	has_many :list_benefits
end
