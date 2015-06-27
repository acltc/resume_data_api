class Api::V1::ExperiencesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		@experiences = Experience.all
	end

	def show  
		@experience = Experience.find(params[:id])
	end

	def create
# :job_description => job['jobDescription'], this will have to get added after Shlomos migrations
		user_id = current_user.student.id
		params["_json"].each do |job|
			@experience = Experience.create({:start_date => job['startDate'], :end_date => job['endDate'], :job_title => job['jobTitle'], :company_name => job['companyName'], :student_id => user_id})
			experience_id = @experience.id

			job["details"].each do |each_detail|
				if each_detail["detail"]
					ExperienceDetail.create({:experience_id => experience_id, :detail => each_detail["detail"]})
				end
			end
		end

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
