class Student < ActiveRecord::Base
	has_many :educations #always PLURAL
	has_many :experiences
	has_many :skills 
end
