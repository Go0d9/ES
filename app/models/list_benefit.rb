class ListBenefit < ActiveRecord::Base
	belongs_to :student	
	has_many :benefit
end
