class Student < ActiveRecord::Base
	#attr_accessible :second_name, :first_name, :middle_name, :group, :sex
	# Validates for table Students.
	validates :group,  numericality: {greater_then: 0, allow_nil: true}, presence: true
	validates :second_name, :first_name, :middle_name, presence: true

	has_one :list_benefits
	has_many :benefits
end
