class Api::V1::ExperiencesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def show  
		@experience = Experience.find(params[:id])
	end

	def create
		@student = current_user.student
		user_id = @student.id
		angular_experiences.each do |job|
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
		user_id = params[:id]
		db_experiences = Experience.where(:student_id => user_id)
		angular_experiences = params["_json"]
		need_to_delete = false
		if db_experiences.length > angular_experiences.length
			need_to_delete = true
			experiences_needing_to_be_deleted = db_experiences.length - angular_experiences.length
			experiences_to_delete_counter = angular_experiences.length
		end
		angular_experiences.each_with_index do |angular_experience, index|
			if db_experiences[index]
				db_experiences[index].update({:start_date => angular_experience['start_date'], :end_date => angular_experience['end_date'], :job_title => angular_experience['job_title'], :company_name => angular_experience['company_name'], :job_description => angular_experience['job_description']})
				db_experience_details = db_experiences[index].experience_details
				angular_experience_details = angular_experience["details"]
				
			else
				Experience.create({:start_date => angular_experience['start_date'], :end_date => angular_experience['end_date'], :job_title => angular_experience['job_title'], :company_name => angular_experience['company_name'], :job_description => angular_experience['job_description'], :student_id => user_id})
			end
		end
		if need_to_delete
			experiences_needing_to_be_deleted.times do
				db_experiences[experiences_to_delete_counter].destroy
				experiences_to_delete_counter += 1
			end
		end
	end

	def delete
		@experience = Experience.find(params[:id])
		@student = @experience.student
		@experience.destroy
		render "students/show"
	end
end
