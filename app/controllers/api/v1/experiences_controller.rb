class Api::V1::ExperiencesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		@experiences = Experience.all
	end

	def show  
		@experience = Experience.find(params[:id])
	end

	def create
		@student = current_user.student
		user_id = @student.id
		params["_json"].each do |job|
			@experience = Experience.create({:start_date => job['startDate'], :end_date => job['endDate'], :job_title => job['jobTitle'], :company_name => job['companyName'], :job_description => job['jobDescription'], :student_id => user_id})
			experience_id = @experience.id
			job["details"].each do |each_detail|
				if each_detail["detail"]
					ExperienceDetail.create({:experience_id => experience_id, :detail => each_detail["detail"]})
				end
			end
		end
		redirect_to "#{api_v1_students_path}.json"
	end

	def update
		@student = current_user.student
		user_id = @student.id
		@experiences = Experience.where(:student_id => user_id)
		if @experiences.length > params["_json"].length
			need_to_delete = true
			experiences_needing_to_be_deleted = @experiences.length - params["_json"].length
			experiences_to_delete_counter = params["_json"].length
		end
		params["_json"].each_with_index do |job, index|
			if @experiences[index]
				@experiences[index].update({:start_date => job['startDate'], :end_date => job['endDate'], :job_title => job['jobTitle'], :company_name => job['companyName'], :job_description => job['jobDescription']})
			else
				Experience.create({:start_date => job['startDate'], :end_date => job['endDate'], :job_title => job['jobTitle'], :company_name => job['companyName'], :job_description => job['jobDescription'], :student_id => user_id})
			end
		end
		if need_to_delete
			experiences_needing_to_be_deleted.times do
				@experiences[experiences_to_delete_counter].destroy
				experiences_to_delete_counter += 1
			end
		end
		redirect_to "#{api_v1_students_path}.json"		
	end

	def delete
		@experience = Experience.find(params[:id])
		@student = @experience.student
		@experience.destroy
		render "students/show"
	end
end
