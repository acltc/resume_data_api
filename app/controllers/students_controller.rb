class StudentsController < ApplicationController

	def show  
		@student = Student.find(params[:id])
    @educations = @student.educations
    @experiences = @student.experiences
    @skills = @student.skills
	end

end
