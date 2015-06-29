class Api::V1::ExperiencesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		@experiences = Experience.all
	end

	def show  
		@experience = Experience.find(params[:id])
	end


	def create
		user_id = current_user.student.id
		@experience = Experience.create({:start_date => params[:start_date], :end_date => params[:end_date], :job_title => params[:job_title], :job_details => params[:job_description],:company_name => params[:company_name], :student_id => user_id})
		experience_id = @experience.id

		params[:details].each do |detail|
			ExperienceDetail.create({:experience_id => experience_id, :detail => detail})
		end
		# @experience_details = ExperienceDetail.create({:experience_id => experience_id, details => [params[:detail]]})
		@student = @experience.student

		redirect_to "#{api_v1_students_path}.json"	
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
