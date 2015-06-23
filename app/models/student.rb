class Student < ActiveRecord::Base
	has_many :educations #always PLURAL
	has_many :experiences
	has_many :personal_skills 
  has_many :references
  
  belongs_to :user
end
