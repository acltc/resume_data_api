class ExperiencesController < ApplicationController

	def show  
		@experience = Experience.find(params[:id])
	end


	def create
		@experience = Experience.create({:start_date => params[:start_date], :end_date => params[:end_date], :job_title => params[:job_title], :company_name => params[:company_name], :student_id => params[:student_id]})
		@student = @experience.student
		render "students/show"		
	end

	def update
		@experience = Experience.find(params[:id])
		@experience.update({:start_date => params[:start_date], :end_date => params[:end_date], :job_title => params[:job_title], :company_name => params[:company_name]})
		@student = @experience.student
		render "students/show"		
	end

	def delete
		@experience = Experience.find(params[:id])
		@student = @experience.student
		@experience.destroy
		render "students/show"
	end
end
