class ExperiencesController < ApplicationController

	def update
		@experience = Experience.find(params[:id])
		@experience.update({:start_date => params[:start_date], :end_date => params[:end_date], :job_title => params[:job_title], :company_name => params[:company_name]})
	end

	def create
		@experience = Experience.create({:start_date => params[:start_date], :end_date => params[:end_date], :job_title => params[:job_title], :company_name => params[:company_name], :student_id => params[:student_id]})
	end

	def delete
		@experience = Experience.find(params[:id])
		@experience.destroy
	end
end
