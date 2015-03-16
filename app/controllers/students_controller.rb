class StudentsController < ApplicationController

	def show  
		@student = Student.find(params[:id])
    	@educations = @student.educations
    	@experiences = @student.experiences
    	@skills = @student.skills
	end

	def update
		@student = Student.find(params[:id])
		@student.update({:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :phone_number => params[:phone_number], :linkedin => params[:linkedin], :twitter => params[:twitter], :blog => params[:blog], :online_resume => params[:online_resume], :github => params[:github], :photo => params[:photo], :short_bio => params[:short_bio]})
		
		redirect_to student_path(params[:id])
	end

end
