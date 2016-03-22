class Benefit < ActiveRecord::Base
	validates :title, :description, :coefficient, presence: true
end
